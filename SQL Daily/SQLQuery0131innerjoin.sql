select*from members
select*from membercars
select*from cartypes

select members.jumin, members.name, membercars.carname
from members
inner join membercars
on members.jumin = membercars.jumin
where members.name = '¿ì·Ú¸Þ'
and membercars.carname = 'sm5'