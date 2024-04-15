-- Q1. EMP_HW 테이블 생성
-- 조건 : EMPNO(정수형 숫자, 길이 4) -> NUMBER
-- ENAME(가변형 문자열, 길이 10) -> VARCHAR2
-- JOB(가변형 문자열, 길이 9) -> VARCHAR2
-- MGR(정수형 숫자, 4) -> NUMBER
-- HIREDATE(날짜) -> DATE
-- SAL(소수점 둘째자리까지 표현되는 숫자, 7) -> NUMBER
-- COMM(소수점 둘째자리까지 표현되는 숫자, 7) -> NUMBER
-- DEPTNO(정수형 숫자, 2) -> NUMBER

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

-- 확인
SELECT *
FROM EMP_HW;

-- Q2. EMP_HW 테이블에 BIGO 열 추가
-- 조건 : BIGO(가변형 문자열, 길이 20)
ALTER TABLE EMP_HW ADD BIGO VARCHAR2(20);

-- 확인
SELECT *
FROM EMP_HW;

-- Q3. EMP_HW 테이블의 BIGO 열 크기를 30으로 변경
ALTER TABLE EMP_HW MODIFY BIGO VARCHAR2(30);

-- Q4. EMP_HW 테이블의 BIGO 열 이름을 REMARK로 변경
ALTER TABLE EMP_HW RENAME COLUMN BIGO TO REMARK;

-- Q5. EMP_HW 테이블에 EMP 테이블의 데이터를 모두 저장
-- 단, REMARK 열은 NULL로 삽입


-- Q6. 지금까지 사용한 EMP_HW 테이블 삭제


