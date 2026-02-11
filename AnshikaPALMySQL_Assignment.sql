-- Q1: Show all data from products table
SELECT *
FROM products;

-- Q2: Show product name and price
SELECT product_name, price
FROM products;

-- Q3: Products from Electronics category
SELECT *
FROM products
WHERE category = 'Electronics';

-- Q4: Products with price less than 1000
SELECT *
FROM products
WHERE price < 1000;

-- Q5: Products with stock 50 or more
SELECT *
FROM products
WHERE stock >= 50;

-- Q6: Products from Fashion or Grocery
SELECT *
FROM products
WHERE category = 'Fashion'
OR category = 'Grocery';

-- Q7: Products priced between 500 and 5000
SELECT *
FROM products
WHERE price >= 500
AND price <= 5000;

-- Q8: Products not in Electronics category
SELECT *
FROM products
WHERE category != 'Electronics';

-- Q9: Electronics products costing more than 3000
SELECT *
FROM products
WHERE category = 'Electronics'
AND price > 3000;

-- Q10: Grocery products cheaper than 300 or stock more than 100
SELECT *
FROM products
WHERE category = 'Grocery'
AND (price < 300 OR stock > 100);

-- Q11: Product names starting with S
SELECT *
FROM products
WHERE product_name LIKE 'S%';

-- Q12: Product names containing oo
SELECT *
FROM products
WHERE product_name LIKE '%oo%';

-- Q13: Product names ending with t
SELECT *
FROM products
WHERE product_name LIKE '%t';

-- Q14: Sort products by price (low to high)
SELECT *
FROM products
ORDER BY price;

-- Q15: Sort products by stock (high to low)
SELECT *
FROM products
ORDER BY stock DESC;

-- Q16: Electronics products sorted by price (high to low)
SELECT *
FROM products
WHERE category = 'Electronics'
ORDER BY price DESC;

-- Q17: Fashion products priced above 1000, sorted by stock
SELECT *
FROM products
WHERE category = 'Fashion'
AND price > 1000
ORDER BY stock;

-- Q18: Products with stock from 20 to 100, sorted by price
SELECT *
FROM products
WHERE stock >= 20
AND stock <= 100
ORDER BY price DESC;

-- Q19: Products with letter a in name, sorted A to Z
SELECT *
FROM products
WHERE product_name LIKE '%a%'
ORDER BY product_name;

-- Q20: Top 5 expensive products
SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- Q21: Second most expensive product
SELECT *
FROM products
ORDER BY price DESC
LIMIT 1 OFFSET 1;

-- Q22: All products except 3 cheapest
SELECT *
FROM products
ORDER BY price
LIMIT 100 OFFSET 3;

-- Q23: Electronics products with low stock and high price
SELECT *
FROM products
WHERE category = 'Electronics'
AND stock < 50
AND price > 3000
ORDER BY product_name;

-- Q24: Product names longer than 5 characters
SELECT *
FROM products
WHERE LENGTH(product_name) > 5;

-- Q25: Products where price is divisible by 5
SELECT *
FROM products
WHERE price % 5 = 0;
