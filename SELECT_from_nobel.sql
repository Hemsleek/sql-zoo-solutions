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