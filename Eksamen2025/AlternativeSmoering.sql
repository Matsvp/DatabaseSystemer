CREATE TABLE AlternativeSmoering (
    HovedSmoeringID INT,
    AlternativSmoeringID INT,
    PRIMARY KEY (HovedSmoeringID, AlternativSmoeringID),
    FOREIGN KEY (HovedSmoeringID) REFERENCES Smoering(SmoeringID),
    FOREIGN KEY (AlternativSmoeringID) REFERENCES Smoering(SmoeringID)
);

SELECT * FROM alternativesmoering;