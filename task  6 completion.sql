-- =========================================
-- DROP TABLES IF EXIST
-- =========================================

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- =========================================
-- CREATE CUSTOMERS TABLE
-- =========================================

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);

-- =========================================
-- CREATE ORDERS TABLE
-- =========================================

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount NUMERIC(10,2),
    customer_id INT REFERENCES customers(customer_id)
);

-- =========================================
-- INSERT DATA INTO CUSTOMERS
-- =========================================

INSERT INTO customers (customer_name, city) VALUES
('Rahul', 'Bangalore'),
('Amit', 'Mumbai'),
('Sneha', 'Chennai'),
('Priya', 'Delhi'),
('Kiran', 'Hyderabad');

-- =========================================
-- INSERT DATA INTO ORDERS
-- =========================================

INSERT INTO orders (order_date, amount, customer_id) VALUES
('2026-02-01', 1500.00, 1),
('2026-02-05', 2500.00, 1),
('2026-02-10', 1800.00, 2),
('2026-02-12', 2200.00, 3),
('2026-02-15', 3000.00, 3);

-- =========================================
-- 1️⃣ SCALAR SUBQUERY (in SELECT)
-- Show each customer with total order amount
-- =========================================

SELECT 
    customer_name,
    (SELECT SUM(amount)
     FROM orders
     WHERE orders.customer_id = customers.customer_id) AS total_spent
FROM customers;

-- =========================================
-- 2️⃣ SUBQUERY WITH =
-- Customers who made the highest single order
-- =========================================

SELECT customer_name
FROM customers
WHERE customer_id = (
    SELECT customer_id
    FROM orders
    WHERE amount = (SELECT MAX(amount) FROM orders)
);

-- =========================================
-- 3️⃣ SUBQUERY WITH IN
-- Customers who have placed orders
-- =========================================

SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
);

-- =========================================
-- 4️⃣ SUBQUERY WITH EXISTS (Correlated)
-- Customers who have at least one order
-- =========================================

SELECT customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM orders o
    WHERE o.customer_id = c.customer_id
);

-- =========================================
-- 5️⃣ CORRELATED SUBQUERY
-- Customers whose total spending is above average
-- =========================================

SELECT customer_name
FROM customers c
WHERE (
    SELECT SUM(o.amount)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) > (
    SELECT AVG(amount) FROM orders
);

-- =========================================
-- 6️⃣ SUBQUERY IN FROM CLAUSE
-- Show customers with their total spending
-- =========================================

SELECT c.customer_name, t.total_amount
FROM customers c
JOIN (
    SELECT customer_id, SUM(amount) AS total_amount
    FROM orders
    GROUP BY customer_id
) t
ON c.customer_id = t.customer_id;