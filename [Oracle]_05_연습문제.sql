-- P.125 ���� ����

-- Q1. ����̸�(ENAME)�� S�� ������ ��� ������ ���
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- Q2. 30�� �μ�(DEPTNO)���� �ٹ��ϰ� �ִ� ��� �߿� ��å(JOB)�� SALESMAN�� ����� ��� ��ȣ, �̸�, ��å, �޿�, �μ� ��ȣ ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- Q3. 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿�(SAL)�� 2000 �ʰ��� ����� ��� ��ȣ, �̸�, �޿�, �μ� ��ȣ ���
-- ����1 : ���� �����ڸ� ������� �ʴ� ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO = 20 OR DEPTNO = 30)
AND SAL > 2000;

-- ����2 : ���� �����ڸ� ����� ���
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE NOT ((DEPTNO = 20 OR DEPTNO = 30) AND SAL > 2000);

Q4. NOT BETWEEN A AND B �����ڸ� ������� �ʰ�, �޿� �� ���� 2000 �̻� 3000 ���� ���� �̿� ���� ���� ������ ���
SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000; 

SELECT *
FROM EMP
WHERE NOT SAL >= 2000 AND SAL <= 3000;

Q5. ��� �̸��� E�� ���ԵǾ� �ִ� 30�� �μ��� ��� �� �޿��� 1000~2000 ���̰� �ƴ� ��� �̸�, ��� ��ȣ, �޿�, �μ� ��ȣ ���
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000;

Q6. �߰� ������ �������� �ʰ� ����ڰ� �ְ� ��å�� MANAGER, CLERK�� ��� �� ��� �̸��� �� ��° ���ڰ� L�� �ƴ� ��� ���� ���
SELECT *
FROM EMP
WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%'; 
