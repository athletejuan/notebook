SELECT custid, companyname
FROM Sales.Customers AS c
WHERE EXISTS (
	SELECT * 
	FROM Sales.Orders AS o
	WHERE c.custid=o.custid);

select c.custid, c.companyname from sales.Customers c
inner join sales.orders O on c.custid = o.custid
group by c.custid, c.companyname