--- 1.  Find the Total Number of Orders for Each Customer 
SELECT 
     c.first_name,
	 c.last_name,
	 sum(o.order_id) as total_order
FROM
    Customers c 
JOIN
    Orders o ON c.customer_id = o.Customer_id
GROUP BY
c.first_name,c.last_name;

--- 2.  Find the Total Sales Amount for Each Product (Revenue per Product) 
SELECT 
    p.product_id,
    p.product_name,
    SUM(od.quantity * od.unit_price) AS total_sales_amount
FROM 
    Products p
JOIN 
    OrderDetails od ON p.product_id = od.product_id
GROUP BY 
    p.product_id, p.product_name
ORDER BY 
    total_sales_amount DESC;

--- 3. Find the Most Expensive Product Sold 
SELECT TOP 1
    price ,
	product_name
	product_id
FROM
    Products
ORDER BY
    price desc

--- 4.Get the List of Customers Who Have Placed Orders in the Last 30 Days 
SELECT 
     c.first_name,
	 c.last_name
FROM
    Customers c
JOIN 
   Orders o ON c.customer_id = o.customer_id
Where
 o.order_date >= DATEADD(DAY, -30, GETDATE())
 GROUP BY
 c.first_name,c.last_name

 --- 5. Calculate the Total Amount Paid by Each Customer 
 SELECT 
     c.first_name,
	 c.last_name,
	 sum(total_amount) as total_amount
FROM 
Customers c 
JOIN 
Orders o ON c.customer_id = o.customer_id
GROUP BY
c.first_name,c.last_name

--- 6. Get the Number of Products Sold by Category 
SELECT 
     Count(product_id) as no_products,
	 category 
FROM
    Products
group by
category 
order by
no_products desc

--- 7. List All Orders That Are Pending (i.e., Orders that haven't been shipped yet) 
SELECT 
    order_id,
	order_status
FROM
   Orders
WHERE
   order_status = 'Pending'

--- 8. . Find the Average Order Value (Total Order Amount / Number of Orders) 
SELECT AVG(total_amount) AS average_order_value
FROM Orders;

--- 9 . List the Top 5 Customers Who Have Spent the Most Money 
SELECT TOP 5 
c.customer_id, c.first_name, c.last_name, SUM(p.payment_amount) AS total_spent
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Payments p ON o.order_id = p.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC

--- 10. Find the Products That Have Never Been Sold 
SELECT *
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM OrderDetails
);



