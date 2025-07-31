-- Chinook SQL Analysis Project
-- Author : Gordon Clifford
-- Description : Revenue and sales insights for a digital music store. 

-- Test Query to make sure dataset was downloaded correctly
SELECT * FROM Genre LIMIT 5;

SELECT * FROM Track LIMIT 5;

SELECT * FROM InvoiceLine LIMIT 5;

-- Top Selling Genres
-- Calculates total revenue for each genre by summing quantity * unit price
SELECT 
	g.Name AS Genre,
	SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM
	InvoiceLine il
JOIN
	Track t ON il.TrackId = t.TrackId
JOIN
	Genre g ON t.GenreId = g.GenreId
GROUP BY
	g.Name
ORDER BY
	TotalRevenue DESC;

-- Top Selling Artists/Groups
-- Calculates the Total Revenue earned by each artist/group, and order them in descending order, from 138.6M to 0.99M.
SELECT
	ar.Name AS Artist,
	SUM(il.Quantity * il.UnitPrice) AS TotalRevenue
FROM 
	InvoiceLine il
JOIN 
	Track t ON il.TrackId = t.TrackId
JOIN 
	Album al ON t.AlbumId = al.AlbumId
JOIN 
	Artist ar ON al.ArtistId = ar.ArtistId 
GROUP BY 
	ar.Name
ORDER BY 
	TotalRevenue DESC;

-- Top Customers
-- Sorts the customers in descending order or Total Spent.
SELECT
	c.FirstName || ' ' || LastName AS CustomerName,
	SUM(il.UnitPrice * il.Quantity) AS TotalSpent
FROM InvoiceLine il
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY CustomerName 
ORDER BY TotalSpent DESC;

-- Revenue by Country
-- Calculates the Total Revenue for each country and lists them in descending order.
SELECT 
	c.Country,
	SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM 
	InvoiceLine il 
JOIN 
	Invoice i ON il.InvoiceId = i.InvoiceId
JOIN 
	Customer c ON i.CustomerId = c.CustomerId
GROUP BY
	c.Country 
ORDER BY 
	TotalRevenue DESC;

	
	
	
	
	
