select * from dept
select * from member

-- SQL Server(Local)
-- Azure SQL Database(Azure)

-- ��� �޿��� �ְ��� �����ϴ� �μ���ȣ�� ��ձ޿� ǥ���Ͻÿ�.

Select dept_id, avg(sal) from member group by dept_id 
having avg(sal) = (Select top 1 avg(sal) from member group by dept_id
order by avg(sal) desc)

Select top 1 avg(sal) from member group by dept_id
order by avg(sal) desc

-- ���������� �ִ� ��� ����� ǥ���Ͻÿ�.
select member_id, name from member
where member_id in (select mgr from member)

-- ���ֺ� ���� �ʰ� �Ի��� ����� ǥ���Ͻÿ�.
select name, hire from member
where hire > (select hire from member where name='���ֺ�')