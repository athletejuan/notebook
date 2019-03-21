use NewCompany
go

select * from member

--1. 황기훈과 같은 부서에 속한 사원의 이름, 입사일, 급여를 표시하시오.
select dept_id from member
where name = '황기훈'
select name, hire, sal from member
where dept_id = (select dept_id from member where name = '황기훈')

--2. 급여가 평균급여보다 많은 사원 사번, 이름 표시하시오.
select member_id, name from member
where sal > (select avg(sal) from member)

--3. 평균급여가 가장 높은 부서번호와 평균급여를 표시하시오.
select dept_id, avg(sal) from member group by dept_id having max(avg(sal))
select max(avg(sal)) from member group by dept_id
