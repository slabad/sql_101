--Create delete statements to perform the following tasks

--First determine if the question is possible and then try the question and see if you were correct

--Delete the cheapest order
  --Not possible, orders are referenced in orders_toppings, unless you have an order with no toppings 
  --(to find cheapest order:
  select id, cost from orders order by cost asc)

--Delete the least favorite topping 
  --Not possible, if all toppings are used, then it is referenced in orders_toppings,  
  --to find least favorite topping, which implies used, 
  select name 
  from toppings 
  join orders_toppings on toppings.id=orders_toppings.topping_id 
  group by name 
  order by count(*) asc


--Delete the customer with no orders
  --possible, 
  delete from customers 
  where id not in 
    (select customer.id 
     from customers 
     join orders on customers.id=orders.customer_id)

--Delete the cheapest topping
  --Depends, if the cheapest topping is not used possible, if it's used, not possible, to delete 
  delete from toppings 
  where id = 
    (select top 1 id 
     from toppings 
     order by cost asc) 

--Advanced: Bob Smith called and requested all his personal data be removed.  Write sql statements that will remove is customer data and any dependent data. 
  --possible, you can remove the personal info and not delete the customer record, 
  update customers 
  set first_name=null
    , last_name=null
    , address_line_1=null
    , address_line_2=null
    , city=null
    , state=null
    , zip=null 
  where first_name='Bob' 
  and last_name='Smith';
