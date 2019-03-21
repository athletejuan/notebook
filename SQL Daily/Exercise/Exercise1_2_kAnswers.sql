--Exercise1_kr 제외 5, 6, 7
--Exercise2_kr 제외 1, 4, 5, 6 


--Exercise1_kr

--1.급여가 14000에서 30000사이에 포함되지 않는 모든 직원의 이름과 급여를 표시 하십시오.
   	SELECT name, sal
   	FROM member
   	WHERE sal NOT BETWEEN 14000 AND 30000;

--2.직원의 사번, 이름, 급여및 급여를 20% 인상한 급여로 표시 하십시오.
	SELECT member_id, name,sal, sal*1.20
	FROM member;

--3.각 직원의 근무 달수를 표시 하십시오.
	SELECT name, datediff(month, hire, getdate())
	FROM member;

--4. 각 직원의 근무 달수를 표시 하십시오. 결과는 소숫점 두째자리에서 반올림 합니다.
	SELECT name, round(datediff(month, hire, getdate()),2)
	FROM member;

--8. 직원의 직위별로 등급을 표시 하십시오
--	직위	등급
--	사장	A
--	부장	B
--	과장	C
--	대리	D
--	사원	E

	SELECT name, jikwi, 
	CASE jikwi
		WHEN '사장' THEN 'A'
		WHEN '부장' THEN 'B'
		WHEN '과장' THEN 'C'
		WHEN '대리' THEN 'D'
		WHEN '사원' THEN 'E'
	END grade
	FROM member;

--9. 각 직원들의 이름과 연봉을 계산 하십시오.(sal*12 + bonus)

SELECT name, sal*12 + isnull(bonus,0)
FROM member;

--10.2004년에 입사한 직원의 사번과 이름을 표시하십시오.
SELECT member_id, name
FROM member
WHERE year(hire) = '2004';

--11.관리자가 없는 직원의 이름과 직위를 표시하십시오.
SELECT name, jikwi
FROM member
WHERE mgr IS NULL;

--12. 보너스를 받든 직원의 이름과 급여, 보너스를 기준으로 내림차순 정렬하여 표시하십시오.
SELECT name, sal, bonus
FROM member
WHERE bonus IS NOT NULL
ORDER BY bonus DESC;


--Exercise2_kr

--2.직위가 동일한 사원의 수를 표시 하십시오.

SELECT jikwi, count(*)
FROM member
GROUP BY jikwi;

--3. 사원중에 관리자의 수를 표시 하십시오.

SELECT count(distinct mgr)
FROM member;

--7.영업부 부서에서 근무하는 모든 사원의 이름,직위,부서번호,부서이름을 표시 하십시오.

SELECT m.name, m.jikwi, m.dept_id, d.dept_name
FROM member m  INNER JOIN dept d
ON  m.dept_id = d.dept_id
WHERE dept_name = '영업부';

--8. 사원의 이름, 사번과 관리자의 이름, 사번을 표시 하십시오.

SELECT w.member_id "사번", w.name "이름", m.member_id "관리자번호", m.name "관리자 이름"
FROM member w INNER JOIN member m
ON w.mgr = m.member_id;

--9. 관리자가 없는 사원도 포함하여 표시 하십시오.

SELECT w.member_id "사번", w.name "이름", m.member_id "관리자번호", m.name "관리자 이름"
FROM member w RIGHT OUTER JOIN member m
ON w.mgr = m.member_id;

--10. 관리자 보다 먼저 입사한 모든 사원의 이름, 입사일, 관리자 이름, 관리자 입사일을 표시 하십시오.

SELECT w.member_id "사번", w.name "이름", m.member_id "관리자번호", m.name "관리자 이름"
FROM member w INNER JOIN member m
ON w.mgr = m.member_id
WHERE w.hire < m.hire;

--11. 보너스를 받는 사원의 이름, 부서 번호, 부서 이름을 표시 하십시오.
SELECT m.name, m.dept_id, d.dept_name
FROM member m INNER JOIN dept d
ON m.dept_id = d.dept_id
WHERE m.bonus IS NOT NULL;
