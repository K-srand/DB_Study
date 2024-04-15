-- Q1. EMP_HW ���̺� ����
-- ���� : EMPNO(������ ����, ���� 4) -> NUMBER
-- ENAME(������ ���ڿ�, ���� 10) -> VARCHAR2
-- JOB(������ ���ڿ�, ���� 9) -> VARCHAR2
-- MGR(������ ����, 4) -> NUMBER
-- HIREDATE(��¥) -> DATE
-- SAL(�Ҽ��� ��°�ڸ����� ǥ���Ǵ� ����, 7) -> NUMBER
-- COMM(�Ҽ��� ��°�ڸ����� ǥ���Ǵ� ����, 7) -> NUMBER
-- DEPTNO(������ ����, 2) -> NUMBER

CREATE TABLE EMP_HW(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7,2),
    COMM NUMBER(7,2),
    DEPTNO NUMBER(2)
);

-- Ȯ��
SELECT *
FROM EMP_HW;

-- Q2. EMP_HW ���̺� BIGO �� �߰�
-- ���� : BIGO(������ ���ڿ�, ���� 20)
ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);

-- Ȯ��
SELECT *
FROM EMP_HW;

-- Q3. EMP_HW ���̺��� BIGO �� ũ�⸦ 30���� ����
ALTER TABLE EMP_HW MODIFY BIGO VARCHAR2(30);

-- Q4. EMP_HW ���̺��� BIGO �� �̸��� REMARK�� ����
ALTER TABLE EMP_HW RENAME COLUMN BIGO TO REMARK;

-- Q5. EMP_HW ���̺� EMP ���̺��� �����͸� ��� ����
-- ��, REMARK ���� NULL�� ����


-- Q6. ���ݱ��� ����� EMP_HW ���̺� ����


