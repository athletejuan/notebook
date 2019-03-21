select * from vs_sort
select * from vs_tape
select * from VS_RENT
select * from vs_customer


--1. 모든 테이프 번호와 테이프 이름을 테이프 번호순의 오름차순으로 출력하기 위한 
--SQL문을 작성하시오.

select tape_no, name from vs_tape
order by tape_no asc

--2. 특정테이프에 대해서 테이프 번호, 테이프 제목, 배급사를 보고 싶으나 
--그 테이프 제목이 ‘영웅’으로 시작된다는 것만 알고 있다. 적절한 SQL 문을 작성하시오. 

select tape_no, name, distributor from vs_tape
where convert (nvarchar(2), name) = '영웅'
--where name like '영웅%'

--3. 95년 12월 1일 이전에(12월 1일 제외) 배급된 모든 테이프의 번호와 제목을 조회하는 
--SQL문을 작성하시오. 

select tape_no, name from vs_tape
where dist_date < '1995-12-01'

--4. 회원 중에서 ‘효성1동’에 사는 회원들을 알고 싶다. 적절한 SQL문으로 작성하시오. 

select name from VS_CUSTOMER
where address like '%효성1동%' 

--5. 회원 중에서 남자들만 알고 싶다.적정한 SQL문으로 작성하시오.(남자는 1 인 경우)

select name from VS_CUSTOMER
where substring(ss_no, 8, 1) = 1

--6. 테이프의 배급사중에 ‘중앙프로덕션’, ‘영진프로덕션’ ,’삼호프로덕션’에 해당하는
-- 테이프들은? 적절한 SQL문으로 작성하시오

select name from vs_tape
where DISTRIBUTOR in ('중앙프로덕션','영진프로덕션','삼호프로덕션')

--7. 회원에서 나이가 제일 많은 상위 3명을 알고 싶은 경우.적절한 SQL문을 작성하시오.

select top 3 name from VS_CUSTOMER
order by ss_no asc

--8. 테이프 중에서 대여료가 1500원에서 2000원 사이의 비디오테이프는 어떤 것인가? 
--적절한 SQL문으로 작성하시오.

select name from vs_tape
where price between 1500 and 2000

--9. 테이프 중 ‘엘지프로덕션’에서 배급하지 않는 비디오테이프는 어느것인가? 
--적절한 SQL문으로 작성하시오.

select name from vs_tape
where DISTRIBUTOR not in ('엘지프로덕션')

select * from vs_sort
select * from vs_tape
select * from VS_RENT
select * from vs_customer

