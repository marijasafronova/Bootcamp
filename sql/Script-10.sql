--task one, 
--which city has the most invoices? 
--order by invoice COUNT

SELECT BillingCity  , COUNT(invoiceid) invoice_count
FROM invoices i 
GROUP BY BillingCity  
ORDER BY invoice_count DESC;

--task two, 
--which city has the best customers
--this means to have an ordered list
--5 cities with highest sum of totals


SELECT BillingCity, 
		SUM(total) sum_total
FROM invoices i
GROUP BY BillingCity 
ORDER BY sum_total DESC 
LIMIT 5;


--task three 
--find the biggest 3 spenders
--joining customers and invoices and invoices items
--then using group by and the sum of grouped total

SELECT FirstName, LastName,
		SUM(total) sum_total
FROM customers c 
JOIN invoices i 
ON c.CustomerId = i.CustomerId
JOIN invoice_items ii 
ON ii.InvoiceId = i.InvoiceId
GROUP BY c.CustomerId 
ORDER BY sum_total DESC 
LIMIT 3;

--task four
--find all listeners to classical music
--this might not need aggregation
SELECT DISTINCT FirstName, LastName
FROM customers c 
JOIN invoices i 
ON c.CustomerId = i.CustomerId
JOIN invoice_items ii 
ON ii.InvoiceId = i.InvoiceId
JOIN tracks t 
ON t.TrackId = ii.TrackId 
JOIN genres g 
ON g.GenreId = t.GenreId
WHERE g.Name = 'Classical';


