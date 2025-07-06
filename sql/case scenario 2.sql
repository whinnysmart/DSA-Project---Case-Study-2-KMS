#CASE 2

#6
#Most Valuable Customers
SELECT 
    k.`Customer Name`,
    k.`Product Category`,
    k.`Product Sub-Category`,
    SUM(k.`Sales`) AS Category_Sales
FROM 
    `kms sql case study` k
JOIN (
    SELECT `Customer Name`
    FROM `kms sql case study`
    GROUP BY `Customer Name`
    ORDER BY SUM(Sales) DESC
    LIMIT 10
) AS top_customers 
ON k.`Customer Name` = top_customers.`Customer Name`
GROUP BY 
    k.`Customer Name`, k.`Product Category`, k.`Product Sub-Category`
ORDER BY 
    Category_Sales DESC;
    
#7
#Small Business Customer with the Highest Salary
SELECT 
    `Customer Name`, `Customer Segment`, SUM(Sales) AS `Total Sales`
FROM
    `kms sql case study`
WHERE `Customer Segment` = 'Small Business'
GROUP BY `Customer Name`
ORDER BY `Total Sales` DESC limit 1;

#8
#Corporate Business Customer with the Most Order
SELECT 
    `Customer Name`, `Customer Segment`, SUM(`Order Quantity`) AS `Total Order Made`
FROM
    `kms sql case study`
WHERE `Customer Segment` = 'Corporate'
GROUP BY `Customer Name`
ORDER BY `Total Order Made` DESC limit 1;

#9
#Consumer Customer with the Most Profit
SELECT 
    `Customer Name`, `Customer Segment`, SUM(`Profit`) AS `Total Profit`
FROM
    `kms sql case study`
WHERE `Customer Segment` = 'Consumer'
GROUP BY `Customer Name`
ORDER BY `Total Profit` DESC limit 1;

#10
#Customer that Returned Items
SELECT 
	os.`Order ID`,
    `Customer Name`,
    `Customer Segment`,
    `Order Date`,
    os.`Status`
FROM
    `kms sql case study` AS kms
RIGHT JOIN `order_status` AS os
USING(`Order ID`);

#11
#Orders based on Order Priority and Ship Mode 
SELECT 
	reg.`Order Priority`,
    `Cost for Regular Air`,
    `Order_Count for Regular Air`,
    `Cost for Express Air`,
    `Order_Count for Express Air`,
    `Cost for Delivery Truck`,
    `Order_Count for Delivery Truck`
FROM (
	SELECT 
		`Order Priority`, SUM(`Shipping Cost`) AS `Cost for Regular Air`, COUNT(*) AS `Order_Count for Regular Air`
	FROM
		`kms sql case study`
	WHERE `Ship Mode` = 'Regular Air'
	GROUP BY `Order Priority`) AS reg
JOIN (
	SELECT 
		`Order Priority`, SUM(`Shipping Cost`) AS `Cost for Express Air`, COUNT(*) AS `Order_Count for Express Air`
	FROM
		`kms sql case study`
	WHERE `Ship Mode` = 'Express Air'
	GROUP BY `Order Priority`) AS exp
ON reg.`Order Priority` = exp.`Order Priority`
JOIN (
	SELECT 
		`Order Priority`, SUM(`Shipping Cost`) AS `Cost for Delivery Truck`, COUNT(*) AS `Order_Count for Delivery Truck`
	FROM
		`kms sql case study`
	WHERE `Ship Mode` = 'Delivery Truck'
	GROUP BY `Order Priority`) AS del
ON exp.`Order Priority` = del.`Order Priority`;

SELECT * FROM `kms sql case study`;

SELECT * FROM `order_status`;