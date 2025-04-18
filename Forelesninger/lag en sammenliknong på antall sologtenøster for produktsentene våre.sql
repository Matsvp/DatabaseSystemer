-- lag en sammenliknong på antall sologtenøster for produktsentene våre
-- Vis resultater på mesd mulig måte 

SELECT sum(antall), garn_produsent
FROM ordre
GROUP BY garn_produsent;


(SELECT sum(antall)
FROM ordre
WHERE garn_produsent = 'DROPS') AS solgt_drops,
(SELECT sum(antall)
FROM ordnre
WHERE garn_produsent = 'Sandnes Garn') AS solgt_sandnes);
