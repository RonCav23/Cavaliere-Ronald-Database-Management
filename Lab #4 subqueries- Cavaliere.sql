--Ronald Cavaliere--
--Lab #4--
--02/14/2017

--Get the cities of agents booking an order for a customer whose cid is 'c006'.
select city
from agents
where aid in (
	select aid
	from orders
	where cid = 'c006'
	);

--Get the distinct ids of products ordered through any	agent who takes	at least one order from a customer in Kyoto, sorted by	pid from highest to lowest.	
Select distinct pid
From Orders
Where aid in(
	Select aid
	From Orders
	Where cid in (Select cid
		      From Customers
		      Where city = 'Kyoto'))
Order by pid Desc;

--Get the ids and names of customers who did not place	an order through agent a01.
Select cid,name
From Customers
Where cid not in (Select cid
	          From Orders
	          Where aid = 'a01');

--Get the ids of customers who ordered both product p01 and p07.
Select cid
From Customers
Where cid in ( Select cid
	       From Orders
	       Where pid = 'p07')
And cid in (Select cid
	    From Orders
	    Where pid = 'p01');	

--Get the ids of products not ordered by any customers who placed any order through agent a08 in pid order from highest to lowest.
Select distinct pid
From Orders
Where cid not in (Select cid
		  From Orders
	          Where aid = 'a08')
Order by pid Desc;

--Get the name, discount, and city for all customers who place orders through agents in Tokyo or New York.
Select name,discount,city
From Customers
Where cid in (Select cid
	      From Orders
	      Where aid in (Select aid
			    From Agents
			    Where city = 'Tokyo' or city = 'New York'));

--Get all customers who have the same discount as that of any customers in Duluth or London
Select *
From Customers
Where discount in (Select discount
		   From Customers
		   Where city = 'Duluth' or city = 'London');

--Check Constraints
/*
A constraint in SQL can be used for many different reasons.  Whether it's a security against bad data, and enforcer of unique data, 
or it is just creating rules the database table must follow, typically it is good to have them.  Obviously, the more complex the objective
is the higher the value of having constraints.  A check constraints biggest purpose is to guarantee data integrity.  If you have a large
table, a check constraint is an easy, fast way to make sure all columns within the table pass which ever rule it was that was made.  
If a value is inputted incorrectly it will show you immediately which constrait was violated. A good example when to use a check constraint
would be inserting number grades for students.  A student would beable to receive anywhere from a 0 to 100, however they would not be able
to receive anything more or less.  An example where a check constraint is not necssary is for social security numbers.  This is due to the 
fact that everyone has their own social security number.  The constraint would serve no purpose at all.
*/