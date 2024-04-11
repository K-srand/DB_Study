-- Q1. EMP ���̺��� �̿��Ͽ� �μ� ��ȣ, ��� �޿�, �ְ� �޿�, ���� �޿�, ��� �� ���
-- ��, ��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ� ��ȣ���� ���
SELECT  DEPTNO, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS AVG_MAX, MIN(SAL) AS AVG_MIN, COUNT(EMPNO) AS CNT
FROM EMP
GROUP BY DEPTNO;

-- Q2. ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >= 3;

-- Q3. ������� �Ի� ������ �������� �μ����� �� ���� �Ի��ߴ��� ���
SELECT SUBSTR(HIREDATE, 1, 4) AS HIRE_YEAR, DEPTNO, COUNT(EMPNO) AS CNT
FROM EMP
GROUP BY SUBSTR(HIREDATE, 1, 4), DEPTNO;

-- Q4. �߰� ������ �޴� ��� ���� ���� �ʴ� ��� �� ���
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

-- Q5. �� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿� ���
-- �� �μ��� �Ұ�� �Ѱ� ���
SELECT NVL(TO_CHAR(DEPTNO),' '), NVL(SUBSTR(HIREDATE, 1, 4),' '), COUNT(EMPNO), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, SUBSTR(HIREDATE, 1, 4));