--
-- Table structure for table `garn`
--
CREATE TABLE `garn` (
`produsent` varchar(20),
`navn` varchar(25),
`pris` int ,
`vekt` int ,
`lopemeter` int,
`fiber` varchar(50),
`pinnestorrelse` float,
`strikkefasthet` varchar(15),
PRIMARY KEY (`produsent`,`navn`)
);
--
-- Dumping data for table `garn`
--
INSERT INTO `garn` VALUES ('Drops','Air',74,50,150,'65% alpakka, 28% polyamid, 7%
ull',5,'17m x 22p'),('Drops','Alaska',25,50,70,'100% ull',5,'17m x 22p'),
('Drops','Alpaca',54,50,167,'100% alpakka',3,'24m x 32p'),('Drops','Alpaca
Boucle',47,50,140,'80% alpakka, 15% ull, 5% polyamid',5,'17m x 22p'),
('Drops','Andes',64,100,90,'65% ull, 35% alpakka',9,'10m x 14p'),('Drops','Baby
Merino',42,50,175,'100% ull',3,'24m x 32p'),('Drops','Belle',29,50,120,'53% bomull,
33% viskose, 14% lin',4,'21m x 28p'),('Drops','Big Merino',42,50,75,'100%
ull',5,'17m x 22p'),('Drops','Bomull-Lin',33,50,85,'53% bomull, 47% lin',5,'17m x
22p'),('Drops','Brushed Alpaca Silk',38,25,140,'77% alpakka, 23% silke',5,'17m x
22p'),('Drops','Cotton Light',17,50,105,'50% bomull, 50% polyester',4,'21m x 28p'),
('Drops','Cotton Merino',43,50,110,'50% ull, 50% bomull',4,'21m x 28p'),
('Drops','Daisy',50,50,110,'100% ull',4,'21m x 28p'),
('Drops','Delight',38,50,175,'75% ull, 25% polyamid',3.5,'23m x 30p'),
('Drops','Fabel',29,50,205,'75% ull, 25% polyamid',3,'24m x 32p'),
('Drops','Flora',32,50,210,'65% ull, 35% alpakka',3,'24m x 32p'),
('Drops','Glitter',26,10,700,'60% cupro, 40% metall',NULL,''),
('Drops','Karisma',28,50,100,'100% ull',4,'21m x 28p'),('Drops','Kid-
Silk',65,25,210,'75% mohair, 25% silke',3.5,'23m x 30p'),
('Drops','Lima',38,50,100,'65% ull, 35% alpakka',4,'21m x 28p'),('Drops','Loves You
7',13,50,170,'100% bomull',3.5,'23m x 30p'),('Drops','Loves You 9',10,50,125,'100%
bomull',3,'24m x 32p'),('Drops','Melody',74,50,140,'71% alpakka, 25% ull, 4%
polyamid',8,'12m x 14p'),('Drops','Merino Extra Fine',42,50,105,'100% ull',4,'21m x
28p'),('Drops','Muskat',26,50,100,'100% bomull',4,'21m x 28p'),
('Drops','Nepal',32,50,75,'65% ull, 35% alpakka',5,'17m x 22p'),
('Drops','Nord',44,50,170,'45% alpakka, 30% polyamid, 25% ull',3,'24m x 32p'),
('Drops','Paris',16,50,75,'100% bomull',5,'17m x 22p'),
('Drops','Polaris',54,100,36,'100% ull',12,'8m x 10p'),
('Drops','Puna',44,50,110,'100% alpakka',4,'21m x 28p'),
('Drops','Safran',20,50,160,'100 % bomull',3,'24m x 32p'),
('Drops','Sky',68,50,190,'74% alpakka, 18% polyamid, 8% ull',4,'21m x 28p'),
('Drops','Snow',25,50,50,'100% ull',9,'10m x 14p'),('Drops','Soft
Tweed',55,50,130,'50% ull, 25% alpakka, 25% viskose',4,'21m x 28p'),
('Drops','Wish',62,50,70,'50% alpakka, 33% bomull, 17% ull',9,'10m x 14p'),
('Sandnes Garn','Alpakka',95,50,110,'100% alpakka',3.5,'22m'),('Sandnes
Garn','Alpakka følgetråd',89,50,400,'100% alpakka',NULL,''),('Sandnes
Garn','Alpakka silke',119,50,200,'70% baby alpakka, 30% mulberry silke',3,'27m'),
('Sandnes Garn','Alpakka ull',75,50,100,'65% alpakka, 35% ull',4,'22-19m'),
('Sandnes Garn','Babyull lanett',83,50,175,'100% merinoull',3,'27-31m'),('Sandnes
Garn','Børstet alpakka',109,50,110,'96% børstet alpakka, 4% nylon',5.5,'18-12m');
