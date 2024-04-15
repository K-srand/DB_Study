-- Q1. ��ü ��� �� ALLEN�� ���� ��å�� ������� ��� ����, �μ� ���� ���
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E LEFT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'ALLEN');
             
-- Q2. ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��� ����, �μ� ����, �޿� ��� ���
-- ��, �޿��� ���� ������ ���, �޿��� ���� ��� ��� ��ȣ �������� ������������ ����
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E LEFT OUTER JOIN DEPT D
    ON (E.DEPTNO = D.DEPTNO) 
    LEFT OUTER JOIN SALGRADE S
    ON (E.SAL BETWEEN LOSAL AND HISAL)
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL DESC, EMPNO;

-- Q3. 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� ��� ����, �μ� ���� ���
-- 30�� �μ� ��� ��ȸ
SELECT *
FROM EMP
WHERE DEPTNO = 30;

-- 30�� �μ� ��� �ߺ��Ǵ� ��å ������ ��å ��ȸ
SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 30;

-- 30�� �μ� ��� �� �������� �ʴ� ��å�� ���� ��� ��ȸ 
SELECT *
FROM EMP
WHERE JOB NOT IN(SELECT DISTINCT JOB
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
-- �������� �־��� �������� ����
SELECT *
FROM EMP
WHERE DEPTNO = 10
AND JOB NOT IN(SELECT DISTINCT JOB
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
--�������� �־��� �÷� EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC ����
-- EMP �� DETP ���̺��� � ������ �ʿ� 
-- EMP.DEPTNO = DEPT.DEPTNO
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 10
AND JOB NOT IN(SELECT DISTINCT JOB
                 FROM EMP
                 WHERE DEPTNO = 30);

-- Q4. ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� ��� ����, �޿� ��� ���� ���
-- ��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� ��� ��ȣ�� �������� �������� ����)
-- ������ �Լ��� ����ϴ� ���
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E LEFT OUTER JOIN SALGRADE S
    ON (E.SAL BETWEEN LOSAL AND HISAL)
WHERE SAL > ALL (SELECT DISTINCT SAL
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

-- ������ �Լ��� ������� �ʴ� ���
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E LEFT OUTER JOIN SALGRADE S
    ON (E.SAL BETWEEN LOSAL AND HISAL)
WHERE SAL > (SELECT MAX(SAL)
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

