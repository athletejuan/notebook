select*from members
select*from membercars
select*from cartypes
select*from members where name = '¿ì·Ú¸Þ'
select*from membercars where jumin = '796666-6666666'
select*from members,membercars
where members.jumin = membercars.jumin
and members.name = '¿ì·Ú¸Þ'

select members.name, cartypes.carname from members,membercars,cartypes
where members.jumin = membercars.jumin
and membercars.carname = cartypes.carname
and members.name = '¿ì·Ú¸Þ'