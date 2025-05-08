use forjob;
show tables;
Select * from Products;
Select * from Orders;
Select * from Order_items;
Select * from customers;
Select * from Categories;

/* Task 1: Top 10 Customers by revenue */

Select a.Name, b.Total_amount as Revenue
from Customers as a Join orders as b on a.Customer_id=b.Customer_id order by total_amount desc limit 10;

/* Task 2: Monthly Revenue Trent */

Select monthname(Order_date) as Month, sum(Total_amount) as Revenue from orders group by Month order by month;
Select Date_format(Order_date, '%M') as Month, Sum(Total_amount) as Revenue from Orders group by Month, Year(Order_date), Month(Order_date)
order by Year(order_date), Month(order_date);	

/*Task 3: Best-Selling Products(By quantity and revenue)*/

Select a.Name, b.Quantity, b.Quantity*Price as Revenue from Products as a join order_items as b on a.product_id = b.Product_id 
order by revenue desc, Quantity desc;

/* Task 4: Delayed shipment - Identify orders shipped late*/

Select a.Order_id, a.order_date, a.ship_date,  datediff(Ship_date, Order_date)as Delay from Orders as a Order by delay desc limit 50;

/* Task 5: Region-wise performance – total sales by customer region.*/

Select a.Region, sum(Total_amount) as Total_Sales from Customers as a Join Orders as b on a.customer_id=b.customer_id 
group by Region order by field(Region, 'North', 'South', 'East', 'West');

/* Task 6: Repeat customers – who purchased more than once. */

Select  b.Name, count(a.Customer_id) as Number_Of_Purchase from orders as a join customers as b
on a.customer_id=b.customer_id 
Group by Name 
Having count(a.Customer_id) > 1
order by Count(a.customer_id) desc;