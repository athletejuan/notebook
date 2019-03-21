-- Exercise1_kr 제외 5, 6, 7

-- 5.각 직원의 이름 급여를 표시 하는 질의문을 작성 하십시오. 
-- 급여는 10자리 길이에 왼쪽에는 #표시가 채워지는 형식으로 표기 하십시오.
SELECT right (concat(replicate('#', 10),  sal), 10) FROM member

SELECT (replicate('#', 10)) FROM member
SELECT concat(replicate('#', 10),  sal) FROM member
SELECT right (concat(replicate('#', 10),  sal), 10) FROM member

-- 6. 각 직원의 사번, 이름, 입사일과 입사한 후에 10달이 경과된 날짜를  표시 하시오.
-- (단 경과된 날짜의 결과는 'YYYY-MM-DD' 형식으로 표시 하십시오)
SELECT member_id, name, hire, dateadd(month, 10, hire) FROM member

-- 7.member 테이블에서 직원의 이름, 직위, 입사일 과 입사한 요일을 표시하데 
-- 월요일이 처음으로 하는 순서로 입사요일을 정렬 하십시오.
SELECT name, hire, datepart(day, hire) hiredate, datename(dw, hire) hireday FROM member
ORDER BY datename(dw, hire)


-- Exercise2_kr 제외 1, 4, 5, 6 

-- 1.모든 사원의 급여 총액, 급여 평균, 최고 급여, 최소 급여를 표시 하십시오.
SELECT sum(sal), avg(sal), max(sal), min(sal) FROM member

-- 4. 총 사원 수를 구하고 2000,2001,2002,2003년에 입사한 사원수를 표시하십시오.
SELECT COUNT(*) FROM member
SELECT COUNT(*) FROM member WHERE YEAR(hire) = '2000'
SELECT COUNT(*) FROM member WHERE YEAR(hire) = '2001'
SELECT COUNT(*) FROM member WHERE YEAR(hire) = '2002'
SELECT COUNT(*) FROM member WHERE YEAR(hire) = '2003'
SELECT COUNT(*) FROM member WHERE YEAR(hire) = '2004'

-- 5. 보너스에 평균값을 구하십시오. (보너스가 없는 경우는 0으로 적용하세요)
SELECT avg(isnull(bonus,0)) FROM member
