-- LIMIT

USE aloha;

-- 맨 앞에서 부터 10개
SELECT *
FROM board
LIMIT 10;

/*
    LIMIT 키워드 위치
    SELECT *
    FROM 테이블
    WHERE
    GROUP BY - WHERE앞에 올 수 없다.
    ORDER BY - WHERE이나 GROUP BY 앞에 올 수 없다.
    LIMIT - 제일 마지막에 적어줘야함.
 */


-- 페이지당 10개의 게시글
-- 12 페이지를 출력하시오.
SELECT *
FROM board
LIMIT 110, 10;

SELECT *
FROM board
LIMIT 10 OFFSET 110;

-- 페이지당 20개씩
-- 36페이지를 출력하시오.
SELECT *
FROM board
-- LIMIT 20 OFFSET 700;
LIMIT 700, 20;