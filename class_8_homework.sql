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
