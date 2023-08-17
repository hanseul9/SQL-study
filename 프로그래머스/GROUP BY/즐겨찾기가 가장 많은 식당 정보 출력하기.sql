-- MYSQL, ORACLE
SELECT B.FOOD_TYPE, B.REST_ID, B.REST_NAME, B.FAVORITES
FROM (SELECT FOOD_TYPE, MAX(FAVORITES) FAVORITES
      FROM REST_INFO
      GROUP BY FOOD_TYPE) A, REST_INFO B
WHERE A.FOOD_TYPE = B.FOOD_TYPE
AND A.FAVORITES = B.FAVORITES
ORDER BY FOOD_TYPE DESC;