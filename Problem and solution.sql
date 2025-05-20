CREATE TABLE store(
Transactions_id INT PRIMARY KEY,
Sale_date DATE,
Sale_time TIME,
customer_id INT,
Gender VARCHAR(10),
Age INT,
Category VARCHAR(20),
Quantity INT,
Price_per INT,
Cogs INT,
Total_sales INT
);

SELECT * FROM Store;

#---------------------------------------------------Business Performance---------------------------------------------------

# "What is the total revenue (total_sale) and total cost of goods sold (cogs)?"

SELECT * FROM store;

SELECT 
	SUM(Total_Sales) AS Total_Sales, 
    SUM(cogs) AS Total_cost 
FROM store;
    

# "What is the total profit and overall profit margin?"

SELECT 
	SUM(Total_sales - Cogs) AS Profit,
    ROUND(SUM(Total_sales - Cogs)* 100 / SUM(Total_sales), 2)  AS Profit_percentage
FROM 
	store;    

# "What is the trend of total sales month by month?"

SELECT * FROM store;

SELECT 
	DATE_FORMAT(Sale_date, '%Y-%M') AS Sale_Month,
    SUM(Total_Sales) AS Total_Sales
FROM 
	store
	GROUP BY Sale_Month
    ORDER BY Total_sales DESC;
    

# Which product category has the highest total sales?

SELECT 
	Category, 
    SUM(Total_sales) AS Total_Sale 
FROM 
	store
	GROUP BY Category
    ORDER BY Total_sale DESC
    LIMIT 1;
        
#  Which gender contributes more to total sales?

SELECT * FROM store;

SELECT 
	Gender, 
	SUM(Total_sales) AS Total_Sale 
FROM
	store
	GROUP BY Gender
    ORDER BY Total_sale DESC
    LIMIT 1;  
    

# What is the average purchase amount by age group?

SELECT * FROM store;

SELECT 
	CASE
		WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
		ELSE '46+'
        END AS Age_Group, ROUND(AVG(Total_Sales), 2) AS Avg_purchase
FROM 
	store
	GROUP BY Age_group
	ORDER BY Age_group;

# Which hour of the day has the highest sales volume?

SELECT 
	HOUR(Sale_time)  As Hour, 
    COUNT(Transactions_iD) AS ID  
FROM store
	GROUP BY hour
	ORDER BY ID DESC;


# Which day of the week generates the highest total sales?

SELECT * FROM store;

SELECT 
	DAYNAME(Sale_date) AS Day, 
    SUM(Total_sales) AS Total  
FROM 
	store
	GROUP BY Day
	ORDER BY Total DESC;
    
# Which category has the highest profit margin?

SELECT * FROM store;

SELECT 
	Category, 
	SUM(Total_sales - Cogs) AS Profit 
FROM 
	store
	GROUP BY Category
    ORDER BY Profit DESC;

# Which customer age group generates the most revenue?


SELECT 
	CASE
		WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
		ELSE '46+'
        END AS Age_Group, SUM(Total_Sales) AS Total_purchase
FROM 
	store
	GROUP BY Age_group
	ORDER BY Total_purchase DESC;