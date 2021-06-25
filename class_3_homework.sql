use sql_101;

--How much does the topping mushrooms cost per 1 weight?
select cost_per_one_weight 
from toppings 
where name='mushrooms';

--What is Bob Wayne's address?
select 
	 address_line_1
	,address_line_2
	,city
	,state
	,zip 
from customers 
where first_name='Bob' 
	and last_name='Wayne'

--What are the last names of any 3 of the Employees?
select top 3 
	last_name 
from employees  

--Which topping costs the mosts?
select 
	max(cost_per_one_weight)
from toppings --(Result set gives 0.30)
select 
	name 
from toppings 
where cost_per_one_weight=0.30

--or use a subquery
select 
	name 
from toppings 
where cost_per_one_weight=(
	select max(cost_per_one_weight) 
	from toppings)

--How many customers are there?
select 
	count(*) 
from customers;

--What is the longest first name of a customer?
select top 2 first_name 
from customers 
order by len(first_name) 
desc; 
--(Top 2 to check for a tie, top 1 would also work)

--What last name shows up the most in the customers table?
select top 1 last_name 
from customers 
group by last_name 
order by count(*) desc;

--How many different cities are used in the customers table?
select city 
from customers 
group by city;


How much do all the orders cost together?
select sum(cost) from orders

Advanced:  How much do anchovies increase the cost of a 16" Pizza?
select cost_per_one_weight * weight_16 from toppings where name='anchovies';
