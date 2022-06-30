CREATE TABLE contacts (
	first_name text NOT NULL,
	last_name text NOT NULL,
	email text NOT NULL
);

CREATE UNIQUE INDEX idx_contacts_email
ON contacts (email);

INSERT INTO contacts (first_name, last_name, email)
VALUES ('Marija', 'Safronova', 'myska@inbox.lv');

INSERT INTO contacts (first_name, last_name, email)
VALUES ('Emma', 'Sozonova', 'emma@inbox.lv');

SELECT * FROM contacts ;

SELECT * 
FROM contacts 
WHERE email = 'emma@inbox.lv';

EXPLAIN QUERY PLAN
SELECT * FROM contacts 
WHERE email = 'emma@inbox.lv';


EXPLAIN QUERY PLAN
SELECT * FROM contacts 
WHERE first_name = 'Emma';

SELECT * FROM tracks t 
ORDER BY TrackId DESC;

SELECT * FROM tracks t 
WHERE name = 'Sing Joyfully';

SELECT COUNT (*) FROM tracks t ; 

SELECT COUNT (*) FROM playlist_track pt ;

EXPLAIN QUERY PLAN
SELECT * FROM tracks t 
WHERE name = 'Sing Joyfully'; 

--now inserting a new index UNIQUE maight produce error

CREATE INDEX idx_track_name
ON tracks(name);

EXPLAIN QUERY PLAN 
SELECT * FROM tracks t 
WHERE name = 'Sing Joyfully';

--so we can check what indexes we have on some TABLE 

PRAGMA index_list ('tracks');

PRAGMA index_list ('contacts');

--lets get all indexes in our database

SELECT 
	type,
	name,
	tbl_name
	SQL 
FROM sqlite_master
WHERE type ='index';


--if we decide we do not need an index we can drop it
DROP INDEX IF EXISTS
idx_tracks_name;

SELECT * FROM tracks t 
WHERE name = 'Sing Joyfully';

SELECT name, COUNT(trackid) counts
FROM tracks t
GROUP BY Name 
order by  counts DESC;

--doesnt work
CREATE UNIQUE INDEX idx_tracks_name
ON tracks(name);

--we might want to create an index bases on  expressions

SELECT * FROM customers;

SELECT customerid, 
	company
FROM customers c 
WHERE length(Company > 10)
ORDER BY length(Company) DESC;

EXPLAIN QUERY PLAN 
SELECT customerid, 
	company
FROM customers c 
WHERE length(Company > 10)
ORDER BY length(Company) DESC;


CREATE INDEX idx_company_length
ON customers(LENGTH(company));


SELECT customerid, 
	company
FROM customers c 
WHERE length(Company > 10)
ORDER BY length(Company) DESC;


DROP INDEX IF EXISTS 
idx_company_length;

CREATE INDEX idx_invoice_line_amount
ON invoice_items (unitprice*quantity);

EXPLAIN QUERY PLAN
	SELECT InvoiceId,
	UnitPrice*Quantity
FROM invoice_items ii 
WHERE Quantity * UnitPrice >9000;

EXPLAIN QUERY PLAN
	SELECT InvoiceId,
	UnitPrice*Quantity
FROM invoice_items ii 
WHERE UnitPrice * Quantity  >9000;

CREATE INDEX idx_millisconds
ON tracks (milliseconds);

CREATE  Unique INDEX idx_millisconds
ON tracks (milliseconds); --can't create unique indexes 
--because the length of the tracks can be same

SELECT * FROM tracks;

---- first task 
SELECT * FROM tracks
WHERE (Milliseconds/1000)/60 > 5;


EXPLAIN QUERY PLAN
SELECT * FROM tracks
WHERE (Milliseconds/1000)/60 > 5;


--second task

SELECT * 
CONCAT (firstname, " ", lastname)
AS full_name
FROM customers c ;





























 
















