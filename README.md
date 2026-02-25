📖 Project Objective

The objective of this project is to understand and implement subqueries (nested queries) in SQL using PostgreSQL.

This project demonstrates how to use subqueries in:

SELECT clause

WHERE clause

FROM clause

IN, EXISTS, and = operators

Scalar and Correlated subqueries

🛠 Tools Used

PostgreSQL

pgAdmin 4

🗂 Database Schema

This project uses two related tables:

1️⃣ Customers Table
Column	Type	Description
customer_id	SERIAL (PK)	Unique ID
customer_name	VARCHAR(100)	Customer name
city	VARCHAR(100)	Customer city
2️⃣ Orders Table
Column	Type	Description
order_id	SERIAL (PK)	Unique order ID
order_date	DATE	Order date
amount	NUMERIC(10,2)	Order amount
customer_id	INT (FK)	References customers(customer_id)

Relationship:

One customer can place multiple orders (One-to-Many)

🔍 Subquery Concepts Implemented
✅ 1. Scalar Subquery (SELECT Clause)

Displays each customer along with their total order amount.

Returns a single value for each row.

Used inside the SELECT statement.

✅ 2. Subquery with = Operator

Finds the customer who made the highest single order.

Uses nested MAX() function.

Returns a single value comparison.

✅ 3. Subquery with IN

Finds customers who have placed at least one order.

Filters records using a list returned by subquery.

✅ 4. Subquery with EXISTS (Correlated)

Checks if a customer has at least one related order.

Executes row-by-row.

Efficient for existence checks.

✅ 5. Correlated Subquery

Finds customers whose total spending is greater than the average order amount.

Depends on outer query values.

Advanced filtering logic.

✅ 6. Subquery in FROM Clause (Derived Table)

Creates a temporary result set containing total spending per customer and joins it with the customers table.

Useful for aggregations.

Improves query readability.

🎯 Learning Outcomes

After completing this project, you will:

Understand nested query execution

Use scalar and correlated subqueries

Apply subqueries with IN, EXISTS, and =

Perform advanced filtering

Improve logical thinking in SQL
