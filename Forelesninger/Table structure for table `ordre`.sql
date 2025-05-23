
--
-- Table structure for table `ordre`
--
CREATE TABLE `ordre` (
`kunde_id` int NOT NULL,
`garn_produsent` varchar(20),
`garn_navn` varchar(25),
`antall` int,
`dato` datetime,
PRIMARY KEY (`kunde_id`,`garn_produsent`,`garn_navn`,`dato`),
KEY `fk_ordre_garn` (`garn_produsent`,`garn_navn`),
CONSTRAINT `fk_ordre_garn` FOREIGN KEY (`garn_produsent`, `garn_navn`) REFERENCES
`garn` (`produsent`, `navn`),
CONSTRAINT `fk_ordre_kunde` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`id`)
);
--
-- Dumping data for table `ordre`
--
INSERT INTO `ordre` VALUES (1,'Drops','Lima',10,'2024-02-05 10:30:00'),
(1,'Drops','Melody',24,'2024-02-09 11:00:00'),(2,'Drops','Fabel',1,'2024-02-09
12:15:00'),(2,'Sandnes Garn','Alpakka',15,'2024-02-05 11:45:00'),
(3,'Drops','Lima',5,'2024-02-09 13:30:00'),(3,'Sandnes Garn','Alpakka ull',5,'2024-
02-06 09:15:00'),(4,'Drops','Melody',8,'2024-02-06 10:30:00'),(5,'Sandnes
Garn','Alpakka silke',12,'2024-02-06 11:45:00'),(6,'Drops','Daisy',18,'2024-02-06
13:00:00'),(7,'Sandnes Garn','Alpakka',3,'2024-02-06 14:15:00'),
(8,'Drops','Daisy',22,'2024-02-06 15:30:00'),(9,'Sandnes Garn','Babyull
lanett',7,'2024-02-07 09:45:00'),(10,'Drops','Air',14,'2024-02-07 11:00:00'),
(11,'Drops','Melody',25,'2024-02-07 12:15:00'),(12,'Drops','Air',9,'2024-02-07
13:30:00'),(13,'Drops','Air',16,'2024-02-07 14:45:00'),(14,'Drops','Belle',4,'2024-
02-07 16:00:00'),(15,'Drops','Alpaca',11,'2024-02-08 09:15:00'),
(16,'Drops','Alpaca',19,'2024-02-08 10:30:00'),(17,'Drops','Nord',6,'2024-02-08
11:45:00'),(18,'Drops','Snow',13,'2024-02-08 13:00:00'),(19,'Sandnes
Garn','Alpakka',21,'2024-02-08 14:15:00'),(20,'Drops','Air',2,'2024-02-08
15:30:00'),(21,'Drops','Nord',20,'2024-02-05 15:00:00'),(21,'Sandnes Garn','Babyull
lanett',17,'2024-02-09 09:45:00');
