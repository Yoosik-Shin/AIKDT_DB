-- Active: 1745889699544@@127.0.0.1@3306@employees
-- employees 스키마

/*
    연산자
     - 산술연산자 : +, -, *, /, %
     - 비교연산자 : ==, !=, <>, >, <, >=, <=
     - 논리연산자 :
          * BETWEEN A AND B
          * NOT
          * IN
          * LIKE
          * IS NULL
          * AND
          * OR
          * UNION, UNION ALL
 */


-- 연봉에 1000달러를 더해서 출력하기
SELECT emp_no, salary, salary + 1000 AS '인상된 연봉'
FROM salaries;

-- 연봉 2배 출력하기
SELECT emp_no, salary, salary * 2 AS '인상된 연봉'
FROM salaries;

-- 월급을 조회하시오.
SELECT emp_no, salary, salary / 12 AS '월급'
FROM salaries;

--
SELECT emp_no, salary, salary % 10000 AS '기부금'
FROM salaries;

--1990년 이후 입사한 사원 조회
SELECT *
FROM employees
WHERE hire_date > 1990-01-01;

-- 이름이 Marko인 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name = 'Marko';

-- 이름이 Marko가 아닌 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name != 'Marko';

-- 이름이 Marko가 아닌 사원을 조회하시오
SELECT *
FROM employees
WHERE first_name <> 'Marko';

-- 연봉 테이블의 연봉이 50000달러 이하인 사원번호와 연봉 조회
SELECT emp_no, salary
FROM salaries
WHERE salary <= 50000;

--1995년 이후 입사하고 생년월일이 1960년 미만인 사원을 조회하시오.
SELECT *
FROM employees
WHERE hire_date >= '1995-01-01'
  AND birth_date < '1960-01-01';

-- 성별이 남자인 시원들과 이름이 'Dante' 인 사원을 모두 조회하시오.
SELECT *
FROM employees
WHERE gender = 'M'
   OR first_name = 'Dante';

-- 부서이력 테이블에서 부서번호가 'd001', 'd002', 'd003' 중 하나인 사원을 조회하시오.
SELECT *
FROM dept_emp
WHERE dept_no = 'd001'
   OR dept_no = 'd002'
   OR dept_no = 'd003';
SELECT *
FROM dept_emp
WHERE dept_no IN ('d001', 'd002', 'd003');

-- 부서번호가 'd005', 'd006'이 아닌 데이터를 모두 조회하시오.
SELECT *
FROM dept_emp
WHERE dept_no NOT IN ('d005', 'd006');

-- 부서이력 테이블에서 부서번호가 NULL이 아닌 사원을 조회하시오.
SELECT *
FROM dept_emp
WHERE dept_no IS NOT NULL;

-- 급여가 80000 달러 이상이거나
-- 입사일이 1988년 이전인 사원번호를 조회하시오.
-- UNION : 두 쿼리(조회문)를 합집합으로 조회한다.(중복을 제외시킨다.)
SELECT emp_no, salary
FROM salaries
WHERE salary > 80000
UNION
SELECT emp_no, hire_date
FROM employees
WHERE hire_date < '1988-01-01';

-- UNION ALL : 두 쿼리(조회문)를 합집합으로 조회한다.(중복을 포함시킨다.)
SELECT emp_no, salary
FROM salaries
WHERE salary > 80000
UNION ALL
SELECT emp_no, hire_date
FROM employees
WHERE hire_date < '1988-01-01';

-- 연봉이 50000달러 이상 60000달러 이하인 사원번호를 조회하시오.
SELECT *
FROM salaries
WHERE salary >= 50000 AND salary <= 60000;

SELECT *
FROM salaries
WHERE salary BETWEEN 50000 AND 60000;

-- LIKE
-- _ : 한 글자 대체
-- % : 공백 또는 한 글자 이상 대체
-- 성이 B로 시작하고 이름이 5글자인 사원을 조회하시오.
SELECT *
FROM employees
WHERE last_name LIKE 'B____';

-- 이름이 M으로 시작하는 사원을 조회하시오.
SELECT *
FROM employees
WHERE first_name LIKE 'M%';

-- 이름이 s로 끝나는 사원을 조회하시오.
SELECT *
FROM employees
WHERE first_name LIKE '%s';

-- 이름에 i가 들어가는 사원을 조회하시오.
SELECT *
FROM employees
WHERE first_name LIKE '%i%';

-- 이름이 s로 끝나지 않는 사원을 조회하시오.
SELECT *
FROM employees
WHERE first_name NOT LIKE '%s';