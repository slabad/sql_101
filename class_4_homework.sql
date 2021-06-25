--Who has the most expensive order?
select top 1 
	first_name
	,last_name
	,cost
from orders 
join customerson orders.customer_id=customers.id
order by cost desc 

--What are the toppings on the cheapest order? –More than 1 topping
select 
	 name
	,cost
	,orders.id
from toppings 
join orders_toppings on toppings.id=orders_toppings.topping_id
join orders on orders.id=orders_toppings.order_id
where orders.id = 
	(select top 1 
		id 
	from orders
	order by cost asc)
order by cost asc 


--Which customer had the most deliveries? 	
select top 1 
	 first_name
	,last_name
	,count(*) 	
from orders	
join customers on orders.customer_id=customers.id	
where delivery = '1'
group by first_name, last_name	
order by count(*)  desc

--Who has ordered the least times?		
select top 1 
	 first_name
	,last_name
	,count(*) 
from orders
join customers on orders.customer_id=customers.id
group by first_name, last_name
order by count(*) asc

--Who has ordered the most times?		
select top 1 
	 first_name
	,last_name
	,count(*) 	
from orders	
join customers on orders.customer_id=customers.id	
group by first_name, last_name	
order by count(*) desc


--Which City was delivered to the most times?
select top 3 
    city
  , count(*) 
from customers 
join orders on customers.id=orders.customer_id 
where delivery = 1 
group by city 
order by count(*) desc 
--(top 3 incase of a tie)

--What are the five most ordered toppings?
select top 7 
    name
  , count(*) 
from toppings 
join orders_toppings on toppings.id=orders_toppings.topping_id 
group by name 
order by count(*) desc

--What are the all the toppings that  Bob Stark has ordered?
select 
  name 
from toppings 
join orders_toppings on toppings.id=orders_toppings.topping_id 
join orders on orders.id=orders_toppings.order_id 
join customers on orders.customer_id=customers.id 
where first_name='bob' 
  and last_name='stark' 
group by name

--What is the address of the customer that has ordered the most non-delivery orders?
select top 3 
    address_line_1
  , city,state
  , zip
  , customers.id
  , count(*) 
from customers 
join orders on customers.id=orders.customer_id 
where delivery = 0 
group by address_line_1, city, state, zip, customers.id 
order by count(*) 
desc --(top 3 incase of a tie)


