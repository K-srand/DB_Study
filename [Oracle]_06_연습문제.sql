-- Q1. empno ������ emp ���̺��� ��� �̸��� �ټ� ���� �̻��̸�, ���� ���� �̸��� ��� ���� ���
-- masking_empno ������ ��� ��ȣ �� �� �ڸ� �� ���ڸ��� * ��ȣ�� ���
-- masking_ename ������ ��� �̸��� ù ���ڸ� ���� �ְ� ������ ���� ����ŭ * ��ȣ�� ���
SELECT EMPNO,
       RPAD(SUBSTR(EMPNO,1,2), 4, '*') AS MASKING_EMPNO,
       ENAME,
       RPAD(SUBSTR(ENAME,1,1), LENGTH(ENAME),'*') AS MASKING_ENAME 
FROM EMP
WHERE LENGTH(ENAME) >= 5
AND LENGTH(ENAME) < 6;

-- �߰� ���(���� �� ����)
SELECT EMPNO, 
       REPLACE(EMPNO, SUBSTR(EMPNO, 3, 2), '**') AS MASKING_EMPNO, 
       ENAME, 
       REPLACE(ENAME, SUBSTR(ENAME, 2, 4), '****') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;

-- Q2. emp ���̺��� ������� �� ��� �ٹ��� ���� 21.5, �Ϸ� �ٹ� �ð��� 8�ð����� ������ ��
-- ������� �Ϸ� �޿��� �ñ��� ����Ͽ� ��� ���
-- �Ϸ� �޿��� �Ҽ��� �� ��° �ڸ����� ������, �ñ��� �� ��° �Ҽ������� �ݿø�
SELECT EMPNO, ENAME, SAL, 
       TRUNC((SAL / 21.5), 2) AS DAY_PAY, 
       ROUND((SAL / 21.5 / 8), 1) AS TIME_PAY
FROM EMP;

-- Q3. EMP ���̺��� ������� �Ի����� �������� 3������ ���� �� ù �����Ͽ� �������� �ȴ�.
-- ������� �������� �Ǵ� ��¥�� YYYY-MM-DD �������� ���
-- ��, �߰� ������ ���� ����� �߰� ������ N/A�� ���
SELECT EMPNO, ENAME, HIREDATE,
       TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3), '������'), 'YYYY-MM-DD') AS R_JOB,
       NVL(TO_CHAR(COMM),'N/A') AS COMM
FROM EMP;

-- �߰� ���
SELECT EMPNO, ENAME, HIREDATE, 
       REPLACE(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������'),'/','-') AS R_JOB,
       NVL(TO_CHAR(COMM), 'N/A') AS COMM
FROM EMP;

-- Q4. EMP ���̺��� ��� ����� ������� ���� ����� ��� ��ȣ�� ������ ���� ������ �������� ��ȯ�ؼ� ���
-- ���� ����� ��� ��ȣ�� �������� ���� ���
SELECT EMPNO, ENAME, MGR,
       CASE
         WHEN MGR IS NULL THEN '0000'
         WHEN TO_CHAR(MGR) LIKE '75%' THEN '5555'
         WHEN TO_CHAR(MGR) LIKE '76%' THEN '6666'
         WHEN TO_CHAR(MGR) LIKE '77%' THEN '7777'
         WHEN TO_CHAR(MGR) LIKE '78%' THEN '8888'
         ELSE TO_CHAR(MGR)
       END AS CHG_MGR
FROM EMP;

-- �߰� ���
SELECT EMPNO, ENAME, MGR,
       CASE
          WHEN MGR IS NULL THEN '0000'
          WHEN SUBSTR(MGR, 1, 2) = '75' THEN '5555'
          WHEN SUBSTR(MGR, 1, 2) = '76' THEN '6666'
          WHEN SUBSTR(MGR, 1, 2) = '77' THEN '7777'
          WHEN SUBSTR(MGR, 1, 2) = '78' THEN '8888'
          ELSE TO_CHAR(MGR)
       END AS CHG_MGR
  FROM EMP;
