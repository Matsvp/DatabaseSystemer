-- INSERT
-- Ta vare på prishistorikken
CREATE TABLE garn_historikk LIKE garn;

INSERT INTO garn_historikk (
	SELECT *
    FROM garn
); 

-- UPDATE
-- Øk prisen med 20% for de garnene som er kjøpt av minst 2 kunder

UPDATE garn 
SET pris = pris * 1.2
WHERE (produsent, navn) IN
(SELECT garn_produsent, garn_navn
FROM ordre
GROUP BY garn_produsent, garn_navn
HAVING count(*) >= 2
);

SELECT *
FROM ordre
GROUP BY garn_produsent, garn_navn
HAVING count(*) >= 2;

-- Delete 
-- Slett kunder som ikke har kjøpt mer enn 10 nøster garn 
DELETE FROM kunde
WHERE id NOT IN (
SELECT kunde_id
FROM ordre
GROUP BY kunde_id
HAVING sum(antall) >= 10
);

SELECT kunde_id, sum(antall)
FROM ordre
GROUP BY kunde_id
HAVING sum(antall) >=10;  