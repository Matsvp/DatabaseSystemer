CREATE TABLE LoypeSmoering (
    LoypeID INT NOT NULL,
    SmoeringID INT NOT NULL,
    BrukerID INT,               -- Hvem som registrerte denne anbefalingen
    PRIMARY KEY (LoypeID, SmoeringID),
    FOREIGN KEY (LoypeID) REFERENCES Loype(LoypeID),
    FOREIGN KEY (SmoeringID) REFERENCES Smoering(SmoeringID),
    FOREIGN KEY (BrukerID) REFERENCES Bruker(BrukerID)
);

SELECT * from loypesmoering;