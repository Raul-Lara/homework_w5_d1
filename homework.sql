-- SELECT all records from the actor table
SELECT *
FROM actor;

-- Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

--Query for all first_name data that is like Nick using the LIKE and WHERE clauses
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with J using the LIKE and WHERE clauses
-- and the wildcard %
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with a K and has 2 letters following the K with underscores
-- LIKE and WHERE
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

-- Query for all first_name data that starts with a K and ends with th
-- using the LIKE and WHERE clauses -- using BOTH wildcard AND underscore
SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th';

-- Comparing Operators:
-- Greater Than > -- Less Than <
-- Greater or Equal >= Less or Equal <=
-- Not Equal <>

--Explore Data with SELECT * query(specific to changing into a new table)


SELECT *
FROM payment;

--query for data taht show customers who paid
--an amount greater than 2$
SELECT customer_id, amount
FROM payment
WHERE amount > 2.00;

--query for data taht show customers who paid
--an amount less than 7.99$
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

--query for data taht show customers who paid
--an amount less than or equal to 7.99$
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

--Query data for customer who paid an amount
--Greater tahn or equal to 2.00
--Order by in ascending order
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

--Query for data that shows customers who paid
--an amount BETWEEN 2.00 nad 7.99
--using the BETWEEN with the AND clause
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 and 7.99;

--Query for data that shows customers who paid
--an amount NOT EQUAL to 0.00
--Ordered in Desending Oreder
SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

--SQL Aggregations --> SUM(), AVR(), COUNT(), MIN(), MAX()
--Query to display sum of amountes paid taht are greater than 5.99
SELECT SUM (amount)
FROM payment
WHERE amount > 5.99;

--Query to display AVERAGE amounts paid taht are greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the count of amounts paid that are greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

--DISTINCT -- returns unique values
--Query to display the count of DISTICT amount paid greater than 5.99
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

--query to display the smallest(MIN) AMOUNT GREATER TAHN 7.99
SELECT MIN(amount) AS min_num_payments
FROM payment
WHERE amount > 7.99;

--query to display the largers(MAX) AMOUNT GREATER TAHN 7.99
SELECT MAX(amount) AS max_num_payments
FROM payment
WHERE amount > 7.99;

--Query to display all amounts
SELECT amount
FROM payment
WHERE amount = 7.99;

--Query to display different amounts grouped togeter
--and count those amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount ASC;

--Query to display customers_ids wht the summed amounts for each custumer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

--Query to display customer_ids with the amounts for each customer_id
--separate example and a different way to use GROUP BY
SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;

--Query to explore the data iside of the customer table
SELECT *
FROM customer;

-- Query to display customer_id that show up more than 5 times 
--GROUP BY email
SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j%'
GROUP BY email
HAVING COUNT (customer_id) > 0;

--HOMEWORK--

--#1
SELECT COUNT (last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';

--#2

SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;

--#3
SELECT film_id, COUNT(film_id) as count_id
FROM inventory
GROUP BY film_id
ORDER BY count_id DESC ;
--#4
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE 'William';

--#5
SELECT COUNT (rental_id), staff_id
FROM rental
GROUP BY staff_id;

--#6
SELECT COUNT(DISTINCT district)
FROM address;
--#7
SELECT film_id, COUNT(actor_id) actor_count
FROM film_actor
GROUP BY film_id
ORDER BY actor_count DESC;

--#8
SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id
HAVING store_id = 1;

--#9
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;
--#10
SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;