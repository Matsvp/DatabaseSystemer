select * from pasienter;

ALTER TABLE pasienter
ADD COLUMN fodselsaar INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE pasienter
SET fodselsaar = YEAR(STR_TO_DATE(fodselsdag, '%Y-%m-%d'))
WHERE fodselsdag IS NOT NULL;

SET SQL_SAFE_UPDATES = 1;

SELECT DISTINCT fodselsaar
FROM pasienter
WHERE fodselsaar IS NOT NULL
ORDER BY fodselsaar;


SELECT fornavn
FROM pasienter
GROUP BY fornavn
HAVING COUNT(*) = 1;

SELECT *
FROM pasienter
WHERE 
  LOWER(fornavn) LIKE 's%s' AND
  CHAR_LENGTH(fornavn) >= 6;

SELECT * from innleggelser;

SELECT 
  p.pasient_id,
  p.fornavn,
  p.etternavn,
  i.diagnose
FROM pasienter AS p
JOIN innleggelser AS i ON p.pasient_id = i.pasient_id
WHERE LOWER(i.diagnose) LIKE '%dementia%';


SELECT fornavn
FROM pasienter
ORDER BY CHAR_LENGTH(fornavn), fornavn;

SELECT 
  fornavn, 
  etternavn, 
  allergier
FROM pasienter
WHERE 
  LOWER(allergier) LIKE '%penicillin%' 
  OR LOWER(allergier) LIKE '%morphine%'
ORDER BY allergier, fornavn, etternavn;