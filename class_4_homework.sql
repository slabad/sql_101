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

