-- P.125 연습 문제

-- Q1. 사원이름(ENAME)이 S로 끝나는 사원 데이터 출력
SELECT *
FROM EMP
WHERE ENAME LIKE '%S';

-- Q2. 30번 부서(DEPTNO)에서 근무하고 있는 사원 중에 직책(JOB)이 SALESMAN인 사원의 사원 번호, 이름, 직책, 급여, 부서 번호 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

-- Q3. 20번, 30번 부서에 근무하고 있는 사원 중 급여(SAL)가 2000 초과인 사원의 사원 번호, 이름, 급여, 부서 번호 출력
-- 조건1 : 집합 연산자를 사용하지 않는 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE (DEPTNO = 20 OR DEPTNO = 30)
AND SAL > 2000;

-- 조건2 : 집합 연산자를 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE NOT ((DEPTNO = 20 OR DEPTNO = 30) AND SAL > 2000);

Q4. NOT BETWEEN A AND B 연산자를 사용하지 않고, 급여 열 값이 2000 이상 3000 이하 범위 이외 값을 가진 데이터 출력
SELECT *
FROM EMP
WHERE SAL < 2000 OR SAL > 3000; 

SELECT *
FROM EMP
WHERE NOT SAL >= 2000 AND SAL <= 3000;

Q5. 사원 이름에 E가 포함되어 있는 30번 부서의 사원 중 급여가 1000~2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서 번호 출력
SELECT ENAME, EMPNO, SAL, DEPTNO
FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30
AND SAL NOT BETWEEN 1000 AND 2000;

Q6. 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK인 사원 중 사원 이름의 두 번째 글자가 L이 아닌 사원 정보 출력
SELECT *
FROM EMP
WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN ('MANAGER', 'CLERK')
AND ENAME NOT LIKE '_L%'; 
