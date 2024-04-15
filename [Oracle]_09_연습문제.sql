-- Q1. 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원 정보, 부서 정보 출력
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E LEFT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
WHERE JOB = (SELECT JOB
             FROM EMP
             WHERE ENAME = 'ALLEN');
             
-- Q2. 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원 정보, 부서 정보, 급여 등급 출력
-- 단, 급여가 많은 순으로 출력, 급여가 같을 경우 사원 번호 기준으로 오름차순으로 정렬
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E LEFT OUTER JOIN DEPT D
    ON (E.DEPTNO = D.DEPTNO) 
    LEFT OUTER JOIN SALGRADE S
    ON (E.SAL BETWEEN LOSAL AND HISAL)
WHERE SAL > (SELECT AVG(SAL)
             FROM EMP)
ORDER BY SAL DESC, EMPNO;

-- Q3. 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원 정보, 부서 정보 출력
-- 30번 부서 사원 조회
SELECT *
FROM EMP
WHERE DEPTNO = 30;

-- 30번 부서 사원 중복되는 직책 제거후 직책 조회
SELECT DISTINCT JOB
FROM EMP
WHERE DEPTNO = 30;

-- 30번 부서 사원 중 존재하지 않는 직책을 가진 사원 조회 
SELECT *
FROM EMP
WHERE JOB NOT IN(SELECT DISTINCT JOB
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
-- 문제에서 주어진 조건으로 결합
SELECT *
FROM EMP
WHERE DEPTNO = 10
AND JOB NOT IN(SELECT DISTINCT JOB
                 FROM EMP
                 WHERE DEPTNO = 30);
                 
--문제에서 주어진 컬럼 EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC 정리
-- EMP 와 DETP 테이블의 등가 조인이 필요 
-- EMP.DEPTNO = DEPT.DEPTNO
SELECT E.EMPNO, E.ENAME, E.JOB, E.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.DEPTNO = 10
AND JOB NOT IN(SELECT DISTINCT JOB
                 FROM EMP
                 WHERE DEPTNO = 30);

-- Q4. 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보, 급여 등급 정보 출력
-- 단, 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 총해 사원 번호를 기준으로 오름차순 정렬)
-- 다중행 함수를 사용하는 방법
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E LEFT OUTER JOIN SALGRADE S
    ON (E.SAL BETWEEN LOSAL AND HISAL)
WHERE SAL > ALL (SELECT DISTINCT SAL
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

-- 다중행 함수를 사용하지 않는 방법
SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE
FROM EMP E LEFT OUTER JOIN SALGRADE S
    ON (E.SAL BETWEEN LOSAL AND HISAL)
WHERE SAL > (SELECT MAX(SAL)
                 FROM EMP
                 WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;

