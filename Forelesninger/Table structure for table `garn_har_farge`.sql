
--
-- Table structure for table `garn_har_farge`
--
CREATE TABLE `garn_har_farge` (
`garn_produsent` varchar(20),
`garn_navn` varchar(25),
`farge_id` int,
PRIMARY KEY (`garn_produsent`,`garn_navn`,`farge_id`),
KEY `fk_farge_ghf` (`farge_id`),
CONSTRAINT `fk_farge_ghf` FOREIGN KEY (`farge_id`) REFERENCES `farge` (`id`),
CONSTRAINT `fk_garn_ghf` FOREIGN KEY (`garn_produsent`, `garn_navn`) REFERENCES
`garn` (`produsent`, `navn`)
);
--
-- Dumping data for table `garn_har_farge`
--
INSERT INTO `garn_har_farge` VALUES ('Drops','Air',1),('Drops','Alaska',1),
('Drops','Alpaca',1),('Drops','Alpaca Boucle',1),('Drops','Andes',1),
('Drops','Belle',1),('Drops','Big Merino',1),('Drops','Bomull-Lin',1),
('Drops','Cotton Merino',1),('Drops','Daisy',1),('Drops','Melody',1),
('Drops','Nord',1),('Drops','Polaris',1),('Drops','Puna',1),('Drops','Soft
Tweed',1),('Drops','Wish',1),('Drops','Air',2),('Drops','Alaska',2),
('Drops','Alpaca',2),('Drops','Wish',2),('Drops','Air',3),('Drops','Alaska',3),
('Drops','Melody',3),('Drops','Nord',3),('Drops','Sky',3),('Drops','Air',4),
('Drops','Alpaca',4),('Drops','Daisy',4),('Drops','Polaris',4),('Drops','Wish',4),
('Drops','Air',5),('Drops','Alpaca',5),('Drops','Alpaca Boucle',5),
('Drops','Andes',5),('Drops','Bomull-Lin',5),('Drops','Daisy',5),
('Drops','Puna',5),('Drops','Air',6),('Drops','Big Merino',6),('Drops','Puna',6),
('Drops','Air',7),('Drops','Polaris',7),('Drops','Air',8),('Drops','Alpaca',8),
('Drops','Loves You 9',8),('Drops','Air',9),('Drops','Alaska',9),
('Drops','Alpaca',9),('Drops','Andes',9),('Drops','Belle',9),('Drops','Big
Merino',9),('Drops','Cotton Merino',9),('Drops','Daisy',9),('Drops','Loves You
9',9),('Drops','Nord',9),('Drops','Sky',9),('Drops','Wish',9),('Drops','Air',10),
('Drops','Alaska',10),('Drops','Alpaca',10),('Drops','Melody',10),
('Drops','Nord',10),('Drops','Air',11),('Drops','Air',12),('Drops','Andes',12),
('Drops','Belle',12),('Drops','Daisy',12),('Drops','Air',13),('Drops','Andes',13),
('Drops','Daisy',13),('Drops','Air',14),('Drops','Air',15),('Drops','Alpaca',15),
('Drops','Air',16),('Drops','Air',17),('Drops','Alaska',17),('Drops','Alpaca',17),
('Drops','Belle',17),('Drops','Big Merino',17),('Drops','Cotton Merino',17),
('Drops','Loves You 9',17),('Drops','Nord',17),('Drops','Sky',17),
('Drops','Wish',17),('Drops','Air',18),('Drops','Air',19),('Drops','Alpaca',19),
('Drops','Big Merino',19),('Drops','Cotton Merino',19),('Drops','Nord',19),
('Drops','Alaska',20),('Drops','Cotton Merino',20),('Drops','Wish',20),
('Drops','Air',21),('Drops','Loves You 9',21),('Drops','Air',22),
('Drops','Alaska',23),('Drops','Alpaca Boucle',23),('Drops','Andes',23),
('Drops','Big Merino',23),('Drops','Cotton Merino',23),('Drops','Delight',23),
('Drops','Loves You 9',23),('Drops','Melody',23),('Drops','Nord',23),
('Drops','Puna',23),('Drops','Air',24),('Drops','Loves You 9',24),
('Drops','Air',25),('Drops','Air',26),('Drops','Andes',26),('Drops','Big
Merino',26),('Drops','Bomull-Lin',26),('Drops','Cotton Merino',26),('Drops','Loves
You 9',26),('Drops','Melody',26),('Drops','Puna',26),('Drops','Wish',26),
('Drops','Air',27),('Drops','Andes',27),('Drops','Cotton Merino',27),
('Drops','Sky',27),('Drops','Wish',27),('Drops','Alaska',28),('Drops','Bomull-
Lin',28),('Drops','Air',29),('Drops','Wish',29),('Drops','Air',30),
('Drops','Daisy',30),('Drops','Nord',30),('Drops','Wish',30),('Drops','Air',31),
('Drops','Alaska',31),('Drops','Alpaca',31),('Drops','Alpaca Boucle',31),
('Drops','Andes',31),('Drops','Belle',31),('Drops','Big Merino',31),
('Drops','Bomull-Lin',31),('Drops','Cotton Merino',31),('Drops','Daisy',31),
('Drops','Melody',31),('Drops','Nord',31),('Drops','Polaris',31),
('Drops','Sky',31),('Drops','Air',32),('Drops','Alpaca',32),('Drops','Nord',32),
('Drops','Air',33),('Drops','Air',34),('Drops','Air',35),('Drops','Air',36),
('Drops','Alpaca',36),('Drops','Daisy',36),('Drops','Melody',36),
('Drops','Air',37),('Drops','Air',38),('Drops','Air',39),('Drops','Daisy',39),
('Drops','Air',40),('Drops','Big Merino',40),('Drops','Daisy',40),
('Drops','Air',41),('Drops','Cotton Merino',41),('Drops','Daisy',41),
('Drops','Melody',41),('Drops','Nord',41),('Drops','Air',42),('Drops','Alpaca',42),
('Drops','Big Merino',42),('Drops','Cotton Merino',42),('Drops','Daisy',42),
('Drops','Melody',42),('Drops','Air',43),('Drops','Cotton Merino',43),
('Drops','Daisy',43),('Drops','Air',44),('Drops','Air',45),('Drops','Alaska',45),
('Drops','Air',46),('Drops','Air',47),('Drops','Air',48),('Drops','Air',49),
('Drops','Air',50),('Drops','Melody',50),('Drops','Air',51),('Drops','Air',52),
('Drops','Alpaca',52),('Drops','Air',53),('Drops','Air',54),('Drops','Air',55),
('Drops','Alpaca Boucle',55),('Drops','Andes',55),('Drops','Belle',55),
('Drops','Big Merino',55),('Drops','Nord',55),('Drops','Polaris',55),
('Drops','Alaska',56),('Drops','Alaska',57),('Drops','Alaska',58),
('Drops','Alaska',59),('Drops','Alpaca',59),('Drops','Alpaca Boucle',59),
('Drops','Andes',59),('Drops','Bomull-Lin',59),('Drops','Daisy',59),('Drops','Loves
You 9',59),('Drops','Nord',59),('Drops','Puna',59),('Drops','Wish',59),
('Drops','Alaska',60),('Drops','Alaska',61),('Drops','Melody',61),
('Drops','Sky',61),('Drops','Alaska',62),('Drops','Alaska',63),
('Drops','Alpaca',63),('Drops','Andes',63),('Drops','Loves You 9',63),
('Drops','Nord',63),('Drops','Polaris',63),('Drops','Puna',63),
('Drops','Alaska',64),('Drops','Alpaca',64),('Drops','Puna',64),
('Drops','Alaska',65),('Drops','Alaska',66),('Drops','Alaska',67),
('Drops','Alaska',68),('Drops','Alpaca',68),('Drops','Belle',68),
('Drops','Melody',68),('Drops','Alaska',69),('Drops','Alaska',70),
('Drops','Alpaca',70),('Drops','Andes',70),('Drops','Daisy',70),
('Drops','Glitter',70),('Drops','Nord',70),('Drops','Alaska',71),('Drops','Big
Merino',71),('Drops','Alaska',72),('Drops','Loves You 9',72),('Drops','Melody',72),
('Drops','Alaska',73),('Drops','Alaska',74),('Drops','Alaska',75),
('Drops','Alpaca',76),('Drops','Loves You 9',76),('Drops','Alpaca',77),
('Drops','Alpaca',78),('Drops','Alpaca',79),('Drops','Alpaca',80),
('Drops','Sky',80),('Drops','Alpaca',81),('Drops','Alpaca',82),
('Drops','Andes',82),('Drops','Belle',82),('Drops','Bomull-Lin',82),('Drops','Loves
You 9',82),('Drops','Sky',82),('Drops','Alpaca',83),('Drops','Soft Tweed',83),
('Drops','Alpaca',84),('Drops','Alpaca',85),('Drops','Loves You 9',85),
('Drops','Alpaca',86),('Drops','Alpaca',87),('Drops','Daisy',87),
('Drops','Alpaca',88),('Drops','Daisy',88),('Drops','Alpaca',89),
('Drops','Alpaca',90),('Drops','Belle',90),('Drops','Alpaca',91),
('Drops','Andes',91),('Drops','Daisy',91),('Drops','Sky',91),('Drops','Alpaca',92),
('Drops','Alpaca',93),('Drops','Alpaca',94),('Drops','Sky',94),
('Drops','Alpaca',95),('Drops','Cotton Merino',95),('Drops','Alpaca',96),
('Drops','Alpaca',97),('Drops','Alpaca',98),('Drops','Alpaca',99),
('Drops','Nord',99),('Drops','Alpaca',100),('Drops','Alpaca',101),
('Drops','Alpaca',102),('Drops','Soft Tweed',102),('Drops','Alpaca',103),
('Drops','Alpaca',104),('Drops','Alpaca',105),('Drops','Andes',105),
('Drops','Cotton Merino',105),('Drops','Melody',105),('Drops','Sky',105),
('Drops','Alpaca',106),('Drops','Alpaca',107),('Drops','Alpaca',108),
('Drops','Alpaca',109),('Drops','Andes',110),('Drops','Andes',111),('Drops','Soft
Tweed',111),('Drops','Andes',112),('Drops','Andes',113),('Drops','Andes',114),
('Drops','Big Merino',114),('Drops','Daisy',114),('Drops','Loves You 9',114),
('Drops','Nord',114),('Drops','Andes',115),('Drops','Andes',116),
('Drops','Andes',117),('Drops','Loves You 9',118),('Drops','Sky',119),
('Drops','Soft Tweed',119),('Drops','Polaris',120),('Drops','Cotton Merino',121),
('Drops','Soft Tweed',122),('Drops','Soft Tweed',123),('Drops','Melody',124),
('Drops','Sky',125),('Drops','Sky',126),('Drops','Big Merino',127),('Drops','Loves
You 9',128),('Drops','Belle',129),('Drops','Nord',129),('Drops','Soft Tweed',130),
('Drops','Sky',131),('Drops','Big Merino',132),('Drops','Wish',132),
('Drops','Puna',133),('Drops','Soft Tweed',134),('Drops','Glitter',135),
('Drops','Soft Tweed',136),('Drops','Nord',137),('Drops','Cotton Merino',138),
('Drops','Sky',139),('Drops','Wish',139),('Drops','Daisy',140),
('Drops','Daisy',141),('Drops','Nord',141),('Drops','Sky',142),
('Drops','Wish',142),('Drops','Nord',143),('Drops','Belle',144),('Drops','Cotton
Merino',145),('Drops','Sky',146),('Drops','Soft Tweed',146),('Drops','Daisy',147),
('Drops','Big Merino',148),('Drops','Cotton Merino',148),('Drops','Loves You
9',149),('Drops','Nord',150),('Drops','Sky',151),('Drops','Belle',152),
('Drops','Cotton Merino',152),('Drops','Nord',152),('Drops','Belle',153),
('Drops','Big Merino',154),('Drops','Daisy',155),('Drops','Melody',155),
('Drops','Soft Tweed',155),('Drops','Belle',156),('Drops','Big Merino',157),
('Drops','Melody',158),('Drops','Bomull-Lin',159),('Drops','Daisy',160),
('Drops','Belle',161),('Drops','Melody',161),('Drops','Wish',162),('Drops','Big
Merino',163),('Drops','Soft Tweed',164),('Drops','Belle',165),('Drops','Cotton
Merino',166),('Drops','Cotton Merino',167),('Drops','Big Merino',168),
('Drops','Daisy',168),('Drops','Nord',168),('Drops','Soft Tweed',169),
('Drops','Soft Tweed',170),('Drops','Delight',171),('Drops','Belle',172),
('Drops','Melody',172),('Drops','Cotton Merino',173),('Drops','Nord',173),
('Drops','Nord',174),('Drops','Belle',175),('Drops','Bomull-Lin',175),
('Drops','Loves You 9',175),('Drops','Sky',175),('Drops','Soft Tweed',175),
('Drops','Cotton Merino',176),('Drops','Belle',177),('Drops','Nord',178),
('Drops','Cotton Merino',179),('Drops','Wish',180),('Drops','Belle',181),
('Drops','Soft Tweed',182),('Drops','Wish',183),('Drops','Soft Tweed',184),
('Drops','Melody',185),('Drops','Cotton Merino',186),('Drops','Loves You 9',186),
('Drops','Sky',187),('Drops','Sky',188),('Drops','Glitter',189),
('Drops','Sky',190),('Drops','Melody',191),('Drops','Cotton Merino',192),
('Drops','Melody',192),('Drops','Sky',193);
