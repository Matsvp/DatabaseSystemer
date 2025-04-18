CREATE TABLE SmoeringSnotype (
    SmoeringID INT NOT NULL,
    Snøtype VARCHAR(50) NOT NULL,  -- f.eks. "Finkornet", "Grovkornet", "Våt", ...
    PRIMARY KEY (SmoeringID, Snotype),
    FOREIGN KEY (SmoeringID) REFERENCES Smoering(SmoeringID)
);

ALTER TABLE SmoeringSnøtype RENAME TO SmoeringSnotype;

ALTER TABLE smoeringsnotype
CHANGE Snøtype Snotype VARCHAR(50) NOT NULL;

SELECT * from smoeringsnotype;