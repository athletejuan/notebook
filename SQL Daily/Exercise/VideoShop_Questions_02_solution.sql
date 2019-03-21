/*
1. '홍길동' 고객에게 테이프를 대여한 횟수(미반납 포함)을 알고 싶다. 적절한 SQL문을 작성하시오. 
2. 대여 인기 순위를 구하기 위해 각각의 테이프가 지금까지 몇번 대여 되었는지 보고 싶다. 테이프의 
번호와 대여 횟수를 조회하는 SQL문을 작성하시오.
3. 테이프 종류가 '액션물'인 모든 테이프에 대해서 테이프 번호와 테이프 제목을 테이프 제목의 
오름차순으로 조회하기 위한 SQL문을 작성하시오.
4. 테이프 종류가 '액션물'인 테이프의 최소 대여료와 최대 대여료 그리고 평균가격을 알고 싶다. 
모든 결과가 한 줄에 보이도록 적절한 SQL문을 작성하시오.
*/

--1.
select count(*) from VS_CUSTOMER c
join vs_rent r on c.cust_id = r.CUST_ID
where name = '홍길동'

--2.
select tape_no, count(*) noofrent from vs_rent
group by tape_no

--3.
select t.tape_no, t.name from vs_tape t
join vs_sort s on t.sort_code = s.code
where s.name = '액션물'
order by t.NAME asc

--4.
select min(price) 'Min', max(price) 'Max', avg(price) 'Avg' from vs_tape t
join vs_sort s on s.code = t.SORT_CODE
where s.name = '액션물'


select * from vs_sort
select * from vs_tape
select * from VS_RENT
select * from vs_customer


















--1. vs_customer,vs_rent,cust_id
select s.name, count(u.cust_id) as '대여 횟수' 
from vs_customer s 
inner join vs_rent u 
on s.cust_id = u.cust_id
where s.name ='홍길동'
group by s.name,u.cust_id

--2. vs_tap, vs_rent, tape_no
select tape_no, count(tape_no) as '대여 횟수'
from vs_rent
group by tape_no
order by '대여 횟수'desc

--3. vs_tape,vs_sort,tape_no,name
select s.TAPE_NO,s.NAME
from vs_tape s
inner join VS_SORT u
on s.SORT_CODE = u.CODE
where u.name ='액션물'
order by s.name

--4. vs_tape,vs_sort,price
select min (s.price) as '최소 대여로', max (s.price) as '최대 대여료', avg(s.price) as '평균 가격'
from vs_tape s
inner join vs_sort u
on s.SORT_CODE = u.CODE
where u.NAME ='액션물'