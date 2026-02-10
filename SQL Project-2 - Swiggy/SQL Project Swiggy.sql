-- Create Database
CREATE DATABASE swiggy_db;

-- Switch to the database
USE swiggy_db;

-- Create Tables

CREATE TABLE swiggy(
restaurant_no INTEGER NOT NULL,
restaurant_name VARCHAR(50) NOT NULL,
city VARCHAR(10) NOT NULL,
address VARCHAR(250),
rating DECIMAL(3,1) NOT NULL,
cost_per_person INTEGER ,
cuisine VARCHAR(50) NOT NULL,
restaurant_link VARCHAR(150) NOT NULL,
menu_category VARCHAR(100),
item VARCHAR(200),
price VARCHAR(15) NOT NULL,
veg_or_nonveg VARCHAR(10)
);


-- View Tables
SELECT * FROM swiggy Limit 10;


-- Next Step
-- Import Data into swigy Table



# Advance  level:

-- 04 Calculate the rating rank for each restaurant within its city (rank = 1)?
WITH rating_rank_by_city AS (
    SELECT Distinct restaurant_name, city, rating,
           DENSE_RANK() OVER (PARTITION BY city ORDER BY rating DESC) AS rating_rank
    FROM swiggy
)
SELECT restaurant_name, city, rating, rating_rank
FROM rating_rank_by_city
WHERE rating_rank = 1;


SELECT * FROM swiggy Limit 10;













