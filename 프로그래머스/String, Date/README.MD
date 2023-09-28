📅
- Postgresql와 날짜함수 
Postgresql에서는 DATEDIFF가 없음)

1. EXTRACT()  
	- 특정 날짜를 추출. year/month/day와 같은 요소를 추출/검색하는 함수
```
EXTRACT(field FROM source)
```
(1)field : 날짜/시간 값에서 추출할 필드를 지정  
(2)source : timestamp, 혹은 interval타입의 값(date타입 전달시 timestamp로 캐스팅되어 전달됨) 
반환 타입은 double precision

2. DATE_PART() 
	- EXTRACT와 거의 유사한 기능 
```
DATE_PART(field, source)
```
  
+) EXTRACT구문은 내부적으로 DATE_PART함수의 호출로 끝난다.  
따라서 이식성 문제가 없다면 DATE_PART()를 직접 호출하는게 더 빠름  
   
