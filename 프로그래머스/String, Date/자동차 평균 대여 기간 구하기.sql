-- 대여기간은 빌린 날부터 시작이니 +1을 해줌 
-- MySQL
SELECT
    CAR_ID,
    ROUND(AVG(DATEDIFF(END_DATE,START_DATE)+1), 1) AS AVERAGE_DURATION
FROM 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
GROUP BY
    CAR_ID
HAVING 
    AVERAGE_DURATION >= 7
ORDER BY 
    AVERAGE_DURATION DESC, CAR_ID DESC;


/*
  - Postgresql은 기본적으로 소문자로 인식하니 대문자를 사용하고 싶다면 큰따옴표 사용 << 그냥 소문자쓰기 
   - MySQL과 달리 select절의 alias를 having절에서 사용 불가 
*/


-- PostgreSQL 1
SELECT 
    "CAR_ID",
    ROUND(AVG(( "END_DATE" - "START_DATE" ) + 1), 1) AS "AVERAGE_DURATION"
FROM
    public.car
GROUP BY
    "CAR_ID"
HAVING
    AVG(( "END_DATE" - "START_DATE" ) + 1) >= 7
ORDER BY
    "AVERAGE_DURATION" DESC, "CAR_ID" DESC;

--PostgreSQL 2
SELECT
    "CAR_ID",
    ROUND(AVG(EXTRACT('DAY' FROM ("END_DATE"::timestamp - "START_DATE"::timestamp)) + 1)::numeric, 1) AS "AVERAGE_DURATION"
FROM 
    public.car
GROUP BY
    "CAR_ID"
HAVING 
    AVG(EXTRACT('DAY' FROM ("END_DATE"::timestamp - "START_DATE"::timestamp)) + 1) >= 7
ORDER BY 
    "AVERAGE_DURATION" DESC, "CAR_ID" DESC;

--PostgreSQL 3
SELECT
    "CAR_ID",
    ROUND(AVG(DATE_PART('DAY', "END_DATE"::timestamp - "START_DATE"::timestamp) + 1)::numeric, 1) AS "AVERAGE_DURATION"
FROM 
    public.car
GROUP BY
    "CAR_ID"
HAVING 
    AVG(DATE_PART('DAY', "END_DATE"::timestamp - "START_DATE"::timestamp) + 1) >= 7
ORDER BY 
    "AVERAGE_DURATION" DESC, "CAR_ID" DESC;

