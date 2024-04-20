-- SQL Aggregations  

SELECT *
FROM superstore;

-- Q1. What is the difference between COUNT(*), COUNT(expression), 
		-- and COUNT(DISTINCT expression)?
        
SELECT COUNT(*), COUNT(state) , COUNT(DISTINCT state)
FROM superstore; 
        
-- Q2. Do basic Exploratory data analysis (EDA) of the dataset. For example-
		-- How many rows do we have?
        
        SELECT count(*) as newrow, count(DISTINCT order_id) as neworders , count( DISTINCT customer_Name)
        FROM superstore;  	
        
		-- How much profit did we make in total?
        
        SELECT COUNT(*), SUM(profit), COUNT(DISTINCT order_date)
        FROM superstore ;
	
		-- What was the highest and lowest sales per quantity ?
        
        SELECT COUNT(*), MAX(sales/quantity), MIN(sales/quantity)
        FROM superstore; 
        
-- Q3- Write a query to get total profit, first order date and latest order date for each category

SELECT category, sum(profit) as Totalporfit, MIN(order_date), MAX(order_date)
FROM superstore
GROUP BY category;

-- Q4. How many orders were placed on each day?

SELECT order_date, count(DISTINCT order_id)
FROM superstore 
GROUP BY order_date;


-- Q5. How many orders were placed for each type of Ship mode? 

SELECT ship_mode, COUNT(DISTINCT order_id)
FROM superstore
GROUP BY ship_mode; 
    
-- Q6. How many orders were placed on each day for Furniture Category?

SELECT order_date , COUNT(DISTINCT order_id)
FROM superstore
WHERE Category = "Furniture"
GROUP BY order_date; 

-- Q7. How many orders were placed per day 
		-- for the days when sales was greater than 1000?

SELECT order_id , COUNT(DISTINCT order_date), SUM(sales) as Totalsales 
FROM superstore
GROUP BY order_id
HAVING SUM(sales) > 1000;

-- Q8. What will below codes return? What is the issue here?
		SELECT category, sub_category, SUM(profit) AS profit
		FROM superstore
		GROUP BY category;

		SELECT category, SUM(profit) AS profit
		FROM superstore
		GROUP BY category, sub_category;

-- 9. Find quantities sold for combination of each category and subcategory


SELECT category , sub_category, SUM(quantity)
FROM superstore
GROUP BY category , sub_category; 

-- 10. Find quantities sold for combination of each category and subcategory 
		-- when quantity sold is greater than 2
        
SELECT category, sub_category, SUM(quantity)
FROM superstore 
WHERE quantity > 2
GROUP BY category, sub_category;    

-- Q11. Find quantities sold for combination of each category and subcategory 
		-- when quantity sold in the combination is greater than 100
        
SELECT category, sub_category, SUM(quantity)
FROM superstore 
GROUP BY category, sub_category
HAVING  SUM(quantity) > 100; 

-- Q12. Write a query to find sub-categories where average profit is more than the one tenth of the max profit in that sub-category

SELECT sub_category , MAX(profit), AVG(profit)
FROM superstore 
GROUP BY sub_category
HAVING  AVG(profit) > MAX(profit)/10; 
	

-- Q13. Create the exams table with below script
-- Write a query to find students who have got same marks in Physics and Chemistry.

SELECT * 
FROM exams; 

SELECT student_id, COUNT(subject) as TotalExams , COUNT(distinct marks) as distinctMarks 
FROM exams
WHERE subject IN ("Physics" , "Chemistry")
GROUP BY student_id
HAVING COUNT(subject) = 2 AND COUNT(distinct marks) = 1; 

CREATE TABLE exams 
(student_id int, 
subject varchar(20), 
marks int);

INSERT INTO exams VALUES 
(1,'Chemistry',91),
(1,'Physics',91),
(1,'Maths',92),
(2,'Chemistry',80),
(2,'Physics',90),
(3,'Chemistry',80),
(3,'Maths',80),
(4,'Chemistry',71),
(4,'Physics',54),
(5,'Chemistry',79);

