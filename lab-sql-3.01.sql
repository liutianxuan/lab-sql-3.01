use sakila;

-- Activity 1

-- 1. Drop column picture from staff.
ALTER TABLE staff
DROP COLUMN picture;

SELECT * 
FROM staff;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
INSERT INTO staff (staff_id, first_name, last_name, email, address_id, store_id, active, username, last_update)
SELECT customer_id, first_name, last_name, email, address_id, store_id, active, first_name, last_update 
FROM customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';

UPDATE staff
SET staff_id = 3,
    first_name = 'Tammy',
    last_name = 'Sanders'
WHERE staff_id = 75;

SELECT *
FROM staff;

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:
-- select customer_id from sakila.customer
-- where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
-- Use similar method to get inventory_id, film_id, and staff_id.
SELECT *
FROM rental;

SELECT inventory_id FROM inventory WHERE film_id = (SELECT film_id FROM film WHERE title = 'Academy Dinosaur' AND store_id =1);

SELECT staff_id FROM staff WHERE store_id =1;

SELECT customer_id FROM customer WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';
# Error Code: 1248. Every derived table must have its own alias

INSERT INTO rental (rental_id, rental_date, inventory_id, customer_id,staff_id, last_update)
VALUES (16050, CURDATE(), 1, 130, 1, CURDATE());

SELECT *
FROM rental
ORDER BY rental_id DESC
LIMIT 1;

-- Activity 2

-- 1. Use dbdiagram.io or draw.io to propose a new structure for the Sakila database.
-- I would remove COUNTRY and CITY tables and add these info into ADDRESS;
-- Passwords and usernames of staff shouldn't be stored or shared publicly, I would remove them from STAFF.
-- CREATE_DATE could be changed to timestamp instead of date.

-- 2. Define primary keys and foreign keys for the new database.
