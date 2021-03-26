-- 1. Change the query shown so that it displays Nobel prizes for 1950.
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950
 -- 2. Show who won the 1962 prize for Literature.
 SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'
-- 3. Show the year and subject that won 'Albert Einstein' his prize.
SELECT yr,subject FROM nobel
WHERE winner = 'Albert Einstein'

-- 4. Give the name of the 'Peace' winners since the year 2000, including 2000.
 SELECT winner FROM nobel WHERE subject ='peace'
AND yr >= 2000

-- 5. Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
SELECT * FROM nobel WHERE subject = 'Literature' AND yr >=1980 AND yr <=1989

-- 6.Show all details of the presidential winners:

        Theodore Roosevelt
        Woodrow Wilson
        Jimmy Carter
        Barack Obama

SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt' , 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

 -- 7. Show the winners with first name John
 SELECT winner FROM nobel WHERE winner LIKE 'john%'
 -- 8. Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
 SELECT * FROM nobel WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984)
 -- 9. Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
  SELECT * FROM nobel WHERE yr=1980 AND subject <> 'Chemistry' AND subject <> 'Medicine'
  -- 10. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
  SELECT * FROM nobel WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004
  -- 11. 

  // MySql Tutorial
  -- WHERE is used to filter result
  -- DISTINCT is used to make query result unique
  -- AS is used to change the title of a returned column
  --

  -- 1. SELECT 
            name,
            unit_price,
            unit_price * 1.1 AS 'new price'
        FROM products

  -- 2. SELECT * 
        FROM orders
        WHERE order_date >= '2019-01-01'

  -- 3. SELECT * FROM order_items
        WHERE order_id=6 AND unit_price * quantity > 30

  --4. SELECT * FROM products 
        WHERE quantity_in_stock IN (49,38,72)

  --5. SELECT * FROM customers WHERE birthdate BETWEEN  '1990-01-01' AND '2000-01-01'

  --6. SELECT * FROM customers WHERE address LIKE '%TRAIL%' OR address LIKE '%AVENUE%'

  --7. SELECT * FROM  customers WHERE phone_number LIKE '%9'

  --8.  SELECT * 
        FROM customers 
        WHERE first_name IN ('ELKA','AMBUR')

 --9. SELECT * FROM customers
      WHERE last_name REGEXP 'EY$ | ON$'

  --10. SELECT * FROM customers
        WHERE last_names REGEXP '^MY | SE'

  -- 11. SELECT * FROM customers
      WHERE last_name REGEXP 'B[RU]'

  -- 12. SELECT * FROM orders
            WHERE shipped_date IS NULL 

  --13. SELECT * FROM order_items 
            WHERE  order_id = 2
            ORDER BY quantity * unit_price DESC

 --14. SELECT * FROM customers 
      ORDER BY points DESC
      LIMIT 3

 --15. SELECT p.product_id product_name quantity,unit_price FROM
      order_items o JOIN products p ON o.product_id=p.product_id

  --16. SELECT 
            payment_id,
            c.name,
            pay.date,
            pm.name as payment_methods
        FROM payment pay
        JOIN clients c 
            ON pay.client_id = c.client_id
        JOIN payment_methods pm
            ON pay.payment_methods = pm.payment_method_id

      --17. SELECT 
                  p.product_id,
                  p.name,
                  oi.quantity
            FROM product p
            LEFT JOIN order_items oi
                  ON p.product_id = oi.product_id

      --18. SELECT 
                  order_date,
                  o.order_id,
                  c.first_name,
                  s.name AS shipper,
                  os.name AS status
            FROM orders o
               JOIN customers c
                  ON o.customer_id = c.customer_id
            LEFT JOIN shipper s
                  ON o.shipper_id = s.shipper_id
            JOIN order_status os
                  ON o.status_id = os.status_id

      --19. SELECT 
                  p.date,
                  c.name AS client,
                  p.amount,
                  pm.name AS payment_method
            FROM payments p
            JOIN clients c
                 -- ON p.client_id = c.client_id
                 USING(client_id)
            JOIN payment_methods pm
                  ON p.payment_method = pm.payment_method_id

      --20. IMPLICIT CROSS JOIN
            SELECT *
            FROM shippers  , products  ;

            --EXPLICIT CROSS JOIN
            SELECT * FROM shippers  CROSS JOIN product 

      --21. SELECT 
                  customer_id,
                  first_name,
                  points,
                  'Bronze' AS type
            FROM customers
            WHERE points < 2000

            UNION

            SELECT 
                  customer_id,
                  first_name,
                  points,
                  'Silver' AS type
            FROM customers
            WHERE points BETWEEN 2000 AND 3000
           
            UNION

            SELECT 
                  customer_id,
                  first_name,
                  points,
                  'Gold' AS type
            FROM customers
            WHERE points > 3 000
            ORDER BY first_name

      --22. INSERT INTO products (name,quantity_in_stock,unit_price)
            VALUES ('jakaka' , 30 , 11.3),
                  ('jakaka' , 30 , 11.3),
                  ('jakaka' , 30 , 11.3) 

      --23. CREATE TABLE  invoices_archive AS  
      
            SELECT 
                  invoice_id,
                  i.number,
                  c.name AS client_name,
                  i.invoice_total,
                  i.payment_total,
                  i.payment_date
            FROM invoices i
                  JOIN clients c
                  USING(client_id)
            WHERE payment_date IS NOT NULL

      --24. UPDATE customers 
            SET 
                  points =points + 50
            WHERE birth_date < '1990-01-01'

      --25. UPDATE orders 
            SET comments='Gold cutomers'
            WHERE customer_id IN (
                  SELECT customer_id
                  FROM customers
                  WHERE  points > 3000 
            )    