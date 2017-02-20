--Ronald Cavaliere
--Lab #5
--Database Management
--Professor Labouser

-- Show the cities of agents booking an order for a customer whose is 'c006'.  Use joins this time, no subqueries.
Select a.city
From agents a, orders o
Where o.cid = 'c006'
and a.aid = o.aid;

-- Show the ids of products ordered through any agent who makes at least one order for a customer in Kyoto, sorted by pid from highest to lowest.  Use 
-- joins; no subqueries.
Select distinct pid
From customers c, orders o
Where o.cid = c.cid
and c.city = 'Kyoto'
Order by pid Desc;

-- Show the names of customers who have never placed an order.  Use a subquery.
Select name
From customers
Where not cid in (
	Select cid
	From orders);

-- Show the names of customers who have never placed an order. Use an outer join.
Select c.name
From customers c
Left Outer Join orders o ON c.cid = o.cid
Where o.cid is null;

-- Show the names of customers who placed at least one order through an agent in their own city, along with those agents names.
Select distinct c.name, a.name
From customers c, orders o, agents a
Where a.aid = o.aid
and c.cid = o.cid
and c.city = a.city;

--Show the names of customers and agents living in the	same city, along with the name	of the shared city, regardless	of whether or 
-- not the customer has ever placed an order with that agent.	
Select c.name, a.name, c.city
From customers c, agents a
Where c.city = a.city;

-- Show	the name and city of customers	who live in the	city that makes	the fewest different kinds of products. (Hint:	Use count and	
-- group by on	the Products table.)
Select c.name, c.city
From customers c
Where c.city in (
	Select city
	From products
	Group by City
	Order by count(pid) ASC
	Limit 1);	