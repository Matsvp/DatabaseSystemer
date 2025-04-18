CREATE TABLE Smoering (
    SmoeringID INT AUTO_INCREMENT PRIMARY KEY,
    SmoeringNavn VARCHAR(50) NOT NULL,
    Merke VARCHAR(50),                 -- f.eks. "Swix", "Rode", ...
    Kategori VARCHAR(20),              -- "Tørrvoks", "Klister", "Glider", ...
    TempMin INT,                       -- Nedre temperaturgrense (f.eks. -10)
    TempMax INT,                       -- Øvre temperaturgrense (f.eks. -3)
    BeskrivelseSmoering VARCHAR(255),  -- Tekstlig beskrivelse
    HovedSnotype VARCHAR(50)           -- Én hovedsnøtype (f.eks. "Nyfallen")
);


ALTER TABLE smoering
CHANGE HovedSnøtype HovedSnotype VARCHAR(50);

SELECT * FROM smoering;

