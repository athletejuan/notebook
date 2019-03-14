select * from dept
select * from member

-- SQL Server(Local)
-- Azure SQL Database(Azure)

-- 평균 급여의 최고값을 포함하는 부서번호와 평균급여 표시하시오.

Select dept_id, avg(sal) from member group by dept_id 
having avg(sal) = (Select top 1 avg(sal) from member group by dept_id
order by avg(sal) desc)

Select top 1 avg(sal) from member group by dept_id
order by avg(sal) desc

-- 부하직원이 있는 모든 사원을 표시하시오.
select member_id, name from member
where member_id in (select mgr from member)

-- 김주부 보다 늦게 입사한 사람을 표시하시오.
select name, hire from member
where hire > (select hire from member where name='김주부')