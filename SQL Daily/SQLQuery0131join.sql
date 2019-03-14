select s.custid, s.companyname, s.contactname, t.orderid, t.orderdate
from sales.customers s
inner join
sales.orders t
on s.custid
= t.custid
where s.custid = 85