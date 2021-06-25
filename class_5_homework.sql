--Create insert statements to perform the following tasks

--Add 2 more toppings, then get the IDs for those toppings , you will need then for question 5
insert into toppings(name, cost_per_one_weight, weight_12, weight_14,weight_16) 
values('hot peppers',5,12,16,20)
    , ('roasted red peppers',7,10,13,16)

select id, name 
from toppings 
where name in ('hot peppers','roasted red peppers')

--Add 3 more customers, get the IDs for those customers, you will need then for question 3
insert into customers(first_name, last_name, address_line_1, address_line_2, city, state, zip, phonenumber) 
values ('batman','darkknight','1 batcave','c.o. Alfred','Gotham','NY','00200','18004228626')
      ,('Darth','Vadar','DeathStar',null,'Space','NA','00000',null)
      ,('Marvin','Martian','Mars','Planet','N/A','NA',null,null)

select id, first_name, last_name 
from customers 
where first_name in ('batman','Darth','Marvin') 
  and last_name in ('darkknight','martian','Vadar')

--Add 3 orders for one of your customers that cost 5,10 & 15$ that are not delivery
insert into orders(customer_id, cost, delivery) 
values (1907,5,0)
     , (1907,10,0)
     , (1907,15,0)

--Add a new pizza size, your choice
insert into pizzas (pizza_inches) 
values(24)

--Add a new order for an existing customer that is a delivery, using 3 toppings, 2 of which you created in question 1
insert into orders(customer_id, cost, delivery) 
values(25, 15, 1)

select * 
from orders 
where customer_id=25 
  and cost=15 
  and delivery=1 
order by id desc 
--(order by id desc, because the newest order will have the highest ID value)

insert into orders_toppings(order_id, topping_id) 
values(10113,17)
     ,(10113,18)
     ,(10113,3)

--Advanced:  One of your customers, Bob Grayson, repeats his first order. Copy that order as a new order including the toppings.
insert into orders(customer_id, delivery, cost) 
select top 1 customer_id, delivery, cost 
from orders 
join customers on orders.customer_id=customers.id 
where first_name='Bob' 
  and last_name='Grayson' 
order by orders.id asc (
--top 1 and asc to only use the data from their first order)
