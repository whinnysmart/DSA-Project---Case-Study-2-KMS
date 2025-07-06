SELECT * FROM kms_db.`kms sql case study`;

#CASE 1

#1
#Product Category with the Highest Sales
SELECT 
    `Product Category`, SUM(Sales) as `Total Sales`
FROM
    `kms sql case study`
GROUP BY `Product Category`
ORDER BY `Total Sales` DESC limit 1;

#2
#Top 3 Regions based on Sales
SELECT 
    `Region`, SUM(Sales) as `Total Sales`
FROM
    `kms sql case study`
GROUP BY `Region`
ORDER BY `Total Sales` DESC limit 3;

#Bottom 3 Regions based on Sales
SELECT 
    `Region`, SUM(Sales) as `Total Sales`
FROM
    `kms sql case study`
GROUP BY `Region`
ORDER BY `Total Sales` ASC limit 3;

#3
#Total Sales of Appliances in Ontario
SELECT 
    `Region`, `Product Sub-Category`, SUM(Sales) as `Total Sales`
FROM
    `kms sql case study`
WHERE
    `Region` = 'Ontario' and `Product Sub-Category` = 'Appliances';

#4
#Revenue from the Bottom 10 Customers
SELECT 
    `Customer Name`, `Region`, `Customer Segment`, `Order Quantity`, `Discount`, SUM(Sales) AS `Total Sales`
FROM
    `kms sql case study`
GROUP BY `Customer Name`, `Region`, `Customer Segment`, `Order Quantity`, `Discount`
ORDER BY `Total Sales` ASC LIMIT 10;

#5
#Shipping Mode with the Most Shipping Cost
SELECT 
    `Ship Mode`, SUM(`Shipping Cost`) as `Total Shipping Cost`
FROM
    `kms sql case study`
GROUP BY `Ship Mode`
ORDER BY `Total Shipping Cost` DESC;

SELECT * FROM `kms sql case study`;

SELECT * FROM `order_status`;