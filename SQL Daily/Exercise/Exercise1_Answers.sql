select name, sal from member
where sal < 14000 or sal > 30000

select member_id, name, sal, sal*1.2 as '2019 salary' from member

select name, datediff(month, hire, getdate()) as pastmonth from member

select name, jikwi,
case jikwi
when '사장' then 'A'
when '부장' then 'B'
when '과장' then 'C'
when '대리' then 'D'
when '사원' then 'E'
end grade
from member

select name, sal*12+isnull(0, bonus) from member

select member_id, name from member
where year(hire) = 2004

select name, jikwi from member
where mgr is null

select name, sal, bonus from member
where bonus is not null
order by bonus desc
