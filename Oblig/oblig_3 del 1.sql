SELECT
  COUNT(CASE WHEN kjonn = 'M' THEN 1 END) AS mannlige,
  COUNT(CASE WHEN kjonn = 'F' THEN 1 END) AS kvinnelige
FROM pasienter;

SELECT 
  i.pasient_id,
  i.diagnose,
  i.innleggelsesdato
FROM innleggelser i
WHERE (i.pasient_id, i.diagnose) IN (
  SELECT pasient_id, diagnose
  FROM innleggelser
  GROUP BY pasient_id, diagnose
  HAVING COUNT(*) > 1
)
ORDER BY i.pasient_id, i.diagnose, i.innleggelsesdato;

SELECT 
  sted,
  COUNT(*) AS antall_pasienter
FROM pasienter
GROUP BY sted
ORDER BY antall_pasienter DESC, sted ASC;

SELECT fornavn, etternavn, 'Pasient' AS rolle
FROM pasienter

UNION

SELECT fornavn, etternavn, 'Lege' AS rolle
FROM leger;

SELECT * FROM pasienter;

SELECT allergier, COUNT(*) AS antall_pasienter
FROM pasienter
WHERE LOWER(allergier) != 'nka'
  AND allergier IS NOT NULL
GROUP BY allergier
ORDER BY antall_pasienter DESC;

SELECT fornavn, etternavn, fodselsdag
FROM pasienter
WHERE fodselsdag BETWEEN '1970-01-01' AND '1979-12-31'
ORDER BY fodselsdag ASC;

SELECT 
  CONCAT(LOWER(fornavn), ', ', UPPER(etternavn)) AS fullt_navn
FROM pasienter
ORDER BY LOWER(fornavn) ASC;

SELECT 
  provins_id, 
  SUM(hoyde) AS total_hoyde_cm
FROM pasienter
GROUP BY provins_id
HAVING SUM(hoyde) >= 7000;

SELECT 
  MAX(vekt) - MIN(vekt) AS vektforskjell
FROM pasienter
WHERE etternavn = 'Maroni';


