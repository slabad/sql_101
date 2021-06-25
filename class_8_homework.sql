Create the SQL statements that can do the following

--Update all orders that contain mushrooms and add $0.50 to the total
update orders 
set cost=cost+.50 
from orders 
join orders_toppings on orders.id=orders_toppings.order_id 
join toppings on orders_toppings.topping_id=toppings.id 
where name='mushrooms'

--Update all orders for Bob Smith to be delivery
update orders 
set delivery=1 
from orders 
join customers on orders.customer_id=customers.id 
where first_name='Bob' and last_name='Smith'

--Change the state for all the customers who had an order that cost more than $100
update customers
set state = 'CA'
from orders 
join customers on customers.id = orders.customer_id
where orders.cost > 100;

--Change the topping of onions to anchovies on three orders from bexley
update top(100) orders_toppings 
set topping_id = (select id from toppings where name = 'anchovies')
from customers 
join orders on customers.id = orders.customer_id
join orders_toppings on orders.id = orders_toppings.order_id
join toppings on toppings.id = orders_toppings.topping_id
where toppings.name = 'onion'
  and city = 'Bexley';
