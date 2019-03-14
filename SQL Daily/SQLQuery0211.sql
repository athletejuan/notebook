create database TestDB
use TestDB

create table TestTbl
(
	SeqNo INT,
	Col1 varchar(10)
)
select * from TestTbl
insert into TestTbl(seqno, col1)
values(1,'item1')
insert into TestTbl(seqno, col1)
values(1,'item1'),(2,'item2')

create table TestTbl2
(
	SeqNo INT,
	Col1 varchar(10)
)
select * from TestTbl
select * from TestTbl2
select seqno, col1 from testtbl
where col1 = 'item1'
insert into testtbl2(seqno, col1)
select seqno, col1 from testtbl
where col1 = 'item1'

create table TestTbl3
(
	SeqNo INT,
	Col1 varchar(10)
)
select * from TestTbl3
select seqno, col1 from TestTbl2
where seqno = 2
-- stored procedure
create procedure testtbl2byseqno
(
@seqno int
)
as
select seqno, col1 from TestTbl2
where seqno = @seqno

testtbl2byseqno 1
testtbl2byseqno @seqno=1
insert into testtbl3(seqno, col1)
exec testtbl2byseqno @seqno=1
select *from testtbl3

select * into testtbl4 from testtbl3
select SeqNo into TestTbl5 from testtbl3
select * from testtbl4
select * from testtbl5

select * from testtbl
begin tran
update testtbl set col1= 'product1'
where seqno = 1
commit
rollback

create table TestTbl10
(
	SeqNo INT,
	Col1 varchar(10)
)
go
create table TestTbl11
(
	SeqNo INT,
	Col1 varchar(10)
)
go
insert into TestTbl10(seqno, col1)
values(1,'item1'),(2,'item2'),(3,'item3')
insert into TestTbl11(seqno, col1)
values(3,'item3'),(4,'item4'),(5,'item5')
select * from testtbl10
select * from testtbl11
--delete from testtbl11
select * from testtbl10 s inner join testtbl11 t
on s.seqno = t.seqno
select * from testtbl11 where seqno not in(3)
insert into testtbl10 (seqno, col1) 
select * from testtbl11 where seqno not in(3)

merge into testtbl10 as s 
using(select * from testtbl11) as t
on s.seqno = t.seqno
when matched then
	update set s.seqno=t.seqno
when not matched then
	insert values(t.seqno, t.col1);

select * from testtbl10
delete from testtbl10

select * from TestTbl11
where col1 = 'item3'
delete from testtbl11
where col1 = 'item3'

truncate table testtbl11

create table TestTbl12
(
	SeqNo Int identity(1,1),
	Col1 varchar(10)
)
go
insert into testtbl12(col1) values('item1')
select * from testtbl12

CREATE SEQUENCE dbo.InvoiceSeq 
AS INT START WITH 1 INCREMENT BY 1
SELECT NEXT VALUE FOR dbo.InvoiceSeq;

create table TestTbl13
(
	SeqNo INT,
	Col1 varchar(10)
)
insert into testtbl13(seqno,col1) 
values(next value for dbo.invoiceseq, 'item1')
select*from testtbl13