select * from [dbo].[po_employeer]
select * from [dbo].[po_item]
select * from [dbo].[PO_ORDER_DETAIL]
select * from [dbo].[PO_ORDER_HEADER]
select * from [dbo].[PO_SUPPLIER]

select E.emp_name, H.ord_no, sum(d.ord_qty) 'SUM' from po_employeer E
join po_order_header H on E.emp_no = H.ord_emp
join po_order_detail D on H.ord_no = D.ord_no
join po_item I on D.item_no = I.item_no
where E.emp_name = '½Å½ÂÈÆ'
group by e.emp_name, H.ord_no

--1
select * from po_order_detail
where ord_no = 19971213
order by ord_qty asc

--2
select ord_no, ord_date from po_order_header OH
join PO_supplier S on oh.sup_no = S.sup_no
--where oh.ord_no >= 19971201 and oh.ord_no < 19980101 and s.sup_name = 'LGÀüÀÚ'
where oh.ord_date between '1997-12-01' and '1997-12-31' and s.sup_name = 'LGÀüÀÚ'
--and convert(varchar(6), ord_date, 112)
--and between '1997-12-01' and '1997-12-31'
order by oh.ord_date desc

--3
select ord_no, i.item_no, i.item_name, ord_qty from po_order_detail od
join po_item i on od.item_no = i.item_no
where ord_no = 19971203
order by item_no asc

--4
select ord_no, sup_name, sup_phone from po_order_header oh
join po_supplier s on oh.sup_no = s.sup_no
--where oh.delv_date is null
where oh.due_date < oh.delv_date or oh.delv_date is null
order by s.sup_name asc

--5
select emp_dep, min(emp_no) emp_no from PO_EMPLOYEER
--where emp_dep in ('±¸¸ÅÆÀ','¿ÜÀÚÆÀ','È«º¸ºÎ')
group by emp_dep

--6
select distinct sup_name, sup_addr from PO_SUPPLIER S
join Po_order_header oh on oh.sup_no = S.sup_no
join PO_EMPLOYEER e on e.emp_no = oh.ord_emp
where EMP_NAME = '¹ÚÂùÈ£' and emp_dep = 'È«º¸ºÎ' and year(oh.ORD_DATE) = 1997
group by sup_name, sup_addr
order by sup_name asc

--7
select sum(i.unit_price * od.ord_qty) LGÀüÀÚ from po_item i
join po_order_detail od on i.item_no = od.item_no
join po_order_header oh on od.ord_no = oh.ord_no
join po_supplier s on s.sup_no = oh.sup_no
where sup_name = 'LGÀüÀÚ' and convert(varchar(6), oh.delv_date, 112) = 199712
--od.ord_no >= 19971201 and od.ord_no <19980101 and oh.delv_date is not null

--8
select SUP_NO, count(*) 'Delay' from PO_ORDER_HEADER OH
where due_date < delv_date
group by sup_no
having count(*) >= 2

--9
select max(i.unit_price) 'Top Unit Price' from po_item i
join PO_ORDER_DETAIL od on i.item_no = od.item_no
join PO_ORDER_HEADER oh on od.ord_no = oh.ord_no
where year(oh.ord_date) = 1997
--where convert(varchar(4), oh.ord_date, 112) = 1997