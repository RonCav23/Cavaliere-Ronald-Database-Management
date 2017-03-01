--Ronald Cavaliere
--Lab #6
--Database Management
--Professor Labouser

--Display the name and city of customers who live in any city that makes the most different kinds of products.
select city, name
from customers
where city in (
	select city 
	from products p
	group by p.city
	order by count (p.city) DESC
	limit 1);

--Display the names of products whose priceUSD is strictly above the average priceUSD, in reverse-alphabetical order.
select name
from products
where priceUSD > (select avg(priceUSD)
		  from products)
Order by name DESC;

--Display the customer name, pid ordered, and the total for all orders, sorted by total from low to high.
select name, o.pid, o.totalUSD
from orders o INNER JOIN customers c on o.cid = c.cid
order by o.totalUSD ASC;

--Display all customer names and their total ordered, and nothing more.
select name, coalesce (sum (o.qty),0) as "Order Total"
from orders o RIGHT OUTER JOIN customers c on o.cid = c.cid 
group by name
order by name ASC;

--Display the names of all customers who bought products from	agents based in	Newark along with the names of	the products they ordered, 
-- and the names of the agents who sold it to them.	
select c.cid, c.name, p.name, a.name
from orders o INNER JOIN customers c on o.cid = c.cid
	      INNER JOIN products  p on o.pid = p.pid
	      INNER JOIN agents    a on o.aid = a.aid
where a.city = 'Newark';

--Write	a query	to check the accuracy of the totalUSD column in the Orders table. This means calculating Orders.totalUSD from data in other tables	
--and comparing	those values to	the values in Orders.totalUSD.	Display	all rows in Orders where Orders.totalUSD is incorrect,	if any.	
SELECT *
FROM (SELECT o.*, o.qty*p.priceusd*(1-(discount/100)) AS realUSD
      FROM orders o INNER JOIN products p on o.pid = p.pid
		    INNER JOIN customers c on  o.cid = c.cid) AS alias
WHERE totalUSD != realUSD

--What is the difference between Left Outer Join and Right Outer Join. Give examples
--Left Outer Join
--When using the left outer join you are returning all rows from the left table along with the matching rows of the right table.
--For the rows that do not have a match in the right table, the result will be NULL.
select *
from orders o LEFT OUTER JOIN customers c on c.cid = o.cid;
--Right Outer Join
--When using the right outer join you are returning all rows from the right table along with the matching rows of the left table.
--For the rows that do not have a match in the left table, the result will be NULL.
select *
from orders o RIGHT OUTER JOIN customers c on c.cid = o.cid;