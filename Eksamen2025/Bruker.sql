CREATE TABLE Bruker (
    BrukerID INT AUTO_INCREMENT PRIMARY KEY,
    BrukerNavn VARCHAR(50),
    BrukerNivaa VARCHAR(20),    -- "Nybegynner", "Erfaren", "Konkurranseløper", ...
    Kommentar VARCHAR(255)      -- Evt. fritekst: "Trenger allsidig smøring"
);
