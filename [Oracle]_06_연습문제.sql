-- Q1. empno 열에는 emp 테이블에서 사원 이름이 다섯 글자 이상이며, 여섯 글자 미만인 사원 정보 출력
-- masking_empno 열에는 사원 번호 앞 두 자리 외 뒷자리를 * 기호로 출력
-- masking_ename 열에는 사원 이름의 첫 글자만 보여 주고 나머지 글자 수만큼 * 기호로 출력
SELECT EMPNO, 
       REPLACE(EMPNO, SUBSTR(EMPNO, 3, 2), '**') AS MASKING_EMPNO, 
       ENAME, 
       REPLACE(ENAME, SUBSTR(ENAME, 2, 4), '****') AS MASKING_ENAME
FROM EMP
WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;

-- Q2. emp 테이블에서 사원들의 월 평균 근무일 수는 21.5, 하루 근무 시간을 8시간으로 보았을 때
-- 사원들의 하루 급여와 시급을 계산하여 결과 출력
-- 하루 급여는 소수점 세 번째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림
SELECT EMPNO, ENAME, SAL, 
       TRUNC((SAL / 21.5), 2) AS DAY_PAY, 
       ROUND((SAL / 21.5 / 8), 1) AS TIME_PAY
FROM EMP;

-- Q3. EMP 테이블에서 사원들은 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원들이 정직원이 되는 날짜를 YYYY-MM-DD 형식으로 출력
-- 단, 추가 수당이 없는 사원의 추가 수당은 N/A로 출력
SELECT EMPNO, ENAME, HIREDATE, 
       ADD_MONTHS(TO_DATE(HIREDATE), 3) AS R_JOB,
       NVL2(TO_CHAR(COMM), TO_CHAR(COMM), 'N/A')
FROM EMP;

-- Q4. EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호를 다음과 같은 조건을 기준으로 변환해서 출력
-- 직속 상관의 사원 번호가 존재하지 않을 경우

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
