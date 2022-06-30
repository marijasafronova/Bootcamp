SELECT * FROM tracks t;

SELECT * FROM playlist_track pt ;

SELECT * FROM invoice_items ii ;

--first task
SELECT * FROM tracks t
WHERE EXISTS (
		SELECT '1' FROM playlist_track pt
		WHERE pt.TrackId = t.TrackId
		)
ORDER BY Name ASC;

--second task
SELECT * FROM tracks t
WHERE EXISTS (
		SELECT '1' FROM invoice_items ii 
		WHERE ii.TrackId = t.TrackId);
	

-- simple case expression
	
SELECT customerid, firstname, lastname,
CASE country 
	WHEN 'USA'
		THEN 'American'
	ELSE 'Foreign'
	END CustomerGroup
FROM 
	customers c 
ORDER BY LastName , FirstName ;


SELECT trackid, name, milliseconds/1000,
CASE 
	WHEN milliseconds < 60000 THEN 'short'
	WHEN milliseconds > 60000 AND milliseconds < 30000 THEN 'medium'
	ELSE 'long'
END songtype
FROM tracks t 
ORDER BY Milliseconds ASC;


SELECT customerid, firstname, lastname,
CASE country 
	WHEN 'USA'
		THEN 'American'
	ELSE 'Foreign'
	END CustomerGroup
FROM 
	customers c 
ORDER BY LastName , FirstName ;

--save results as a view

CREATE VIEW v_customerCountries
AS SELECT customerid, firstname, lastname,
CASE country 
	WHEN 'USA'
		THEN 'American'
	ELSE 'Foreign'
	END CustomerGroup
FROM 
	customers c 
ORDER BY LastName , FirstName ;

SELECT * FROM v_customerCountries vcc 
GROUP BY CustomerGroup ;

--transaction
CREATE TABLE accounts (
	account_no INTEGER NOT NULL,
	balance DECIMAL NOT NULL,
	










