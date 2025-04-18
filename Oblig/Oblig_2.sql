CREATE TABLE provins (
    provins_id CHAR(2) PRIMARY KEY,
    provins_navn TEXT NOT NULL
);

INSERT INTO provins (provins_id, provins_navn)
VALUES 
    ('AB', 'Alberta'),
    ('BC', 'British Columbia'),
    ('MB', 'Manitoba'),
    ('NB', 'New Brunswick'),
    ('NL', 'Newfoundland and Labrador'),
    ('NT', 'Northwest Territories'),
    ('NS', 'Nova Scotia'),
    ('NU', 'Nunavut'),
    ('ON', 'Ontario'),
    ('PE', 'Prince Edward Island'),
    ('QC', 'Quebec'),
    ('SK', 'Saskatchewan'),
    ('YT', 'Yukon');
    


ALTER TABLE pasienter 
CHANGE COLUMN `ï»¿pasient_id` pasient_id INT;

DESCRIBE pasienter;

ALTER TABLE pasienter
ADD CONSTRAINT fk_pasient_provins
FOREIGN KEY (provins_id) REFERENCES provins(provins_id)
ON DELETE SET NULL;

CREATE VIEW pasienter_med_provins AS
SELECT
    p.pasient_id,
    p.fornavn,
    p.etternavn,
    p.kjonn,
    p.fodselsdag,
    p.hoyde,
    p.vekt,
    p.provins_id,
    pr.provins_navn
FROM pasienter p
JOIN provins pr ON p.provins_id = pr.provins_id;

SELECT pasient_id, fornavn, etternavn, provins_id FROM pasienter;



