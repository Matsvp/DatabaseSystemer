INSERT INTO Bruker (BrukerNavn, BrukerNivaa, Kommentar)
VALUES
  ("Ola Normann", "Erfaren", "Har smurt ski i 10 år"),
  ("Kari Ski", "Nybegynner", "Vil ha enkelt oppsett"),
  ("Petter Smøresen", "Konkurranseløper", "Tester mye nytt utstyr"),
  ("Lise Spor", "Erfaren", "God på klisterføret");

SELECT * FROM Bruker;

INSERT INTO Smoering (
    SmoeringNavn, Merke, Kategori, TempMin, TempMax, 
    BeskrivelseSmoering, HovedSnotype
)
VALUES
  ("VR40 Blå Extra", "Swix", "Tørrvoks", -10, -3, 
   "For kalde, tørre forhold", "Nyfallen"),

  ("KX65 Red Klister", "Swix", "Klister", 1, 5, 
   "For nullføre, litt vått spor", "Våt"),

  ("Rode Violett", "Rode", "Tørrvoks", 0, -3, 
   "Passe for mellomforhold", "Finkornet"),

  ("Rode Multigrade", "Rode", "Tørrvoks", -5, -3, 
   "Veldig allsidig i minusgrader", "Nyfallen"),

  ("Swix KX30 Ice Klister", "Swix", "Klister", -12, 0, 
   "Klister for isete/frosne spor", "Is/snø omdannet"),

  ("Start Green", "Start", "Tørrvoks", -15, -7, 
   "Grønn voks for meget kalde forhold", "Tørr og finkornet");
   
CREATE TEMPORARY TABLE temp_table AS
SELECT SmoeringNavn, Merke, Kategori, TempMin, TempMax, 
       BeskrivelseSmoering, HovedSnotype
FROM Smoering;

DELETE FROM Smoering;

ALTER TABLE Smoering AUTO_INCREMENT = 1;

INSERT INTO Smoering (SmoeringNavn, Merke, Kategori, TempMin, TempMax, 
                      BeskrivelseSmoering, HovedSnotype)
SELECT SmoeringNavn, Merke, Kategori, TempMin, TempMax, 
       BeskrivelseSmoering, HovedSnotype
FROM temp_table;

SELECT * FROM smoering;

INSERT INTO SmoeringSnotype (SmoeringID, Snotype)
VALUES
  (1, "Finkornet"),           -- VR40 
  (1, "Grovkornet"),          -- VR40
  (3, "Grovkornet"),          -- Rode Violett
  (3, "Nyfallen"),            -- Rode Violett
  (4, "Finkornet"),           -- Rode Multigrade
  (5, "Is"),                  -- Swix KX30 Ice Klister
  (5, "Skare"),               -- KX30 Ice Klister
  (6, "Grovkornet");         -- Start Green
  
  SELECT * FROM smoeringsnotype;
  
INSERT INTO Loype (
	LoypeNavn, LoypeDato, LoypeTemperatur, LoypeSnotype, LoypeBeskrivelse
)
VALUES
  ("Birkebeinerløypa", "2025-04-10", 2,  "Våt", 
   "Tungt føre midt på dagen"),

  ("Sjusjøen Rundt",   "2025-04-11", -1, "Finkornet", 
   "Kald morgen, ble mildere etter lunsj"),

  ("Holmenkollen",     "2025-02-15", -5, "Nyfallen", 
   "Flotte spor, kaldt og tørt"),

  ("Lillehammer Nord", "2025-04-12", 0,  "Is", 
   "Isete på morgenen, tiner opp i sola"),

  ("Trysil Fjell",     "2025-01-25", -12, "Tørr", 
   "Meget kaldt, glatte spor tidlig");
   
SELECT * FROM Loype;


INSERT INTO LoypeSmoering (LoypeID, SmoeringID, BrukerID)
VALUES
  -- Birkebeinerløypa #1
  (1, 1, 1),   -- VR40 (#1), Ola Normann (#1)
  (1, 2, 4),   -- KR70 Klister (#2), Lise Spor (#4)
  
  -- Sjusjøen Rundt #2
  (2, 3, 2),   -- Rode Violett (#3), Kari Ski (#2)
  (2, 4, 3),   -- Rode Multigrade (#4), Petter (#3)

  -- Holmenkollen #3
  (3, 1, 3),   -- VR40 (#1), Petter (#3)
  (3, 6, 1),   -- Start Green (#6), Ola (#1)
  
  -- Lillehammer Nord #4
  (4, 2, 4),   -- KR70 Klister (#2), Lise (#4)
  (4, 5, 4),   -- Swix KX30 Ice (#5), Lise (#4)
  
  -- Trysil Fjell #5
  (5, 6, 1);   -- Start Green (#6), Ola (#1)

SELECT * FROM loypesmoering;

INSERT INTO AlternativeSmoering (HovedSmoeringID, AlternativSmoeringID)
VALUES
  -- VR40 (#1) - mulige alternativer
  (1, 3),   -- VR40 har Rode Violett (#3) som alternativ
  (1, 4),   -- VR40 har også Rode Multigrade (#4)
  
  -- KR70 (#2) - mulige alternativer
  (2, 5),   -- Kan bytte til KX30 Ice (#5) 
  (2, 3),   -- Noen vil kanskje teste Rode Violett (#3) på 0-føre, litt uvanlig men mulig  

  -- Start Green (#6)
  (6, 4),   -- Hvis Start Green ikke finnes, bruk Rode Multigrade (#4) (f.eks.)
  
  -- Du kan fylle på med flere ...
  (3, 4);   -- Rode Violett (#3) har Rode Multigrade (#4) som alternativ
  
SELECT * FROM alternativesmoering;

