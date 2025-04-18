-- Ferdighetsniva
CREATE TABLE Ferdighetsniva (
    ferdighetsniva_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(50) NOT NULL UNIQUE, 
    beskrivelse TEXT
);

-- Bruker
CREATE TABLE Bruker (
    bruker_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(100) NOT NULL,
    epost VARCHAR(100) UNIQUE NOT NULL,
    passord_hash VARCHAR(255) NOT NULL,
    ferdighetsniva_id INT UNSIGNED NOT NULL,
    opprettet_dato TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ferdighetsniva_id)
        REFERENCES Ferdighetsniva(ferdighetsniva_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Merkevare
CREATE TABLE Merkevare (
    merkevare_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(50) NOT NULL UNIQUE
);

-- Smoringkategori
CREATE TABLE Smoringkategori (
    smoringkategori_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(50) NOT NULL UNIQUE
);

-- Smoring
CREATE TABLE Smoring (
    smoring_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(100) NOT NULL,
    merkevare_id INT UNSIGNED NOT NULL,
    smoringkategori_id INT UNSIGNED NOT NULL,
    temperatur_min NUMERIC(5,2) NOT NULL CHECK (temperatur_min BETWEEN -50 AND 20),
    temperatur_max NUMERIC(5,2) NOT NULL CHECK (temperatur_max BETWEEN -50 AND 20),
    beskrivelse TEXT,
    CONSTRAINT valid_temperatur CHECK (temperatur_min <= temperatur_max),
    CONSTRAINT unique_smoring UNIQUE (navn, merkevare_id),
    FOREIGN KEY (merkevare_id)
        REFERENCES Merkevare(merkevare_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (smoringkategori_id)
        REFERENCES Smoringkategori(smoringkategori_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Snotype
CREATE TABLE Snotype (
    snotype_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    navn VARCHAR(50) NOT NULL UNIQUE
);

-- Loypeforhold
CREATE TABLE Loypeforhold (
    loypeforhold_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    snotype_id INT UNSIGNED NOT NULL,
    temperatur NUMERIC(5,2) NOT NULL CHECK (temperatur BETWEEN -50 AND 20),
    fuktighet NUMERIC(5,2) CHECK (fuktighet BETWEEN 0 AND 100),
    dato TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    beskrivelse TEXT,
    FOREIGN KEY (snotype_id)
        REFERENCES Snotype(snotype_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Loypeforhold_smoring
CREATE TABLE Loypeforhold_smoring (
    loypeforhold_id INT UNSIGNED,
    smoring_id INT UNSIGNED,
    ferdighetsniva_id INT UNSIGNED,
    anbefaling_score NUMERIC(5,2) CHECK (anbefaling_score BETWEEN 0 AND 100),
    PRIMARY KEY (loypeforhold_id, smoring_id, ferdighetsniva_id),
    FOREIGN KEY (loypeforhold_id)
        REFERENCES Loypeforhold(loypeforhold_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (smoring_id)
        REFERENCES Smoring(smoring_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (ferdighetsniva_id)
        REFERENCES Ferdighetsniva(ferdighetsniva_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Alternativsmoring
CREATE TABLE Alternativsmoring (
    alternativ_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    smoring_id INT UNSIGNED NOT NULL,
    alternativ_smoring_id INT UNSIGNED NOT NULL,
    prioritet INT NOT NULL CHECK (prioritet > 0),
    CONSTRAINT unique_alternativ UNIQUE (smoring_id, alternativ_smoring_id),
    FOREIGN KEY (smoring_id)
        REFERENCES Smoring(smoring_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (alternativ_smoring_id)
        REFERENCES Smoring(smoring_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Deretter lager du en trigger som hindrer lik ID
DELIMITER $$

CREATE TRIGGER no_self_reference_trigger
BEFORE INSERT
ON Alternativsmoring
FOR EACH ROW
BEGIN
    IF NEW.smoring_id = NEW.alternativ_smoring_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No self-reference allowed (smoring_id = alternativ_smoring_id).';
    END IF;
END$$

DELIMITER ;

-- Indekser
CREATE INDEX idx_bruker_ferdighetsniva_id ON Bruker(ferdighetsniva_id);
CREATE INDEX idx_smoring_merkevare_id ON Smoring(merkevare_id);
CREATE INDEX idx_smoring_smoringkategori_id ON Smoring(smoringkategori_id);
CREATE INDEX idx_smoring_temperatur_min ON Smoring(temperatur_min);
CREATE INDEX idx_smoring_temperatur_max ON Smoring(temperatur_max);
CREATE INDEX idx_loypeforhold_snotype_id ON Loypeforhold(snotype_id);
CREATE INDEX idx_loypeforhold_temperatur ON Loypeforhold(temperatur);
CREATE INDEX idx_loypeforhold_smoring_smoring_id ON Loypeforhold_smoring(smoring_id);
CREATE INDEX idx_alternativsmoring_smoring_id ON Alternativsmoring(smoring_id);
CREATE INDEX idx_alternativsmoring_alternativ_smoring_id ON Alternativsmoring(alternativ_smoring_id);

