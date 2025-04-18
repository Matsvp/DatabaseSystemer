SELECT 
  FLOOR(vekt / 10) * 10 AS vektgruppe,
  COUNT(*) AS antall_pasienter
FROM pasienter
GROUP BY vektgruppe
ORDER BY vektgruppe DESC;


SELECT 
  pasient_id,
  vekt,
  hoyde,
  CASE 
    WHEN vekt / POWER(hoyde / 100, 2) >= 30 THEN 1
    ELSE 0
  END AS erOvervektig
FROM pasienter;


SELECT 
  p.pasient_id,
  p.fornavn,
  p.etternavn,
  l.spesialitet
FROM pasienter AS p
JOIN innleggelser AS i ON p.pasient_id = i.pasient_id
JOIN leger AS l ON i.lege_id = l.lege_id
WHERE 
  LOWER(i.diagnose) LIKE '%epilepsi%' 
  AND LOWER(l.fornavn) = 'lisa';
  
SELECT 
p.pasient_id,
CONCAT(
    p.pasient_id,
    CHAR_LENGTH(p.etternavn),
    YEAR(STR_TO_DATE(p.fodselsdag, '%Y-%m-%d'))
  ) AS midlertidig_passord
FROM pasienter AS p
WHERE p.pasient_id IN (
  SELECT DISTINCT pasient_id FROM innleggelser
);

SELECT 
  CASE 
    WHEN MOD(p.pasient_id, 2) = 0 THEN 'Ja'
    ELSE 'Nei'
  END AS har_forsikring,
  SUM(
    CASE 
      WHEN MOD(p.pasient_id, 2) = 0 THEN 100
      ELSE 500
    END
  ) AS total_kostnad
FROM pasienter AS p
JOIN innleggelser AS i ON p.pasient_id = i.pasient_id
GROUP BY har_forsikring
ORDER BY har_forsikring DESC;

SELECT pr.provins_navn
FROM pasienter AS p
JOIN provins AS pr ON p.provins_id = pr.provins_id
GROUP BY pr.provins_navn
HAVING SUM(CASE WHEN p.kjonn = 'M' THEN 1 ELSE 0 END) > 
       SUM(CASE WHEN p.kjonn = 'F' THEN 1 ELSE 0 END);


SELECT *
FROM pasienter
WHERE 
  SUBSTRING(fornavn, 3, 1) = 'r'
  AND kjonn = 'F'
  AND MONTH(STR_TO_DATE(fodselsdag, '%Y-%m-%d')) IN (2, 5, 12)
  AND vekt BETWEEN 60 AND 80
  AND MOD(pasient_id, 2) = 1
  AND sted = 'Hamilton';


SELECT 
  ROUND(
    100.0 * SUM(CASE WHEN kjonn = 'M' THEN 1 ELSE 0 END) / COUNT(*),
    2
  ) AS prosent_menn
FROM pasienter;

SELECT 
  innleggelsesdato,
  COUNT(*) AS antall_innleggelser,
  COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY innleggelsesdato) AS endring_fra_igår
FROM innleggelser
GROUP BY innleggelsesdato
ORDER BY innleggelsesdato;

SELECT provins_navn
FROM provins
ORDER BY 
  CASE 
    WHEN provins_navn = 'Ontario' THEN 0
    ELSE 1
  END,
  provins_navn DESC;

SELECT 
  l.lege_id,
  CONCAT(l.fornavn, ' ', l.etternavn) AS fullt_navn,
  l.spesialitet,
  YEAR(i.innleggelsesdato) AS aar,
  COUNT(*) AS totalt_innleggelser
FROM innleggelser AS i
JOIN leger AS l ON i.lege_id = l.lege_id
GROUP BY l.lege_id, fullt_navn, l.spesialitet, aar
ORDER BY aar, totalt_innleggelser DESC;

