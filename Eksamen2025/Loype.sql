CREATE TABLE Loype (
    LoypeID INT AUTO_INCREMENT PRIMARY KEY,
    LoypeNavn VARCHAR(100),
    LoypeDato DATE,                  -- Evt. DATETIME hvis du vil ha klokkeslett
    LoypeTemperatur INT,            -- Faktisk temperatur i sporet
    LoypeSnøtype VARCHAR(50),       -- "Våt", "Finkornet", ...
    LoypeBeskrivelse VARCHAR(255)   -- Tekstlig info: "Våt og tung", "Isete morgener", ...
);

ALTER TABLE Loype
CHANGE LoypeSnøtype LoypeSnotype VARCHAR(50);