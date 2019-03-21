/*
1. �뿩 �α� ������ ���ϱ� ���� ������ �������� ���ݱ��� ��� �뿩 �Ǿ����� ����  �ʹ�. 
�������� ��ȣ�� �뿩Ƚ���� ��ȸ�ϴ� SQL ���� �ۼ��Ͻÿ�. 
2. �ݳ��������� �������� ���� �ݳ����� ���� ���� �������� ����, ������ ���� �̸�, ��ȭ��ȣ, �ּҸ�
 ���� �ʹ�. ������ SQL ���� �ۼ��Ͻÿ�.    
3. ������ ������ ���׼ǹ����� �������� �ּ� �뿩��� �ִ� �뿩�� �׸��� ��հ����� �˰� �ʹ�. 
��� ����� �� �ٿ� ���̵��� ������ SQL���� �ۼ��Ͻÿ�.
4. ��� ���� �����ϱ� ���� ������� �뿩 Ƚ���� 5�� �̻��� ���� ID�� �� �̸��� ���� �ʹ�. 
������ SQL���� �ۼ��Ͻÿ�.  
*/

--1.
select tape_no, count(*) as noofrent from vs_rent
group by tape_no
-- select t.tape_no, count(*) from vs_tape t
-- join vs_rent r on t.tape_no = r.tape_no
-- group by t.TAPE_NO

--2.
select t.name, c.name, c.phone, c.address from vs_tape t
join vs_rent r on t.tape_no = r.tape_no
join vs_customer c on r.cust_id = c.cust_id
where r.return_flag = 'n'

--3.
select min(price) 'Min', max(price) 'Max', avg(price) 'Avg' from vs_tape t
join vs_sort s on s.code = t.SORT_CODE
where s.name = '�׼ǹ�'

--4.
select c.cust_id, c.NAME from VS_CUSTOMER c
join vs_rent r on c.cust_id = r.cust_id
group by c.cust_id, c.name
having count(*) >= 5

select * from vs_sort
select * from vs_tape
select * from VS_RENT
select * from vs_customer