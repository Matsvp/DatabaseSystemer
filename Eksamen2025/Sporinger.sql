SELECT s.SmoeringNavn, b.BrukerNavn
FROM LoypeSmoering ls
JOIN Smoering s ON ls.SmoeringID = s.SmoeringID
JOIN Bruker b   ON ls.BrukerID   = b.BrukerID
WHERE ls.LoypeID = 1;

-- Oversikt: Løype + Anbefalt smøring

SELECT 
  l.LoypeNavn AS 'Løype (navn)',
  l.LoypeDato AS 'Dato',
  CONCAT(l.LoypeTemperatur, ' °C') AS 'Temperatur i løypa',
  l.LoypeSnotype AS 'Snøtype i løypa',
  s.SmoeringNavn AS 'Anbefalt smøring',
  s.Merke AS 'Merke',
  s.Kategori AS 'Kategori (tørrvoks/klister/glider)',
  CONCAT(s.TempMin, ' til ', s.TempMax, ' °C') AS 'Smøringens temp-område'
FROM LoypeSmoering ls
JOIN Loype l ON ls.LoypeID = l.LoypeID
JOIN Smoering s ON ls.SmoeringID = s.SmoeringID
ORDER BY l.LoypeNavn, s.SmoeringNavn;
 
 -- Vis alternative smøringer (for hver anbefalt smøring)

SELECT 
  hoved.SmoeringNavn AS 'Anbefalt smøring',
  altSmoering.SmoeringNavn AS 'Alternativ smøring',
  altSmoering.Merke AS 'Alternativt merke',
  CONCAT(altSmoering.TempMin, ' til ', altSmoering.TempMax, ' °C') AS 'Temp-område'
FROM AlternativeSmoering a
JOIN Smoering hoved ON a.HovedSmoeringID = hoved.SmoeringID
JOIN Smoering altSmoering ON a.AlternativSmoeringID = altSmoering.SmoeringID
ORDER BY hoved.SmoeringNavn, altSmoering.SmoeringNavn;

-- Kombinere alt – Løype + Anbefalt + Alternativ
SELECT
  l.LoypeNavn AS 'Løype',
  CONCAT(l.LoypeTemperatur, ' °C') AS 'Løype-temp',
  s.SmoeringNavn AS 'Anbefalt smøring',
  s.Merke AS 'Merke (anbefalt)',
  alt.SmoeringNavn AS 'Alternativ smøring',
  alt.Merke AS 'Merke (alternativ)'
FROM LoypeSmoering ls
JOIN Loype l ON ls.LoypeID = l.LoypeID
JOIN Smoering s ON ls.SmoeringID = s.SmoeringID
LEFT JOIN AlternativeSmoering a ON a.HovedSmoeringID = s.SmoeringID
LEFT JOIN Smoering alt ON a.AlternativSmoeringID = alt.SmoeringID
ORDER BY l.LoypeNavn, s.SmoeringNavn, alt.SmoeringNavn;


CREATE OR REPLACE VIEW V_LoypeOgSmøring AS
SELECT 
  l.LoypeNavn                      AS 'Løype',
  l.LoypeDato                      AS 'Dato',
  CONCAT(l.LoypeTemperatur, ' °C') AS 'Temp i løypa',
  l.LoypeSnotype                   AS 'Snøtype i løypa',
  s.SmoeringNavn                   AS 'Anbefalt smøring',
  s.Merke                           AS 'Merke',
  s.Kategori                        AS 'Kategori',
  CONCAT(s.TempMin, ' til ', s.TempMax, ' °C') AS 'Smøringens temp-område'
FROM LoypeSmoering ls
JOIN Loype l ON ls.LoypeID = l.LoypeID
JOIN Smoering s ON ls.SmoeringID = s.SmoeringID
ORDER BY l.LoypeNavn, s.SmoeringNavn;

SELECT * FROM V_LoypeOgSmøring;

CREATE OR REPLACE VIEW V_AlternativeSmøringer AS
SELECT
  hoved.SmoeringNavn                AS 'Hovedsmøring',
  CONCAT(hoved.TempMin, ' til ', hoved.TempMax, ' °C') AS 'Hoved temp-område',
  alt.SmoeringNavn                  AS 'Alternativ smøring',
  alt.Merke                          AS 'Alternativ merke',
  CONCAT(alt.TempMin, ' til ', alt.TempMax, ' °C') AS 'Alternativ temp-område'
FROM AlternativeSmoering a
JOIN Smoering hoved ON a.HovedSmoeringID = hoved.SmoeringID
JOIN Smoering alt   ON a.AlternativSmoeringID = alt.SmoeringID
ORDER BY hoved.SmoeringNavn, alt.SmoeringNavn;

SELECT * FROM V_AlternativeSmøringer;

SELECT * FROM V_AlternativeSmøringer
WHERE Hovedsmøring = 'VR40 Blå Extra';

CREATE OR REPLACE VIEW V_SmoeringOversikt AS
SELECT
  s.SmoeringNavn               AS 'Smøringnavn',
  s.Merke                       AS 'Merke',
  s.Kategori                    AS 'Kategori',
  CONCAT(s.TempMin, '–', s.TempMax, ' °C') AS 'Temp-område',
  s.HovedSnotype               AS 'Hovedsnøtype',
  st.Snotype                    AS 'Ekstra snøtype',   -- Fra SmoeringSnøtype
  s.BeskrivelseSmoering        AS 'Beskrivelse'
FROM Smoering s
LEFT JOIN SmoeringSnotype st 
  ON s.SmoeringID = st.SmoeringID
ORDER BY s.SmoeringNavn;

CREATE OR REPLACE VIEW V_SmoeringOversikt AS
SELECT
  s.SmoeringNavn AS 'Smøringnavn',
  s.Merke,
  s.Kategori,
  s.TempMin,
  s.TempMax,
  s.HovedSnotype,
  st.Snotype      AS 'EkstraSnotype',
  s.BeskrivelseSmoering
FROM Smoering s
LEFT JOIN SmoeringSnotype st ON s.SmoeringID = st.SmoeringID
ORDER BY s.SmoeringNavn;

SELECT *
FROM V_SmoeringOversikt
WHERE
  -2 BETWEEN TempMin AND TempMax 
  AND (HovedSnotype = 'Finkornet' OR EkstraSnotype = 'Finkornet')
  AND Kategori = 'Tørrvoks';


SELECT * FROM V_SmoeringOversikt; 

SELECT * FROM Smoering
WHERE -4 BETWEEN TempMin AND TempMax;