-- Active: 1745889699544@@127.0.0.1@3306@employees
-- INDEX 생성 전 성능 확인
SET PROFILING = 1;


-- 직원중 성(last name)이 가장 많은 성(last name)을 조회하기
SELECT last_name
      ,COUNT(*) count
FROM employees
GROUP BY last_name
ORDER BY count DESC
/* LIMIT 1;  이거 붙이면 조회한것 중에 가장 많은 하나 조회 */


-- 쿼리
SELECT * FROM employees
WHERE last_name = 'Baba'
  AND gender = 'M';

-- 프로파일 확인
SHOW PROFILE FOR QUERY 1;


SELECT *
FROM performance_schema.events_statements_history;



SELECT NOW(6);

-- 쿼리
SELECT * FROM employees
WHERE last_name = 'Baba'
  AND gender = 'M';

SELECT NOW(6);
/*
    인덱스 전 걸린시간
    2025-05-02 10:57:01.771939
    2025-05-02 10:57:01.926145
*/

/*
    인덱스 후 걸린시간
    2025-05-02 11:02:33.987487
    2025-05-02 11:02:34.047662
 */

-- 인덱스 생성
CREATE INDEX index_lastname_gender ON employees(last_name, gender);

DROP INDEX index_lastname_gender ON employees;

EXPLAIN
SELECT * FROM employees WHERE last_name = 'Smith' AND gender = 'M';
-- 인덱스 생성 후 explain
-- 1	SIMPLE	employees		ref	index_lastname_gender	index_lastname_gender	67	const,const	1	100.00	Using index condition


-- 인덱스 삭제
DROP INDEX index_lastname_gender ON employees;