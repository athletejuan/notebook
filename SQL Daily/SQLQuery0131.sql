select*from sales.Customers

select custid, companyname from sales.Customers
select companyname, custid from sales.Customers

select unitprice, qty, (unitprice*qty) as 'totalprice'
from sales.OrderDetails;
select year(hiredate) as 'hireyear' from hr.Employees

SELECT distinct companyname, country
FROM Sales.Customers;

select firstname, lastname from hr.Employees;

select orderid, unitprice quantity
from sales.OrderDetails

select so.custid, so.orderdate
from sales.Orders as so

select od.orderid, od.unitprice, od.qty as quantity
from sales.OrderDetails as od;

select S.orderid, T.orderid 
from sales.orders S, sales.OrderDetails T

select orderid, unitprice, qty as quantity
from sales.OrderDetails order by quantity

select orderid, unitprice, qty as quantity
from sales.OrderDetails where qty > 10

select categoryid,
case categoryid
	when 1 then 'Beverages'
	when 2 then 'Condiments'
	when 2 then 'Confections'
	else 'Unknown Category'
end as categoryname
from Production.Categories