-- Add a gender column to the employees table
alter table employees add gender char(1);

--Update the employees table and set the gender
update employees 
set gender = 'F' 
where first_name='Deb';

update employees 
set gender = 'M' 
where gender is null;

--Update Bob Starks Address to be that of Cover My Meds at Miranova
update customers 
set address_line_1='2 Miranova Pl'
  , City='Columbus'
  , zip='43215' 
where first_name='Bob' 
  and last_name='Stark';

--Add a base price column to the pizzas table
alter table pizzas add base_price money;


--Update the base price of each pizza size
update pizzas 
set base_price = pizza_size_inches * 0.75;

--Advanced: Add a column to the orders table that will allow us to track the size of the pizza ordered.
alter table orders add pizza_id int references pizzas(id)

