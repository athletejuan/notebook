/*
1. 대여 인기 순위를 구하기 위해 각각의 테이프가 지금까지 몇번 대여 되었는지 보고  싶다. 
테이프의 번호와 대여횟수를 조회하는 SQL 문을 작성하시오. 
2. 반납예정일이 지났으나 아직 반납되지 않은 비디오 테이프의 제목, 빌려간 고객의 이름, 전화번호, 주소를
 보고 싶다. 적절한 SQL 문을 작성하시오.    
3. 테이프 종류가 ‘액션물’인 테이프의 최소 대여료와 최대 대여료 그리고 평균가격을 알고 싶다. 
모든 결과가 한 줄에 보이도록 적절한 SQL문을 작성하시오.
4. 우수 고객을 선정하기 위해 현재까지 대여 횟수가 5번 이상인 고객의 ID와 고객 이름을 보고 싶다. 
적절한 SQL문을 작성하시오.  
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
where s.name = '액션물'

--4.
select c.cust_id, c.NAME from VS_CUSTOMER c
join vs_rent r on c.cust_id = r.cust_id
group by c.cust_id, c.name
having count(*) >= 5

select * from vs_sort
select * from vs_tape
select * from VS_RENT
select * from vs_customer