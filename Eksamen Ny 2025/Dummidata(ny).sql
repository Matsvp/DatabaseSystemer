-- DummiData

-- Ferdighetsniva
INSERT INTO Ferdighetsniva (navn, beskrivelse)
VALUES
('Nybegynner', 'Helt fersk og usikker på teknikk'),
('Viderekommen', 'Har gått en del på ski'),
('Ekspert', 'Svært erfaren og teknisk dyktig');
SELECT * FROM ferdighetsniva;

-- Merkevare
INSERT INTO Merkevare (navn)
VALUES
('Swix'),
('Toko'),
('Rode');
SELECT * FROM merkevare;

-- Smoringkategori
INSERT INTO Smoringkategori (navn)
VALUES
('Klister'),
('Tørrvoks'),
('Glider');
SELECT * FROM smoringkategori;


-- Snotype
INSERT INTO Snotype (navn)
VALUES
('Nysnø'),
('Våt snø'),
('Isete snø'),
('Kunstsnø');
SELECT * FROM snotype;

-- Smoring **
-- Husk: merkevare_id og smoringkategori_id samsvarer med rekkefølgen over (1=Swix, 2=Toko, 3=Rode etc.)
INSERT INTO Smoring (navn, merkevare_id, smoringkategori_id, temperatur_min, temperatur_max, beskrivelse)
VALUES
-- (navn,       merkevare, kategori,    temp_min, temp_max, beskrivelse)
('VR40',        1,         2,          -12.00,     -4.00,     'Swix-tørrvoks for litt fuktig snø'),
('KX30',        1,         1,         -12.00,    0.00,     'Swix-klister for kalde forhold'),
('Yellow Glide',2,         3,          -6.00,     0.00,      'Toko-glider for milde temperaturer'),
('Rode T-Line VO festevoks', 3,         2,          -2.00,     0.00,      'Rode tørrvoks rundt nullføret');
SELECT * FROM smoring;

-- Loypeforhold
INSERT INTO Loypeforhold (snotype_id, temperatur, fuktighet, beskrivelse)
VALUES
(1, -3.50, 70.0, 'Litt fuktig nysnø, fortsatt kaldt'),
(2,  0.00, 90.0, 'Våt, klissete snø'),
(3, -8.00, 50.0, 'Isete, harde spor på morgenen'),
(4, -1.50, 80.0, 'Kunstsnø med litt fuktighet');
SELECT * FROM loypeforhold;

-- Bruker
INSERT INTO Bruker (navn, epost, passord_hash, ferdighetsniva_id)
VALUES
('Ola Nordmann',  '[email protected1]', '$2b$10$dummyHashForExample1', 1),
('Kari Ski',      '[email protected2]', '$2b$10$dummyHashForExample2', 2),
('Erik Ekspert',  '[email protected3]', '$2b$10$dummyHashForExample3', 3);
SELECT * FROM bruker;

-- loypeforhold_smoring
INSERT INTO Loypeforhold_smoring (loypeforhold_id, smoring_id, ferdighetsniva_id, anbefaling_score)
VALUES
-- (loypeforhold, smoring, ferdighetsniva, score)
(1, 1, 1, 80.0),   -- Nysnø, VR40, Nybegynner
(1, 1, 2, 75.0),   -- Nysnø, VR40, Viderekommen
(1, 4, 3, 65.0),   -- Nysnø, Rode T-Line, Ekspert
(2, 2, 1, 50.0),   -- Våt snø, KX30, Nybegynner
(2, 3, 2, 70.0),   -- Våt snø, Yellow Glide, Viderekommen
(3, 2, 3, 90.0),   -- Isete snø, KX30, Ekspert
(4, 4, 2, 88.0);   -- Kunstsnø, Rode T-Line, Viderekommen
SELECT * FROM loypeforhold_smoring;

-- Alternativsmoring
INSERT INTO Alternativsmoring (smoring_id, alternativ_smoring_id, prioritet)
VALUES
(1, 4, 1),  -- VR40 (1) -> Rode T-Line (4) som beste alternativ
(4, 1, 2),  -- Rode T-Line (4) -> VR40 (1) som nest beste
(2, 3, 1);  -- KX30 (2) -> Yellow Glide (3) 
SELECT * FROM alternativsmoring;









