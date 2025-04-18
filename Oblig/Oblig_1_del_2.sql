CREATE TABLE pasienter (
	pasient_id INT AUTO_INCREMENT PRIMARY KEY,
	fornavn VARCHAR(50) NOT NULL,
	etternavn VARCHAR(50) NOT NULL,
	kjonn char(1) NOT NULL CHECK (kjonn IN ('M', 'F', 'O')),
	fodselsdag DATE NOT NULL,
	sted VARCHAR(100), 
	allergier TEXT,
	hoyde DECIMAL(5,2),
	vekt DECIMAL(5,2)
);
 
 
 

