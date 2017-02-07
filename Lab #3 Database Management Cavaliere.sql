--Ronald Cavaliere   Lab #3
--February 6 2017

--List the order number and total dollars of all orders.
select ordNumber, totalusd
from Orders;

--List the name and city of agents named Smith.
select name, city
from Agents
where name = 'Smith'
Order by city ASC;

--List the id, name, and price of products with a quantity more than 200,100.
select pid, name, priceusd
from Products
where quantity >= 200100;

--List the names and cities of customers in Duluth.
select name, city
from customers
where city = 'Duluth'
Order by name ASC;

-- List the names of agents not in New York and not in Dultuh.
select name, city
from Agents
where city != 'New Yorl' and city != 'Duluth'
Order by name ASC;

--List all data for products  in neither Dallas nor Duluth that cost US$1 or more.
select * 
from Products
where city not in ('Dallas', 'Duluth') and priceusd >= 1.00;

--List all data for orders in February or May.
Select *
from Orders
where month = 'Feb' or month = 'May';

--List all data for orders in February of US$600 or more.
select *
from Orders
where month = 'Feb' and totalusd >= 600;

--List all orders from customers whose cid is C005.
select *
from Orders
where cid = 'c005';

--I love PostgreSQL! This assignment was so fun because I got to use it!