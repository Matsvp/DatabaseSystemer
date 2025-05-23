
--
-- Table structure for table `kunde`
--
CREATE TABLE `kunde` (
`id` int NOT NULL,
`navn` varchar(255),
`adresse` varchar(255),
`telefonnummer` varchar(20),
`epost` varchar(255),
`post_nr` int,
PRIMARY KEY (`id`),
KEY `fk_kunde_post` (`post_nr`),
CONSTRAINT `fk_kunde_post` FOREIGN KEY (`post_nr`) REFERENCES `post` (`nr`)
);
--
-- Dumping data for table `kunde`
--
INSERT INTO `kunde` VALUES
(1, 'Anna Hansen', '123 Maple Street, Cityville', '555-1111', 'anna.hansen@example.com', 1),
(2, 'Bob Johnson', '456 Oak Avenue, Townsville', '555-2222', 'bob.johnson@example.com', 1340),
(3, 'Carlos Rodriguez', '789 Elm Lane, Villagetown', '555-3333', 'carlos.rodriguez@example.com', 1359),
(4, 'Emily White', '321 Cedar Road, Cityville', '555-4444', 'emily.white@example.com', 1400),
(5, 'David Kim', '654 Birch Street, Townsville', '555-5555', 'david.kim@example.com', 1449),
(6, 'Sophie Miller', '876 Pine Lane, Villagetown', '555-6666', 'sophie.miller@example.com', 1592),
(7, 'Michael Davis', '234 Oak Road, Cityville', '555-7777', 'michael.davis@example.com', 1604),
(8, 'Emma Brown', '567 Maple Avenue, Townsville', '555-8888', 'emma.brown@example.com', 1615),
(9, 'Ethan Wilson', '890 Cedar Lane, Villagetown', '555-9999', 'ethan.wilson@example.com', 1634),
(10, 'Olivia Taylor', '432 Elm Street, Cityville', '555-1010', 'olivia.taylor@example.com', 1655),
(11, 'Liam Lee', '765 Birch Avenue, Townsville', '555-1111', 'liam.lee@example.com', 1704),
(12, 'Ava Hernandez', '109 Pine Road, Villagetown', '555-1212', 'ava.hernandez@example.com', 1710),
(13, 'Noah Martinez', '876 Oak Lane, Cityville', '555-1313', 'noah.martinez@example.com', 1710),
(14, 'Isabella Smith', '543 Maple Road, Townsville', '555-1414', 'isabella.smith@example.com', 1711),
(15, 'Mia Johnson', '210 Cedar Avenue, Villagetown', '555-1515', 'mia.johnson@example.com', 1769),
(16, 'James Wilson', '789 Elm Street, Cityville', '555-1616', 'james.wilson@example.com', 1894),
(17, 'Grace Lee', '321 Birch Lane, Townsville', '555-1717', 'grace.lee@example.com', 1927),
(18, 'Benjamin Davis', '654 Oak Road, Villagetown', '555-1818', 'benjamin.davis@example.com', 2036),
(19, 'Ava Taylor', '987 Maple Avenue, Cityville', '555-1919', 'ava.taylor@example.com', 2307),
(20, 'Lucas White', '432 Cedar Street, Townsville', '555-2020', 'lucas.white@example.com', 2355),
(21, 'Lisa Svensson', '789 Pine Road, Villagetown', '555-2020', 'lisa.svensson@example.com', 2622);

