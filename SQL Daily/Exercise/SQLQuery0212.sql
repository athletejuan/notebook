use NewCompany
go

select * from member

--1. Ȳ���ư� ���� �μ��� ���� ����� �̸�, �Ի���, �޿��� ǥ���Ͻÿ�.
select dept_id from member
where name = 'Ȳ����'
select name, hire, sal from member
where dept_id = (select dept_id from member where name = 'Ȳ����')

--2. �޿��� ��ձ޿����� ���� ��� ���, �̸� ǥ���Ͻÿ�.
select member_id, name from member
where sal > (select avg(sal) from member)

--3. ��ձ޿��� ���� ���� �μ���ȣ�� ��ձ޿��� ǥ���Ͻÿ�.
select dept_id, avg(sal) from member group by dept_id having max(avg(sal))
select max(avg(sal)) from member group by dept_id
