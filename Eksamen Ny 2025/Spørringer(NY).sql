-- Spørringer 
-- SMøringer 
SELECT s.navn AS smoring, m.navn AS merkevare
FROM Smoring s
JOIN Merkevare m ON s.merkevare_id = m.merkevare_id;

-- Hvordan Alt henger sammen
SELECT lf.loypeforhold_id, sn.navn AS 'Snøtype',
       s.navn AS 'Smøring', f.navn AS 'Ferdighetsnivå', lfs.anbefaling_score
FROM Loypeforhold_smoring lfs
JOIN Loypeforhold lf ON lfs.loypeforhold_id = lf.loypeforhold_id
JOIN Snotype sn ON lf.snotype_id = sn.snotype_id
JOIN Smoring s ON lfs.smoring_id = s.smoring_id
JOIN Ferdighetsniva f ON lfs.ferdighetsniva_id = f.ferdighetsniva_id
ORDER BY lf.loypeforhold_id, s.smoring_id;

-- VIEWs (faste rapporter)
/* 1A: Full produktkatalog med merke, kategori og temperaturintervall */
CREATE OR REPLACE VIEW v_smoring_detalj AS
SELECT s.smoring_id,
       s.navn               AS smoring,
       m.navn               AS merkevare,
       k.navn               AS kategori,
       CONCAT(s.temperatur_min,' – ',s.temperatur_max,' °C') AS temp_intervall
FROM   Smoring s
JOIN   Merkevare       m ON m.merkevare_id       = s.merkevare_id
JOIN   Smoringkategori k ON k.smoringkategori_id = s.smoringkategori_id;

/* 1B: Antall brukere per ferdighetsnivå (admin/statistikk) */
CREATE OR REPLACE VIEW v_brukere_per_niva AS
SELECT f.navn                AS ferdighetsnivå,
       COUNT(b.bruker_id)    AS antall_brukere
FROM   Ferdighetsniva f
LEFT  JOIN Bruker b ON b.ferdighetsniva_id = f.ferdighetsniva_id
GROUP BY f.navn;

/*1C: Snøtyper sortert etter hvor ofte de forekommer i Loypeforhold */
CREATE OR REPLACE VIEW v_snotype_frekvens AS
SELECT s.navn                   AS snotype,
       COUNT(l.loypeforhold_id) AS antall_registreringer
FROM   Snotype s
LEFT  JOIN Loypeforhold l ON l.snotype_id = s.snotype_id
GROUP BY s.navn
ORDER BY antall_registreringer DESC;


-- 2 Prosedyrer for sluttbrukerspørringer
-- 2A Finn anbefalt smøring (snøtype + temperatur + nivå)
DELIMITER $$

CREATE PROCEDURE sp_anbefal_smoring
(
    IN  p_snotype_id       INT,
    IN  p_temperatur       NUMERIC(5,2),
    IN  p_ferdighetsniva   INT
)
BEGIN
    /* Finner beste smøringer sortert på anbefaling_score */
    SELECT s.smoring_id,
           s.navn                     AS smoring,
           m.navn                     AS merkevare,
           lfs.anbefaling_score       AS score,
           CONCAT(s.temperatur_min,'–',s.temperatur_max,'°C') AS intervall
    FROM   Loypeforhold lf
    JOIN   Loypeforhold_smoring lfs ON lfs.loypeforhold_id = lf.loypeforhold_id
    JOIN   Smoring s                ON s.smoring_id        = lfs.smoring_id
    JOIN   Merkevare m              ON m.merkevare_id      = s.merkevare_id
    WHERE  lf.snotype_id           = p_snotype_id
      AND  p_temperatur BETWEEN s.temperatur_min AND s.temperatur_max
      AND  lfs.ferdighetsniva_id   = p_ferdighetsniva
    ORDER BY lfs.anbefaling_score DESC, s.navn;
END$$

DELIMITER ;


-- 2B Hent alternativer til en gitt smøring (+ rangering)
DELIMITER $$

CREATE PROCEDURE sp_hent_alternativer
(
    IN p_smoring_id INT
)
BEGIN
    SELECT alt.alternativ_smoring_id      AS smoring_id,
           s.navn                         AS alternativ,
           m.navn                         AS merkevare,
           alt.prioritet
    FROM   Alternativsmoring alt
    JOIN   Smoring s   ON s.smoring_id   = alt.alternativ_smoring_id
    JOIN   Merkevare m ON m.merkevare_id = s.merkevare_id
    WHERE  alt.smoring_id = p_smoring_id
    ORDER BY alt.prioritet ASC;
END$$

DELIMITER ;
-- 3 Adminprosedyrer (CRUDeksempler)
DELIMITER $$

CREATE PROCEDURE sp_ny_smoring
(
    IN  p_navn              VARCHAR(100),
    IN  p_merkevare_id      INT,
    IN  p_kategori_id       INT,
    IN  p_temp_min          NUMERIC(5,2),
    IN  p_temp_max          NUMERIC(5,2),
    IN  p_beskrivelse       TEXT
)
BEGIN
    /* Enkel validering – kunne utvides */
    IF p_temp_min > p_temp_max THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'temperatur_min kan ikke være høyere enn temperatur_max';
    END IF;

    INSERT INTO Smoring (navn, merkevare_id, smoringkategori_id,
                         temperatur_min, temperatur_max, beskrivelse)
    VALUES (p_navn, p_merkevare_id, p_kategori_id,
            p_temp_min, p_temp_max, p_beskrivelse);
END$$

DELIMITER ;

CALL sp_ny_smoring
(
  'Swix VP65',  -- navn
  1,            -- Swix
  2,            -- tørrvoks
  -2.0,
   2.0,
  'Ny racing-voks rundt nullføret'
);

-- 4 Statistikk prosedyre
DELIMITER $$

CREATE PROCEDURE sp_toppsmoringer_globalt(IN p_antall INT)
BEGIN
    /* Finn smøringer sortert på gjennomsnittlig anbefaling_score */
    SELECT s.smoring_id,
           s.navn,
           m.navn                             AS merkevare,
           AVG(lfs.anbefaling_score)          AS gjennomsnitt_score
    FROM   Loypeforhold_smoring lfs
    JOIN   Smoring s ON s.smoring_id = lfs.smoring_id
    JOIN   Merkevare m ON m.merkevare_id = s.merkevare_id
    GROUP  BY s.smoring_id, s.navn, m.navn
    ORDER  BY gjennomsnitt_score DESC
    LIMIT  p_antall;
END$$

DELIMITER ;

-- Oppdatering av smøringer (hvis man eks legger inn feil)
DELIMITER $$

CREATE PROCEDURE sp_oppdater_smoring_temp
(
    IN p_smoring_id  INT,
    IN p_temp_min    NUMERIC(5,2),
    IN p_temp_max    NUMERIC(5,2)
)
BEGIN
    /* Valider før vi oppdaterer */
    IF p_temp_min > p_temp_max THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'temperatur_min kan ikke være høyere enn temperatur_max';
    END IF;

    UPDATE Smoring
    SET    temperatur_min = p_temp_min,
           temperatur_max = p_temp_max
    WHERE  smoring_id     = p_smoring_id;
END$$

DELIMITER ;

-- prosedyre for alternativ smoring
DELIMITER $$

CREATE PROCEDURE sp_soek_smoring_med_alternativer
(
    IN p_temp      NUMERIC(5,2),
    IN p_snotype   INT,
    IN p_kategori  INT
)
BEGIN
    /* ───────── 1) Hovedtreff ───────── */
    CREATE TEMPORARY TABLE tmp_main AS
    SELECT DISTINCT s.smoring_id,
           s.navn                       AS smoring,
           m.navn                       AS merkevare,
           sk.navn                      AS kategori,
           lfs.anbefaling_score         AS score
    FROM   Loypeforhold           lf
    JOIN   Loypeforhold_smoring   lfs ON lfs.loypeforhold_id = lf.loypeforhold_id
    JOIN   Smoring                s   ON s.smoring_id        = lfs.smoring_id
    JOIN   Merkevare              m   ON m.merkevare_id      = s.merkevare_id
    JOIN   Smoringkategori        sk  ON sk.smoringkategori_id = s.smoringkategori_id
    WHERE  lf.snotype_id       = p_snotype
      AND  p_temp BETWEEN s.temperatur_min AND s.temperatur_max
      AND  s.smoringkategori_id = p_kategori;

    /* ───────── 2) Alternativer som også matcher kriteriene ───────── */
    CREATE TEMPORARY TABLE tmp_alt AS
    SELECT DISTINCT alt.alternativ_smoring_id           AS smoring_id,
           s2.navn                                      AS smoring,
           m2.navn                                      AS merkevare,
           sk2.navn                                     AS kategori,
           alt.prioritet                                AS score   -- bruker 'prioritet' her
    FROM   Alternativsmoring alt
    JOIN   Smoring          s2  ON s2.smoring_id  = alt.alternativ_smoring_id
    JOIN   Merkevare        m2  ON m2.merkevare_id      = s2.merkevare_id
    JOIN   Smoringkategori  sk2 ON sk2.smoringkategori_id = s2.smoringkategori_id
    /* må også bestå temperatur & kategori */
    WHERE  alt.smoring_id IN (SELECT smoring_id FROM tmp_main)
      AND  p_temp BETWEEN s2.temperatur_min AND s2.temperatur_max
      AND  s2.smoringkategori_id = p_kategori
      /* må finnes minst ett loypeforhold med rett snotype */
      AND EXISTS (
            SELECT 1
            FROM   Loypeforhold lf2
            JOIN   Loypeforhold_smoring lfs2
                   ON lfs2.loypeforhold_id = lf2.loypeforhold_id
            WHERE  lf2.snotype_id   = p_snotype
              AND  lfs2.smoring_id  = s2.smoring_id
      );

    /* ───────── 3) Slå sammen & send tilbake ───────── */
    SELECT * FROM tmp_main
    UNION ALL
    SELECT * FROM tmp_alt;

    DROP TEMPORARY TABLE tmp_main;
    DROP TEMPORARY TABLE tmp_alt;
END$$
DELIMITER ;

-- Hvordan bruke alt sammen
/* Fast rapport – view  */
SELECT * FROM v_smoring_detalj;

/* Bruker søker: nysnø, –4 °C, viderekommen */
CALL sp_anbefal_smoring(1, -4.0, 2);

/* Se alternativer til VR40 (smoring_id = 1) */
CALL sp_hent_alternativer(1);

/* Admin legger inn ny smøring */
CALL sp_ny_smoring('Rode KR3', 3, 1, -4.0, 1.0, 'Klister for rundt null');

/* Hent topp 3 smøringer globalt basert på snittscore */
CALL sp_toppsmoringer_globalt(3);

CALL sp_oppdater_smoring_temp(6, -2.0, 4.0);
CALL sp_oppdater_smoring_temp(5, 0.0, 2.0);

/* Finn tørrvoks for nysnø ved –5 °C, inkl. alternativer */
CALL sp_soek_smoring_med_alternativer(-5.0, 1, 2);
SELECT * FROM smoring;
