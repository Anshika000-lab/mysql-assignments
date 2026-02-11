CREATE TABLE customers (
    customer_id VARCHAR(10),
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATE,
    total_amount INT
);

CREATE TABLE order_items (
    item_id VARCHAR(10),
    order_id VARCHAR(10),
    product_name VARCHAR(50),
    quantity INT,
    price INT
);

INSERT INTO customers VALUES
('C001','Amit','Mumbai'),
('C002','Riya','Delhi'),
('C003','Kabir','Chennai'),
('C004','Ananya','Kolkata'),
('C005','John','Mumbai');

INSERT INTO orders VALUES
('O001','C001','2023-06-01',1500),
('O002','C003','2023-06-02',900),
('O003','C002','2023-06-05',1800),
('O004','C001','2023-06-08',700),
('O005','C004','2023-06-08',2200);

INSERT INTO order_items VALUES
('I001','O001','Soap',3,50),
('I002','O001','Shampoo',2,200),
('I003','O002','Toothpaste',1,120),
('I004','O003','Soap',4,50),
('I005','O003','Facewash',1,180),
('I006','O004','Shampoo',1,200),
('I007','O005','Cream',2,300);
##SECTION A: JOINS


##Q1. Customer names with their order IDs
SELECT customers.name, orders.order_id
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;


##Q2. All customers, even if they have no orders
SELECT customers.name, orders.order_id
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;


##Q3. All orders, even if the customer is missing, will be processed.
SELECT orders.order_id, customers.name
FROM orders
LEFT JOIN customers
ON orders.customer_id = customers.customer_id;


## Q4. Orders placed in June 2023
SELECT customers. name, orders.order_id, orders.total_amount
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_date >= '2023-06-01'
AND orders.order_date <= '2023-06-30';


##Q5. Products purchased by each customer
SELECT customers. name, order_items.product_name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id;


##Q6. Customers who purchased Soap
SELECT DISTINCT customers. name
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id
WHERE order_items.product_name = 'Soap';

##Q7. Customer name, city, product, and quantity
SELECT customers.name, customers.city,
       order_items.product_name, order_items.quantity
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
JOIN order_items
ON orders.order_id = order_items.order_id;


##Q8. Orders that have more than one item
SELECT order_id
FROM order_items
GROUP BY order_id
HAVING COUNT(order_id) > 1;


##Q9. Customers who never placed any order
SELECT customers.name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;


##Q10. Total items in each order
SELECT order_id, SUM(quantity) AS total_items
FROM order_items
GROUP BY order_id;

 SECTION B: GROUP BY & AGGREGATION

Q11. Number of orders per customer
SELECT customers.name, COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;


Q12. Total revenue from each city
SELECT customers.city, SUM(orders.total_amount) AS total_revenue
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.city;


Q13. Average order value per customer
SELECT customers.name, AVG(orders.total_amount) AS avg_order_value
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name;


Q14. Total units sold per product
SELECT product_name, SUM(quantity) AS total_units_sold
FROM order_items
GROUP BY product_name;


Q15. Highest order amount
SELECT MAX(total_amount) AS highest_order_amount
FROM orders;


Q16. Revenue per order date
SELECT order_date, SUM(total_amount) AS daily_revenue
FROM orders
GROUP BY order_date;

Q17. Customer summary
SELECT customers.name AS customer_name,
       COUNT(DISTINCT orders.order_id) AS total_orders,
       SUM(order_items.quantity) AS total_items,
       SUM(orders.total_amount) AS total_spent
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
LEFT JOIN order_items
ON orders.order_id = order_items.order_id
GROUP BY customers.name;


Q18. Top 2 customers by spending
SELECT customers.name, SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name
ORDER BY total_spent DESC
LIMIT 2;


Q19. Product with highest revenue
SELECT product_name,
       SUM(quantity * price) AS total_revenue
FROM order_items
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 1;

Q20. Average quantity ordered per order
SELECT AVG(order_quantity) AS avg_quantity_per_order
FROM (
    SELECT order_id, SUM(quantity) AS order_quantity
    FROM order_items
    GROUP BY order_id
) temp;
