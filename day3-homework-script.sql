--1. List all customers who live in Texas (use JOINs)
SELECT concat(first_name , '  ', last_name ) full_name
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id 
WHERE district = 'Texas'

--2. Get all payments above $6.99 with the Customer's Full Name
SELECT concat(first_name, '  ', last_name) full_name , payment_id , amount  
FROM payment p 
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE amount > 6.99

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT concat(first_name, '  ', last_name) full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY  customer_id 
	HAVING sum(amount) > 175)

--4. List all customers that live in Nepal (use the city table)

SELECT concat(first_name, '  ', last_name) full_name, country  
FROM country c 
JOIN city c2 
ON c.country_id = c2.country_id
JOIN address a 
ON a.city_id = c2.city_id 
JOIN customer c3 
ON c3.address_id = a.address_id 
WHERE country = 'Nepal'


--5. Which staff member had the most transactions?
SELECT staff_id , count(payment_id) total_transactions
FROM payment p 
GROUP BY staff_id 
ORDER BY total_transactions DESC 
LIMIT 1

--6. How many movies of each rating are there?
SELECT rating , count(title) number_of_movies
FROM film 
GROUP BY rating 

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT DISTINCT  concat(first_name,'  ', last_name) full_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment p 
	WHERE amount > 6.99)
ORDER BY full_name ASC 

--8. How many free rentals did our stores give away?
SELECT count(amount) free_rentals
FROM payment
WHERE amount = 0
GROUP BY amount 


