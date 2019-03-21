--Exercise1_kr ���� 5, 6, 7
--Exercise2_kr ���� 1, 4, 5, 6 


--Exercise1_kr

--1.�޿��� 14000���� 30000���̿� ���Ե��� �ʴ� ��� ������ �̸��� �޿��� ǥ�� �Ͻʽÿ�.
   	SELECT name, sal
   	FROM member
   	WHERE sal NOT BETWEEN 14000 AND 30000;

--2.������ ���, �̸�, �޿��� �޿��� 20% �λ��� �޿��� ǥ�� �Ͻʽÿ�.
	SELECT member_id, name,sal, sal*1.20
	FROM member;

--3.�� ������ �ٹ� �޼��� ǥ�� �Ͻʽÿ�.
	SELECT name, datediff(month, hire, getdate())
	FROM member;

--4. �� ������ �ٹ� �޼��� ǥ�� �Ͻʽÿ�. ����� �Ҽ��� ��°�ڸ����� �ݿø� �մϴ�.
	SELECT name, round(datediff(month, hire, getdate()),2)
	FROM member;

--8. ������ �������� ����� ǥ�� �Ͻʽÿ�
--	����	���
--	����	A
--	����	B
--	����	C
--	�븮	D
--	���	E

	SELECT name, jikwi, 
	CASE jikwi
		WHEN '����' THEN 'A'
		WHEN '����' THEN 'B'
		WHEN '����' THEN 'C'
		WHEN '�븮' THEN 'D'
		WHEN '���' THEN 'E'
	END grade
	FROM member;

--9. �� �������� �̸��� ������ ��� �Ͻʽÿ�.(sal*12 + bonus)

SELECT name, sal*12 + isnull(bonus,0)
FROM member;

--10.2004�⿡ �Ի��� ������ ����� �̸��� ǥ���Ͻʽÿ�.
SELECT member_id, name
FROM member
WHERE year(hire) = '2004';

--11.�����ڰ� ���� ������ �̸��� ������ ǥ���Ͻʽÿ�.
SELECT name, jikwi
FROM member
WHERE mgr IS NULL;

--12. ���ʽ��� �޵� ������ �̸��� �޿�, ���ʽ��� �������� �������� �����Ͽ� ǥ���Ͻʽÿ�.
SELECT name, sal, bonus
FROM member
WHERE bonus IS NOT NULL
ORDER BY bonus DESC;


--Exercise2_kr

--2.������ ������ ����� ���� ǥ�� �Ͻʽÿ�.

SELECT jikwi, count(*)
FROM member
GROUP BY jikwi;

--3. ����߿� �������� ���� ǥ�� �Ͻʽÿ�.

SELECT count(distinct mgr)
FROM member;

--7.������ �μ����� �ٹ��ϴ� ��� ����� �̸�,����,�μ���ȣ,�μ��̸��� ǥ�� �Ͻʽÿ�.

SELECT m.name, m.jikwi, m.dept_id, d.dept_name
FROM member m  INNER JOIN dept d
ON  m.dept_id = d.dept_id
WHERE dept_name = '������';

--8. ����� �̸�, ����� �������� �̸�, ����� ǥ�� �Ͻʽÿ�.

SELECT w.member_id "���", w.name "�̸�", m.member_id "�����ڹ�ȣ", m.name "������ �̸�"
FROM member w INNER JOIN member m
ON w.mgr = m.member_id;

--9. �����ڰ� ���� ����� �����Ͽ� ǥ�� �Ͻʽÿ�.

SELECT w.member_id "���", w.name "�̸�", m.member_id "�����ڹ�ȣ", m.name "������ �̸�"
FROM member w RIGHT OUTER JOIN member m
ON w.mgr = m.member_id;

--10. ������ ���� ���� �Ի��� ��� ����� �̸�, �Ի���, ������ �̸�, ������ �Ի����� ǥ�� �Ͻʽÿ�.

SELECT w.member_id "���", w.name "�̸�", m.member_id "�����ڹ�ȣ", m.name "������ �̸�"
FROM member w INNER JOIN member m
ON w.mgr = m.member_id
WHERE w.hire < m.hire;

--11. ���ʽ��� �޴� ����� �̸�, �μ� ��ȣ, �μ� �̸��� ǥ�� �Ͻʽÿ�.
SELECT m.name, m.dept_id, d.dept_name
FROM member m INNER JOIN dept d
ON m.dept_id = d.dept_id
WHERE m.bonus IS NOT NULL;
