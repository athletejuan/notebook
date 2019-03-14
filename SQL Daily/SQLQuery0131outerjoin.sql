select*from dept
select*from member

select dept.dept_name, member.name from dept
inner join member
on dept.dept_id = member.dept_id
-- where dept.dept_name = 'ÃÑ¹«ºÎ'

select * from dept
select distinct dept_id from member
select*from member

select*from member
left outer join dept
on dept.dept_id = member.dept_id

select*from dept
left outer join member
on dept.dept_id = member.dept_id
where member.dept_id is NULL