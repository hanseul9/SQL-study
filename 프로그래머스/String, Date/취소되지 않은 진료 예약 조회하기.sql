--Postgresql

SELECT
    a.apnt_no,
    p.pt_name,
    a.pt_no,
    a.mcdp_cd,
    d.dr_name,
    a.apnt_ymd
FROM
    appointment a 
    INNER JOIN patient p ON a.pt_no = p.pt_no
    INNER JOIN doctor d ON a.mddr_id = d.dr_id
WHERE
    a.apnt_ymd::DATE = '2022-04-13'
    AND a.apnt_cncl_yn IS NULL
    AND a.mcdp_cd = 'cs'
ORDER BY
    a.apnt_ymd ASC;
