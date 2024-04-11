-- Q1. EMP 테이블을 이용하여 부서 번호, 평균 급여, 최고 급여, 최저 급여, 사원 수 출력
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서 번호별로 출력
SELECT  DEPTNO, FLOOR(AVG(SAL)) AS AVG_SAL, MAX(SAL) AS AVG_MAX, MIN(SAL) AS AVG_MIN, COUNT(EMPNO) AS CNT
FROM EMP
GROUP BY DEPTNO;

-- Q2. 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수 출력
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(JOB) >= 3;

-- Q3. 사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력
SELECT SUBSTR(HIREDATE, 1, 4) AS HIRE_YEAR, DEPTNO, COUNT(EMPNO) AS CNT
FROM EMP
GROUP BY SUBSTR(HIREDATE, 1, 4), DEPTNO;

-- Q4. 추가 수당을 받는 사원 수와 받지 않는 사원 수 출력
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');

-- Q5. 각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여 출력
-- 각 부서별 소계와 총계 출력
SELECT NVL(TO_CHAR(DEPTNO),' '), NVL(SUBSTR(HIREDATE, 1, 4),' '), COUNT(EMPNO), MAX(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY ROLLUP(DEPTNO, SUBSTR(HIREDATE, 1, 4));