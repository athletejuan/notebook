sp_help testtbl
sp_help [sales.customers]
go
use testdb
go
select * from testtbl
-- transaction start(begin tran)
begin tran
update testtbl set col1 = 'product5' where seqno = 1
-- transaction end(commit)
rollback

select 'test is a test'
select replace('test is a test','test','pig')

select * from testtbl
select replace(col1, 'product2','apple')
from testtbl
select str(123.42124, 6, 1)
select str(floor(123.45), 8, 3)

go
create table TestTbl14
(
SeqNo INT,
Col1 Varchar(10),
Col2 INT
)
Go
sp_help TestTbl14
Go
Insert into TestTbl14(SeqNo, col1, col2) values
(1, 'item1',1),(2,'item2',null),(3,'item',3),(4,'item',4)
--delete from testtbl14
select * from testtbl14
select count(*),avg(seqno),avg(col2), min(col2), max(col2), sum(col2) from testtbl14
select isnull(col2,0) from testtbl14
use tsql
go
SELECT TOP(5) productid, productname, unitprice,
	RANK() OVER(ORDER BY unitprice DESC) AS rankbyprice
FROM Production.Products
ORDER BY rankbyprice;

USE [TestDB]
GO
select * from emps
-- row_numbers()
select 
rank() over (order by salary desc) as 'Seq',
name,dept, role, salary
from Emps
