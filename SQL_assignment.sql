
### **1. Create a table called `employees` with constraints**  
#### **Question:**  
#Write an SQL command to create a table named `employees` with the following constraints:  
- `emp_id` as the **Primary Key** and cannot be NULL.  
- `emp_name` should not be NULL.  
- `age` must be 18 or above.  
- `email` should have unique values.  
- `salary` should have a default value of 30,000.  

#### **Answer:**  
```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY NOT NULL,
    emp_name TEXT NOT NULL,
    age INT CHECK (age >= 18),
    email TEXT UNIQUE,
    salary DECIMAL DEFAULT 30000
);
```

---

### **2. Purpose of Constraints and Data Integrity**  
#### **Question:**  
Explain the purpose of constraints in a database and how they help maintain data integrity. Provide examples of common types of constraints.  

#### **Answer:**  
**Constraints** enforce rules on data to maintain accuracy and consistency. They prevent invalid data entry and help maintain **data integrity**.  

**Common Constraints:**  
- `PRIMARY KEY`: Ensures each record is unique.  
- `NOT NULL`: Prevents missing values.  
- `UNIQUE`: Ensures distinct values.  
- `CHECK`: Validates conditions (e.g., age ≥ 18).  
- `FOREIGN KEY`: Enforces referential integrity between tables.  
- `DEFAULT`: Sets a default value when none is provided.  

---

### **3. NOT NULL Constraint & Primary Key Nullability**  
#### **Question:**  
Why would you apply the `NOT NULL` constraint to a column? Can a `PRIMARY KEY` contain NULL values? Justify your answer.  

#### **Answer:**  
- The **`NOT NULL` constraint** ensures that a column cannot store NULL values, making it useful for fields that must always have a value (e.g., names, emails).  
- A **Primary Key cannot contain NULL values** because its role is to **uniquely identify** each record. If it had NULL values, uniqueness would be violated.  

---

### **4. Adding & Removing Constraints**  
#### **Question:**  
Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an example for both adding and removing a constraint.  

#### **Answer:**  
**Adding a Constraint:**  
```sql
ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary >= 20000);
```
**Removing a Constraint:**  
```sql
ALTER TABLE employees DROP CONSTRAINT chk_salary;
```

---

### **5. Consequences of Violating Constraints**  
#### **Question:**  
Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. Provide an example of an error message that might occur when violating a constraint.  

#### **Answer:**  
If a constraint is violated, the database **rejects the operation** and returns an error message.  

**Example:**  
Trying to insert a NULL value in a `NOT NULL` column:  
```sql
INSERT INTO employees (emp_id, emp_name, age, email, salary) 
VALUES (NULL, 'John Doe', 25, 'john@example.com', 40000);
```
**Error Message:**  
```
ERROR: Column 'emp_id' cannot be null.
```

---

### **6. Modify `products` Table**  
#### **Question:**  
Given the `products` table:  
```sql
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
```
Modify it so that:  
- `product_id` becomes the **Primary Key**.  
- `price` has a **default value of 50.00**.  

#### **Answer:**  
```sql
ALTER TABLE products ADD CONSTRAINT pk_product PRIMARY KEY (product_id);
ALTER TABLE products ALTER COLUMN price SET DEFAULT 50.00;
```

---

### **7. Fetch Student Names & Class Names Using INNER JOIN**  
#### **Question:**  
Given two tables **Students** and **Classes**, write an SQL query to fetch `student_name` and `class_name` using an `INNER JOIN`.  

#### **Answer:**  
```sql
SELECT Students.student_name, Classes.class_name 
FROM Students 
INNER JOIN Classes ON Students.class_id = Classes.class_id;
```

---

### **8. Fetch Order Details with INNER & LEFT JOIN**  
#### **Question:**  
Write an SQL query to fetch `order_id`, `customer_name`, and `product_name` from **Orders**, **Customers**, and **Products** tables using `INNER JOIN` and `LEFT JOIN`.  

#### **Answer:**  
```sql
SELECT Orders.order_id, Customers.customer_name, Products.product_name 
FROM Orders 
LEFT JOIN Products ON Orders.product_id = Products.product_id 
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;
```

---

### **9. Total Sales Per Product**  
#### **Question:**  
Write an SQL query to display **total sales** for each product using `SUM()` and `GROUP BY`.  

#### **Answer:**  
```sql
SELECT Products.product_name, SUM(Orders.quantity * Products.price) AS total_sales 
FROM Orders 
INNER JOIN Products ON Orders.product_id = Products.product_id 
GROUP BY Products.product_name;
```

---

### **10. Display Order Details & Quantity**  
#### **Question:**  
Write an SQL query to display `order_id`, `customer_name`, and `quantity` for all orders.  

#### **Answer:**  
```sql
SELECT Orders.order_id, Customers.customer_name, Orders.quantity 
FROM Orders 
INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;
```

---

### **11. Fetch Employees with Salary Above 40,000**  
#### **Question:**  
Write an SQL query to select employees earning more than `40,000`.  

#### **Answer:**  
```sql
SELECT emp_name, salary FROM employees WHERE salary > 40000;
```

---

### **12. Find Customers Who Have Not Placed Orders**  
#### **Question:**  
Write an SQL query to find customers who have **not placed any orders**.  

#### **Answer:**  
```sql
SELECT customer_name FROM Customers 
LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id 
WHERE Orders.order_id IS NULL;
```

---

### **13. Count the Number of Employees in Each Department**  
#### **Question:**  
Write an SQL query to count the number of employees in each department using `GROUP BY`.  

#### **Answer:**  
```sql
SELECT department, COUNT(emp_id) AS employee_count 
FROM employees 
GROUP BY department;
```

---

### **14. Retrieve the Top 5 Highest Paid Employees**  
#### **Question:**  
Write an SQL query to fetch the **top 5 highest-paid employees**.  

#### **Answer:**  
```sql
SELECT emp_name, salary FROM employees 
ORDER BY salary DESC LIMIT 5;
```

---

### **15. Delete Employees Younger than 21**  
#### **Question:**  
Write an SQL query to delete all employees who are younger than 21.  

#### **Answer:**  
```sql
DELETE FROM employees WHERE age < 21;
```

-- ## 1. Identify the primary keys and foreign keys in Maven Movies DB. Discuss the differences.
-- - **Primary Key:** A primary key uniquely identifies each record in a table.
-- - **Foreign Key:** A foreign key is a column or a set of columns that establish a link between data in two tables.

-- ---

-- ## 2. List all details of actors.
-- ```sql
-- SELECT * FROM actor;
-- ```

-- ## 3. List all customer information from the database.
-- ```sql
-- SELECT * FROM customer;
-- ```

-- ## 4. List different countries.
-- ```sql
-- SELECT DISTINCT country FROM country;
-- ```

-- ## 5. Display all active customers.
-- ```sql
-- SELECT * FROM customer WHERE active = 1;
-- ```

-- ## 6. List all rental IDs for customer with ID 1.
-- ```sql
-- SELECT rental_id FROM rental WHERE customer_id = 1;
-- ```

-- ## 7. Display all the films whose rental duration is greater than 5.
-- ```sql
-- SELECT * FROM film WHERE rental_duration > 5;
-- ```

-- ## 8. List the total number of films whose replacement cost is greater than $15 and less than $20.
-- ```sql
-- SELECT COUNT(*) FROM film WHERE replacement_cost BETWEEN 15 AND 20;
-- ```

-- ## 9. Display the count of unique first names of actors.
-- ```sql
-- SELECT COUNT(DISTINCT first_name) FROM actor;
-- ```

-- ## 10. Display the first 10 records from the customer table.
-- ```sql
-- SELECT * FROM customer LIMIT 10;
-- ```

-- ## 11. Display the first 3 records from the customer table whose first name starts with ‘b’.
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;
-- ```

-- ## 12. Display the names of the first 5 movies which are rated as ‘G’.
-- ```sql
-- SELECT title FROM film WHERE rating = 'G' LIMIT 5;
-- ```

-- ## 13. Find all customers whose first name starts with "a".
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE 'A%';
-- ```

-- ## 14. Find all customers whose first name ends with "a".
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE '%A';
-- ```

-- ## 15. Display the list of first 4 cities which start and end with ‘a’.
-- ```sql
-- SELECT city FROM city WHERE city LIKE 'A%A' LIMIT 4;
-- ```

-- ## 16. Find all customers whose first name has "NI" in any position.
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE '%NI%';
-- ```

-- ## 17. Find all customers whose first name has "r" in the second position.
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE '_R%';
-- ```

-- ## 18. Find all customers whose first name starts with "a" and are at least 5 characters in length.
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;
-- ```

-- ## 19. Find all customers whose first name starts with "a" and ends with "o".
-- ```sql
-- SELECT * FROM customer WHERE first_name LIKE 'A%O';
-- ```

-- ## 20. Get the films with PG and PG-13 rating using IN operator.
-- ```sql
-- SELECT * FROM film WHERE rating IN ('PG', 'PG-13');
-- ```

-- ## 21. Get the films with length between 50 to 100 using BETWEEN operator.
-- ```sql
-- SELECT * FROM film WHERE length BETWEEN 50 AND 100;
-- ```

-- ## 22. Get the top 50 actors using LIMIT operator.
-- ```sql
-- SELECT * FROM actor LIMIT 50;
-- ```

-- ## 23. Get the distinct film IDs from the inventory table.
-- ```sql
-- SELECT DISTINCT film_id FROM inventory;
-- ```

-- ## Basic Aggregate Functions

-- ### 1. Retrieve the total number of rentals made in the Sakila database.
-- SELECT COUNT(*) FROM rental;
-- ```

-- ### 2. Find the average rental duration (in days) of movies rented from the Sakila database.
-- **Hint:** Utilize the AVG() function.
-- ```sql
-- SELECT AVG(rental_duration) FROM film;
-- ```

-- ---

-- ## String Functions

-- ### 3. Display the first name and last name of customers in uppercase.
-- **Hint:** Use the UPPER() function.
-- ```sql
-- SELECT UPPER(first_name), UPPER(last_name) FROM customer;
-- ```

-- ### 4. Extract the month from the rental date and display it alongside the rental ID.
-- **Hint:** Employ the MONTH() function.
-- ```sql
-- SELECT rental_id, MONTH(rental_date) AS rental_month FROM rental;
-- ```

-- ---

-- ## GROUP BY Queries

-- ### 5. Retrieve the count of rentals for each customer.
-- **Hint:** Use COUNT() in conjunction with GROUP BY.
-- ```sql
-- SELECT customer_id, COUNT(*) FROM rental GROUP BY customer_id;
-- ```

-- ### 6. Find the total revenue generated by each store.
-- **Hint:** Combine SUM() and GROUP BY.
-- ```sql
-- SELECT store_id, SUM(amount) FROM payment GROUP BY store_id;
-- ```

-- ### 7. Determine the total number of rentals for each category of movies.
-- **Hint:** JOIN film_category, film, and rental tables, then use COUNT() and GROUP BY.
-- ```sql
-- SELECT category.name, COUNT(rental_id) FROM rental 
-- JOIN inventory ON rental.inventory_id = inventory.inventory_id 
-- JOIN film ON inventory.film_id = film.film_id 
-- JOIN film_category ON film.film_id = film_category.film_id 
-- JOIN category ON film_category.category_id = category.category_id 
-- GROUP BY category.name;
-- ```

-- ### 8. Find the average rental rate of movies in each language.
-- **Hint:** JOIN film and language tables, then use AVG() and GROUP BY.
-- ```sql
-- SELECT language.name, AVG(film.rental_rate) FROM film 
-- JOIN language ON film.language_id = language.language_id 
-- GROUP BY language.name;
-- ```

-- ---

-- ## Joins

-- ### 9. Display the title of the movie, customer’s first name, and last name who rented it.
-- **Hint:** Use JOIN between the film, inventory, rental, and customer tables.
-- ```sql
-- SELECT film.title, customer.first_name, customer.last_name 
-- FROM rental 
-- JOIN inventory ON rental.inventory_id = inventory.inventory_id 
-- JOIN film ON inventory.film_id = film.film_id 
-- JOIN customer ON rental.customer_id = customer.customer_id;
-- ```

-- ### 10. Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
-- **Hint:** Use JOIN between the film_actor, film, and actor tables.
-- ```sql
-- SELECT actor.first_name, actor.last_name FROM actor 
-- JOIN film_actor ON actor.actor_id = film_actor.actor_id 
-- JOIN film ON film_actor.film_id = film.film_id 
-- WHERE film.title = 'Gone with the Wind';
-- ```

-- ### 11. Retrieve the customer names along with the total amount they've spent on rentals.
-- **Hint:** JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.
-- ```sql
-- SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_spent 
-- FROM customer 
-- JOIN payment ON customer.customer_id = payment.customer_id 
-- GROUP BY customer.first_name, customer.last_name;
-- ```

-- ### 12. List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- **Hint:** JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.
-- ```sql
-- SELECT customer.first_name, customer.last_name, film.title FROM rental 
-- JOIN customer ON rental.customer_id = customer.customer_id 
-- JOIN address ON customer.address_id = address.address_id 
-- JOIN city ON address.city_id = city.city_id 
-- JOIN inventory ON rental.inventory_id = inventory.inventory_id 
-- JOIN film ON inventory.film_id = film.film_id 
-- WHERE city.city = 'London';
-- ```

-- ---

-- ## Advanced Joins and GROUP BY

-- ### 13. Display the top 5 rented movies along with the number of times they've been rented.
-- **Hint:** JOIN film, inventory, and rental tables, then use COUNT() and GROUP BY, and limit the results.
-- ```sql
-- SELECT film.title, COUNT(rental.rental_id) AS rental_count FROM rental 
-- JOIN inventory ON rental.inventory_id = inventory.inventory_id 
-- JOIN film ON inventory.film_id = film.film_id 
-- GROUP BY film.title 
-- ORDER BY rental_count DESC 
-- LIMIT 5;
-- ```

-- ### 14. Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- **Hint:** Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.
-- ```sql
-- SELECT customer.first_name, customer.last_name FROM rental 
-- JOIN customer ON rental.customer_id = customer.customer_id 
-- JOIN inventory ON rental.inventory_id = inventory.inventory_id 
-- WHERE inventory.store_id IN (1,2) 
-- GROUP BY customer.customer_id 
-- HAVING COUNT(DISTINCT inventory.store_id) = 2;
-- ```

-- ## Windows Functions

-- ### 1. Rank the customers based on the total amount they've spent on rentals.
-- ```sql
-- SELECT customer_id, SUM(amount) AS total_spent, RANK() OVER (ORDER BY SUM(amount) DESC) AS rank 
-- FROM payment 
-- GROUP BY customer_id;
-- ```

-- ### 2. Calculate the cumulative revenue generated by each film over time.
-- ```sql
-- SELECT film_id, rental_date, SUM(amount) OVER (PARTITION BY film_id ORDER BY rental_date) AS cumulative_revenue 
-- FROM payment 
-- JOIN rental ON payment.rental_id = rental.rental_id;
-- ```

-- ### 3. Determine the average rental duration for each film, considering films with similar lengths.
-- ```sql
-- SELECT film_id, length, AVG(rental_duration) OVER (PARTITION BY length) AS avg_rental_duration 
-- FROM film;
-- ```

-- ### 4. Identify the top 3 films in each category based on their rental counts.
-- ```sql
-- WITH FilmRanking AS (
--     SELECT category_id, film_id, COUNT(rental_id) AS rental_count, 
--            RANK() OVER (PARTITION BY category_id ORDER BY COUNT(rental_id) DESC) AS rank 
--     FROM rental 
--     JOIN inventory ON rental.inventory_id = inventory.inventory_id 
--     JOIN film_category ON inventory.film_id = film_category.film_id 
--     GROUP BY category_id, film_id
-- )
-- SELECT * FROM FilmRanking WHERE rank <= 3;
-- ```

-- ### 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
-- ```sql
-- SELECT customer_id, COUNT(rental_id) AS rental_count, 
--        COUNT(rental_id) - AVG(COUNT(rental_id)) OVER () AS rental_difference 
-- FROM rental 
-- GROUP BY customer_id;
-- ```

-- ### 6. Find the monthly revenue trend for the entire rental store over time.
-- ```sql
-- SELECT MONTH(payment_date) AS month, YEAR(payment_date) AS year, SUM(amount) AS total_revenue 
-- FROM payment 
-- GROUP BY YEAR(payment_date), MONTH(payment_date) 
-- ORDER BY year, month;
-- ```

-- ### 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
-- ```sql
-- WITH CustomerSpending AS (
--     SELECT customer_id, SUM(amount) AS total_spent, 
--            PERCENT_RANK() OVER (ORDER BY SUM(amount) DESC) AS percentile 
--     FROM payment 
--     GROUP BY customer_id
-- )
-- SELECT * FROM CustomerSpending WHERE percentile <= 0.2;
-- ```

-- ### 8. Calculate the running total of rentals per category, ordered by rental count.
-- ```sql
-- WITH CategoryRentals AS (
--     SELECT category_id, COUNT(rental_id) AS rental_count 
--     FROM rental 
--     JOIN inventory ON rental.inventory_id = inventory.inventory_id 
--     JOIN film_category ON inventory.film_id = film_category.film_id 
--     GROUP BY category_id
-- )
-- SELECT category_id, rental_count, SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total 
-- FROM CategoryRentals;
-- ```

-- ### 9. Find the films that have been rented less than the average rental count for their respective categories.
-- ```sql
-- WITH FilmRentalCounts AS (
--     SELECT category_id, film_id, COUNT(rental_id) AS rental_count, 
--            AVG(COUNT(rental_id)) OVER (PARTITION BY category_id) AS avg_rental_count 
--     FROM rental 
--     JOIN inventory ON rental.inventory_id = inventory.inventory_id 
--     JOIN film_category ON inventory.film_id = film_category.film_id 
--     GROUP BY category_id, film_id
-- )
-- SELECT * FROM FilmRentalCounts WHERE rental_count < avg_rental_count;
-- ```

-- ### 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
-- ```sql
-- SELECT MONTH(payment_date) AS month, YEAR(payment_date) AS year, SUM(amount) AS total_revenue 
-- FROM payment 
-- GROUP BY YEAR(payment_date), MONTH(payment_date) 
-- ORDER BY total_revenue DESC 
-- LIMIT 5;
-- ```

-- ---

-- ## Normalization & CTE

-- ### 1. First Normal Form (1NF)
-- - **Problem:** A table in Sakila that stores multiple phone numbers in a single column violates 1NF.
-- - **Solution:** Create a separate table with a one-to-many relationship to store phone numbers individually.

-- ### 2. Second Normal Form (2NF)
-- - **Problem:** A table that contains both customer details and order details where order_id is not dependent on all primary key columns.
-- - **Solution:** Split the table into `Customers` and `Orders` so that non-key attributes depend on the entire primary key.

-- ### 3. Third Normal Form (3NF)
-- - **Problem:** A table contains `customer_id`, `customer_name`, and `customer_city`, but `customer_city` is dependent on `customer_name` rather than `customer_id`.
-- - **Solution:** Remove transitive dependencies by creating a separate `Cities` table.

-- ### 4. Normalization Process
-- - **Step 1:** Ensure atomicity (1NF)
-- - **Step 2:** Remove partial dependencies (2NF)
-- - **Step 3:** Remove transitive dependencies (3NF)

-- ---

-- ## Common Table Expressions (CTEs)

-- ### 5. Retrieve the distinct list of actor names and the number of films they have acted in.
-- ```sql
-- WITH ActorFilms AS (
--     SELECT actor_id, COUNT(film_id) AS film_count 
--     FROM film_actor 
--     GROUP BY actor_id
-- )
-- SELECT actor.first_name, actor.last_name, ActorFilms.film_count 
-- FROM actor 
-- JOIN ActorFilms ON actor.actor_id = ActorFilms.actor_id;
-- ```

-- ### 6. Create a CTE that combines information from the film and language tables.
-- ```sql
-- WITH FilmLanguage AS (
--     SELECT film.title, language.name AS language_name, film.rental_rate 
--     FROM film 
--     JOIN language ON film.language_id = language.language_id
-- )
-- SELECT * FROM FilmLanguage;
-- ```

-- ### 7. Find the total revenue generated by each customer using a CTE.
-- ```sql
-- WITH CustomerRevenue AS (
--     SELECT customer_id, SUM(amount) AS total_revenue 
--     FROM payment 
--     GROUP BY customer_id
-- )
-- SELECT * FROM CustomerRevenue;
-- ```

-- ### 8. Use a CTE with a window function to rank films based on rental duration.
-- ```sql
-- WITH FilmRanking AS (
--     SELECT film_id, rental_duration, 
--            RANK() OVER (ORDER BY rental_duration DESC) AS rank 
--     FROM film
-- )
-- SELECT * FROM FilmRanking WHERE rank <= 5;
-- ```

-- ### 9. Create a CTE to list customers who have made more than two rentals.
-- ```sql
-- WITH FrequentCustomers AS (
--     SELECT customer_id, COUNT(rental_id) AS rental_count 
--     FROM rental 
--     GROUP BY customer_id
--     HAVING COUNT(rental_id) > 2
-- )
-- SELECT * FROM FrequentCustomers;
-- ```

-- ### 10. Implement a recursive CTE to find all employees reporting to a specific manager.
-- ```sql
-- WITH RECURSIVE EmployeeHierarchy AS (
--     SELECT employee_id, first_name, last_name, reports_to 
--     FROM staff 
--     WHERE reports_to = 1
--     UNION ALL
--     SELECT s.employee_id, s.first_name, s.last_name, s.reports_to 
--     FROM staff s
--     JOIN EmployeeHierarchy eh ON s.reports_to = eh.employee_id
-- )
-- SELECT * FROM EmployeeHierarchy;
-- ```





