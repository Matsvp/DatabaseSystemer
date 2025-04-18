
SELECT 
  DAY(innleggelsesdato) AS dag_i_maaned,
  COUNT(*) AS antall_innleggelser
FROM innleggelser
GROUP BY dag_i_maaned
ORDER BY antall_innleggelser DESC;

SELECT *
FROM innleggelser
WHERE pasient_id = 442
ORDER BY innleggelsesdato DESC
LIMIT 1 OFFSET 1;

SELECT pasient_id, lege_id, diagnose
FROM innleggelser
WHERE 
  (
    MOD(pasient_id, 2) = 1
    AND lege_id IN (1, 5, 19)
  )
  OR (
    CAST(lege_id AS CHAR) LIKE '%2%'
    AND LENGTH(CAST(pasient_id AS CHAR)) = 3
  );
  
SELECT 
l.fornavn,
l.etternavn,
COUNT(i.id) AS antall_innleggelser
FROM leger AS l
JOIN innleggelser AS i ON l.lege_id = i.lege_id
GROUP BY l.lege_id, l.fornavn, l.etternavn
ORDER BY antall_innleggelser DESC;

SELECT 
  l.lege_id,
  CONCAT(l.fornavn, ' ', l.etternavn) AS fullt_navn,
  MIN(i.innleggelsesdato) AS forste_innleggelse,
  MAX(i.innleggelsesdato) AS siste_innleggelse
FROM leger AS l
JOIN innleggelser AS i ON l.lege_id = i.lege_id
GROUP BY l.lege_id, l.fornavn, l.etternavn
ORDER BY forste_innleggelse;

SELECT 
  CONCAT(p.fornavn, ' ', p.etternavn) AS pasientnavn,
  i.diagnose,
  CONCAT(l.fornavn, ' ', l.etternavn) AS legenavn
FROM innleggelser AS i
JOIN pasienter AS p ON i.pasient_id = p.pasient_id
JOIN leger AS l ON i.lege_id = l.lege_id;



SELECT 
  pr.provins_navn,
  COUNT(p.pasient_id) AS antall_pasienter
FROM pasienter AS p
JOIN provins AS pr ON p.provins_id = pr.provins_id
GROUP BY pr.provins_navn
ORDER BY antall_pasienter DESC;

SELECT 
  fornavn, 
  etternavn, 
  COUNT(*) AS antall
FROM pasienter
GROUP BY fornavn, etternavn
HAVING COUNT(*) > 1;


SELECT 
  CONCAT(fornavn, ' ', etternavn) AS fullt_navn,
  ROUND(hoyde / 30.48, 1) AS hoyde_i_fot,
  ROUND(vekt * 2.205) AS vekt_i_pund,
  fodselsdag,
  CASE
    WHEN kjonn = 'M' THEN 'Mann'
    WHEN kjonn = 'K' THEN 'Kvinne'
    ELSE 'Ukjent'
  END AS kjonn
FROM pasienter;

SELECT 
  p.pasient_id,
  p.fornavn,
  p.etternavn
FROM pasienter AS p
LEFT JOIN innleggelser AS i ON p.pasient_id = i.pasient_id
WHERE i.pasient_id IS NULL;