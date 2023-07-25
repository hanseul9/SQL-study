-- MySQL
SELECT 
    B.BOOK_ID, 
    A.AUTHOR_NAME, 
    DATE_FORMAT(B.PUBLISHED_DATE, '%Y-%m-%d') AS PUBLISHED_DATE 
FROM 
    BOOK B JOIN AUTHOR A
    ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE 
    B.CATEGORY = '경제'
    ORDER BY PUBLISHED_DATE ASC;

-- Oracle 
SELECT 
    B.BOOK_ID, 
    A.AUTHOR_NAME, 
    TO_CHAR(B.PUBLISHED_DATE, 'YYYY-MM-DD') AS PUBLISHED_DATE 
FROM 
    BOOK B JOIN AUTHOR A
    ON B.AUTHOR_ID = A.AUTHOR_ID
WHERE 
    B.CATEGORY = '경제'
    ORDER BY PUBLISHED_DATE ASC;