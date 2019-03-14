select '1' + 2
select '1' + '2'

SELECT CAST(SYSDATETIME() AS date);

use tsql
go

SELECT 	productid, unitprice from Production.Products;
SELECT 	productid, unitprice, 
			IIF(unitprice > 50, 'high','low') AS pricepoint
FROM Production.Products;

use testdb
go
select seqno, isnull(col2, 0) from testtbl14
select seqno, coalesce(col2,0) from testtbl14

select seqno, isnull(col2, '0') from testtbl14
select seqno, coalesce(col2,'0') from testtbl14

select isnull(null, null)
select coalesce(null,null)

