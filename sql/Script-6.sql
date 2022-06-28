SELECT * FROM employees e;
SELECT *, 'blank value' someColumn FROM customers c;

SELECT FirstName, LastName, 'employee' category
FROM employees e
UNION
SELECT FirstName, LastName, 'customer'
FROM customers c ;


SELECT FirstName, LastName, 'employee' category
FROM employees e
UNION
SELECT FirstName, LastName, 'customer'
FROM customers c 
ORDER BY LastName ASC;

--can mix and match different columns, but data type is the same

SELECT * FROM employees e;

SELECT * FROM employees e 
WHERE LastName LIKE 'P%';

SELECT * FROM employees e 
WHERE FirstName LIKE 'M%';


SELECT * FROM employees e 
WHERE LastName LIKE 'P%'
UNION ALL 
SELECT * FROM employees e 
WHERE FirstName LIKE 'M%';

SELECT * FROM artists a
ORDER BY ArtistId DESC;


SELECT ArtistID FROM artists a
EXCEPT 
SELECT ArtistId FROM albums a2 ;
--here we choose to show only those artists, 
--who doesn't have any albums


--with intersect we get 
--destinct rows that are in both queries

SELECT ArtistID FROM artists a
INTERSECT
SELECT ArtistId FROM albums a2 ;
--here we choose to show only those artists, 
--who have albums

SELECT * FROM invoices i;

SELECT DISTINCT customerId from invoices i ;

SELECT customerid
FROM customers c 
INTERSECT
SELECT CustomerId 
FROM invoices i
ORDER BY CustomerId DESC;

--to create subqueries that are nested SELECT statements inside another statement
--we use (select... from...)

SELECT * FROM tracks t;
SELECT * FROM albums a ;

SELECT trackid, name, albumid
FROM tracks t ;
--we could join with album and use where THEN 
--or we could use a subquery

SELECT albumid FROM albums a2
WHERE Title = 'Jagged Little Pill';


SELECT trackid, name, albumid, Milliseconds /1000 seconds
FROM tracks t
WHERE AlbumId = ( --with = we got match on first row value in subquery
		SELECT albumid FROM albums a2
		WHERE Title = 'Jagged Little Pill')
ORDER BY seconds ASC;


SELECT albumid
FROM albums a2
WHERE title LIKE 'J%';

SELECT trackid, name, albumid, Milliseconds /1000 seconds
FROM tracks t
WHERE AlbumId IN (  --for possible multiple matches we will use IN
		SELECT albumid
		FROM albums a2
		WHERE title LIKE 'J%')
ORDER BY seconds ASC;

--you would use exists for checking subquery that returns anything
-- we will find cusstomers that have invoices

SELECT * FROM customers c ;

--it is typical to use 1 as non null value

SELECT 1 FROM Invoices;

SELECT * FROM customers c
WHERE EXISTS (
	SELECT '1' FROM invoices i 
	WHERE i.CustomerId = c.customerid
	);

SELECT customerid, firstname, lastname 
FROM customers c 
WHERE EXISTS (
		SELECT 1
		FROM Invoices i
		WHERE i.CustomerId = c.CustomerId)
ORDER BY LastName, FirstName ;












