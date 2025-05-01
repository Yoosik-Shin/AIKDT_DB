-- Active: 1745889699544@@127.0.0.1@3306@aloha
SELECT *
FROM employees;

-- IFNULL(값1, 값2)
-- 표현식1이 NULL이면 표현식2를 출력
-- 최종급여 = 급여 + (급여 X 커미션비율)
SELECT emp.*
      ,salary + (salary * IFNULL(commission_pct, 0)) AS '최종급여'
FROM employees emp
ORDER BY `최종급여` DESC;


-- NULLIF(A, B)
-- A와 B가 같으면 NULL 아니면 A를 출력
SELECT emp_no
      ,salary
      ,NULLIF(salary, 3300000)
FROM employees;


-- COALESCE()
-- 사원이 1년동안 받는 기본급 외의 수당을 출력하시오.
-- 단, 커미션과 보너스가 둘 다 있는 경우는 커미션만 출력하시오.
SELECT emp_no
      ,name
      ,COALESCE((salary*commission_pct)*12, bonus, 0) AS '수당'
      ,COALESCE((salary*commission_pct)*12 + IFNULL(bonus, 0), bonus, 0) AS '수당'
FROM employees;