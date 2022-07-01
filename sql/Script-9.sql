SELECT * FROM invoices i ;

SELECT sum(total), 
	   count(total), -- count rows
	   min(total),
	   avg(total),
	   max(total)
FROM invoices i; 

--we can use these aggregat functions to work on the result
SELECT COUNT (*), 'Invoices over 5.99' FROM invoices i
WHERE total > 5.99;

SELECT COUNT (*), 'Invoices over 5.99',
	   sum(total),
	   min(total),
	   avg(total),
	   max(total)
FROM invoices i
WHERE total > 5.99;

SELECT total, 
COUNT (total),
SUM (total),
MIN(total),
MAX (total)
FROM invoices i
GROUP BY total;

SELECT * FROM invoices i ;

SELECT BillingCountry , COUNT(invoiceid) FROM invoices i 
GROUP BY BillingCountry ;

--if we group by one column we can perform the aggregate functions 
--on other columns

SELECT BillingCountry country, COUNT(invoiceid),  
		SUM(total),
		SUM(DISTINCT total), --only unique totals
	   	MIN(total),
	   	ROUND(AVG(total), 2),
	  	MAX(total) 
FROM invoices i
GROUP BY country;

--AVG example
SELECT albumid,
	ROUND(AVG((Milliseconds)/60000),2) avg_minutes
FROM tracks t 
GROUP BY AlbumId ;

SELECT ROUND(AVG((Milliseconds)/60000),2) FROM tracks;

SELECT albumid,
	ROUND(AVG((Milliseconds)/60000),2) avg_minutes
FROM tracks t 
GROUP BY AlbumId
ORDER BY avg_minutes DESC;

--if we want to know the album names we do join
SELECT t.albumid, 
	ROUND(AVG((Milliseconds)/60000),2) avg_minutes,
	a.title albumName,
	COUNT(t.albumid) songCount,
	t.Name ,
	GROUP_CONCAT(t.Name,',') allsongs
FROM tracks t 
JOIN albums a 
ON t.AlbumId  = a.AlbumId 
GROUP BY t.AlbumId --since we are joining we need to clarify t. on what we group
ORDER BY avg_minutes DESC; 

SELECT t.albumid, 
	ROUND(AVG((Milliseconds)/60000),2) avg_minutes,
	a.title albumName,
	COUNT(t.albumid) songCount,
	t.Name ,
	GROUP_CONCAT(t.Name,',') allsongs
FROM tracks t 
JOIN albums a 
ON t.AlbumId  = a.AlbumId 
GROUP BY t.AlbumId --since we are joining we need to clarify t. on what we group
ORDER BY songCount DESC;


--calculate albu length we would use sum on milliseconds
SELECT 
albumId,
SUM(milliseconds)/6000 album_length
FROM tracks t 
GROUP BY AlbumId 
ORDER BY AlbumId DESC;

--if you wanted to find the actual album name you would do

SELECT MAX(milliseconds) / 6000 mins
FROM tracks;

--we could use a subquery to find the loges t tracks

SELECT * FROM tracks t 
WHERE Milliseconds = (
	SELECT MIN(Milliseconds)
	FROM tracks 
);

SELECT *
FROM tracks t 
WHERE albumid = 200;

--we can use group_concat to have comma separate list of 
--track names

SELECT 	
	GROUP_CONCAT (name) -- separator ',' is the default
FROM tracks t
WHERE AlbumId = 200;
	














