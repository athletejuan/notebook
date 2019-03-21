/*
1. 'ȫ�浿' ������ �������� �뿩�� Ƚ��(�̹ݳ� ����)�� �˰� �ʹ�. ������ SQL���� �ۼ��Ͻÿ�. 
2. �뿩 �α� ������ ���ϱ� ���� ������ �������� ���ݱ��� ��� �뿩 �Ǿ����� ���� �ʹ�. �������� 
��ȣ�� �뿩 Ƚ���� ��ȸ�ϴ� SQL���� �ۼ��Ͻÿ�.
3. ������ ������ '�׼ǹ�'�� ��� �������� ���ؼ� ������ ��ȣ�� ������ ������ ������ ������ 
������������ ��ȸ�ϱ� ���� SQL���� �ۼ��Ͻÿ�.
4. ������ ������ '�׼ǹ�'�� �������� �ּ� �뿩��� �ִ� �뿩�� �׸��� ��հ����� �˰� �ʹ�. 
��� ����� �� �ٿ� ���̵��� ������ SQL���� �ۼ��Ͻÿ�.
*/

--1.
select count(*) from VS_CUSTOMER c
join vs_rent r on c.cust_id = r.CUST_ID
where name = 'ȫ�浿'

--2.
select tape_no, count(*) noofrent from vs_rent
group by tape_no

--3.
select t.tape_no, t.name from vs_tape t
join vs_sort s on t.sort_code = s.code
where s.name = '�׼ǹ�'
order by t.NAME asc

--4.
select min(price) 'Min', max(price) 'Max', avg(price) 'Avg' from vs_tape t
join vs_sort s on s.code = t.SORT_CODE
where s.name = '�׼ǹ�'


select * from vs_sort
select * from vs_tape
select * from VS_RENT
select * from vs_customer


















--1. vs_customer,vs_rent,cust_id
select s.name, count(u.cust_id) as '�뿩 Ƚ��' 
from vs_customer s 
inner join vs_rent u 
on s.cust_id = u.cust_id
where s.name ='ȫ�浿'
group by s.name,u.cust_id

--2. vs_tap, vs_rent, tape_no
select tape_no, count(tape_no) as '�뿩 Ƚ��'
from vs_rent
group by tape_no
order by '�뿩 Ƚ��'desc

--3. vs_tape,vs_sort,tape_no,name
select s.TAPE_NO,s.NAME
from vs_tape s
inner join VS_SORT u
on s.SORT_CODE = u.CODE
where u.name ='�׼ǹ�'
order by s.name

--4. vs_tape,vs_sort,price
select min (s.price) as '�ּ� �뿩��', max (s.price) as '�ִ� �뿩��', avg(s.price) as '��� ����'
from vs_tape s
inner join vs_sort u
on s.SORT_CODE = u.CODE
where u.NAME ='�׼ǹ�'