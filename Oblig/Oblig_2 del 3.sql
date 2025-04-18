select * from innleggelser;

ALTER TABLE innleggelser 
CHANGE COLUMN `ï»¿pasient_id` pasient_id INT;

select * from leger;

ALTER TABLE leger 
CHANGE COLUMN `ï»¿lege_id` lege_id INT;

ALTER TABLE innleggelser
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

DESCRIBE pasienter;
DESCRIBE leger;

SELECT * 
FROM innleggelser 
JOIN pasienter ON innleggelser.pasient_id = pasienter.pasient_id 
JOIN leger ON innleggelser.lege_id = leger.lege_id 
LIMIT 0, 1000;

SELECT COUNT(*) AS antall_innleggelser
FROM innleggelser;

SELECT *
FROM innleggelser
WHERE innleggelsesdato = utskrivningsdato;

SELECT pasient_id,
       COUNT(*) AS antall_innleggelser
FROM innleggelser
WHERE pasient_id = 179
GROUP BY pasient_id;