--Postgresql
--5월1일을 기준으로 출고여부 출력하기 

SELECT 
	order_id, product_id, out_date,
	CASE
		WHEN out_date IS NULL THEN '출고미정'
		WHEN (DATE_PART('DAY', '2022-05-01' - out_date::timestamp)) >= 0 THEN '출고완료'
		ELSE '출고대기'
	END
FROM 
	public.food_order
ORDER BY
	order_id ASC;
	
