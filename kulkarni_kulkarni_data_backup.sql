-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database:Bank 
-- ------------------------------------------------------
-- Server version	5.6.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE bank;
USE bank;
-- Table structure for table `account_customers`
CREATE TABLE `customer` (
  `Account_id` int(10) unsigned NOT NULL,
  `Customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Customer_id`,`Account_id`),
  KEY `fk_Accounts_has_Customer_Customer1_idx` (`Customer_id`),
  KEY `fk_Accounts_has_Customer_Accounts1_idx` (`Account_id`),
  CONSTRAINT `fk_Accounts_has_Customer_Accounts1` FOREIGN KEY (`Account_id`) REFERENCES `accounts` (`Account_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accounts_has_Customer_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
LOCK TABLES `account_customers` WRITE;
/*!40000 ALTER TABLE `account_customers` DISABLE KEYS */;
INSERT INTO `account_customers` VALUES (10299200,1),(10299200,2),(10299202,3),(10299203,4),(10299204,5),(10299205,6),(10299206,7),(10299207,8),(10299208,9),(10299209,10),(10299210,11),(10299210,12),(10299211,12),(10299210,13),(10299212,13),(10299213,14),(10299214,15),(10299215,16),(10299216,17),(10299217,18),(10299218,18),(10299219,20),(10299220,20),(10299221,22),(10299222,23),(10299223,24),(10299223,25),(10299224,25),(10299226,26),(10299227,26),(10299228,27),(10299229,27),(10299230,28),(10299231,29),(10299232,29),(10299233,30),(10299234,30),(10299235,31),(10299236,31),(10299237,32);
/*!40000 ALTER TABLE `account_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_type`
--
CREATE TABLE `account_type` (
  `Account_Type` varchar(20) NOT NULL,
  `Minimum_Balance_Restriction` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Account_Type`)
)
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
INSERT INTO `account_type` VALUES ('checking',1500.00),('loan',0.00),('saving',1000.00);
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `Account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Account_Balance` decimal(10,2) NOT NULL,
  `Branch_id` int(10) unsigned NOT NULL,
  `Date_Opened` date NOT NULL,
  `Account_Type` varchar(20) NOT NULL,
  PRIMARY KEY (`Account_id`),
  KEY `fk_Accounts_Bank_details1_idx` (`Branch_id`),
  KEY `fk_Accounts_account_type1_idx` (`Account_Type`),
  CONSTRAINT `fk_Accounts_Bank_details1` FOREIGN KEY (`Branch_id`) REFERENCES `branches` (`Branch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Accounts_account_type1` FOREIGN KEY (`Account_Type`) REFERENCES `account_type` (`Account_Type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10299238 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (10299200,14000.00,121,'2012-08-08','saving'),(10299201,1320.00,121,'1990-08-08','saving'),(10299202,10000.00,123,'2000-10-10','checking'),(10299203,2999.00,124,'2001-09-28','loan'),(10299204,1000.00,125,'2005-09-09','loan'),(10299205,1234.00,126,'2009-10-28','checking'),(10299206,1000.00,127,'2010-10-10','loan'),(10299207,1000.00,128,'1994-12-29','checking'),(10299208,1000.00,122,'2000-03-09','checking'),(10299209,1320.00,123,'1990-08-08','saving'),(10299210,1500.00,124,'1990-08-08','saving'),(10299211,1903.00,124,'1990-08-08','saving'),(10299212,1001.00,126,'1990-08-08','saving'),(10299213,3000.00,129,'1998-09-09','checking'),(10299214,4000.00,130,'2001-09-09','checking'),(10299215,5000.00,131,'2000-11-09','checking'),(10299216,6000.00,132,'2005-12-09','checking'),(10299217,8000.00,133,'2000-03-03','saving'),(10299218,8020.00,133,'2000-03-01','saving'),(10299219,200.00,134,'2000-03-22','checking'),(10299220,5022.00,134,'1990-12-12','saving'),(10299221,1222.00,121,'1990-12-12','checking'),(10299222,1320.00,126,'1990-05-20','saving'),(10299223,420.00,127,'1995-06-21','checking'),(10299224,1500.00,128,'2001-08-08','saving'),(10299225,10233.00,128,'2001-08-08','saving'),(10299226,2000.00,124,'2000-08-08','saving'),(10299227,1000.00,123,'2000-10-10','checking'),(10299228,34500.00,124,'2001-09-28','loan'),(10299229,11000.00,125,'2005-09-09','loan'),(10299230,1234.00,126,'2009-10-28','checking'),(10299231,10000.00,127,'2010-10-10','loan'),(10299232,23400.00,128,'1994-12-29','checking'),(10299233,100.00,122,'2000-03-09','checking'),(10299234,120.00,123,'1990-08-08','saving'),(10299235,100.00,124,'1990-08-08','saving'),(10299236,19.00,124,'1990-08-08','saving'),(10299237,101.00,126,'1990-08-08','saving');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banking_transactions`
--

DROP TABLE IF EXISTS `banking_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banking_transactions` (
  `Transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Transaction_Type` varchar(45) NOT NULL,
  `Description` varchar(45) DEFAULT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Date` date NOT NULL,
  `Customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Transaction_id`),
  KEY `fk_Netbanking_transactions_Customer1_idx` (`Customer_id`),
  CONSTRAINT `fk_Netbanking_transactions_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101159 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banking_transactions`
--

LOCK TABLES `banking_transactions` WRITE;
/*!40000 ALTER TABLE `banking_transactions` DISABLE KEYS */;
INSERT INTO `banking_transactions` VALUES (101124,'debit','rent transfer -leo',1250.00,'2014-12-12',1),(101125,'credit','Bank of America Salary',4000.00,'2014-12-09',3),(101126,'debit','commision',123.23,'2000-08-12',21),(101127,'debit','household allowance',1000.00,'2001-02-21',20),(101128,'credit','deposit money for school',12000.00,'2005-03-03',19),(101129,'debit','my share for trip',250.00,'2001-08-22',19),(101130,'debit','lent money',30.00,'2010-05-12',6),(101131,'credit','application fee',44.00,'2000-08-12',21),(101132,'debit','University of Maryland Salary',123.23,'2000-08-12',4),(101133,'credit','commision',123.23,'2010-08-12',6),(101134,'debit','lease money transfer',1000.00,'2005-08-12',22),(101135,'credit','amazon transaction',190.00,'2000-08-12',19),(101136,'credit','ebay',45.00,'2014-04-11',2),(101137,'credit','funds transfer',120.00,'2012-09-09',5),(101138,'debit','online purchase',240.00,'2012-08-12',7),(101139,'debit','commision',13.45,'2014-08-12',13),(101140,'credit','commision',900.00,'2014-08-12',17),(101141,'debit','grocery transfer',1900.00,'2014-10-19',15),(101142,'debit','british airways',1000.00,'2014-11-11',18),(101143,'debit','monginis cake',1900.00,'2014-10-28',8),(101144,'debit','business transfer',12323.00,'2010-08-12',6),(101145,'credit','Bank of America Salary',4000.00,'2014-12-09',1),(101146,'debit','commision',123.00,'2014-08-12',1),(101147,'debit','household allowance',1000.00,'2014-02-21',1),(101148,'credit','deposit money for school',12000.00,'2014-03-03',1),(101149,'debit','my share for trip',250.00,'2014-08-22',1),(101150,'credit','Bank of America Salary',4000.00,'2014-12-09',2),(101151,'debit','commision',123.00,'2014-08-12',2),(101152,'debit','household allowance',1000.00,'2014-02-21',2),(101153,'credit','deposit money for school',12000.00,'2014-03-03',2),(101154,'debit','my share for trip',250.00,'2014-08-22',2),(101155,'credit','Bank of America Salary',1200.00,'2013-12-09',11),(101156,'debit','commision',100.00,'2014-08-12',11),(101157,'credit','Bank of America Salary',300.00,'2013-12-09',12),(101158,'debit','commision',100.00,'2014-08-12',12);
/*!40000 ALTER TABLE `banking_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `branch_emp_super`
--

DROP TABLE IF EXISTS `branch_emp_super`;
/*!50001 DROP VIEW IF EXISTS `branch_emp_super`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `branch_emp_super` (
  `Branch_id` tinyint NOT NULL,
  `Branch_Name` tinyint NOT NULL,
  `Start_Date` tinyint NOT NULL,
  `Employee_id` tinyint NOT NULL,
  `Employee_Name` tinyint NOT NULL,
  `Supervisor_id` tinyint NOT NULL,
  `Manager_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `branch_emp_super_sub`
--

DROP TABLE IF EXISTS `branch_emp_super_sub`;
/*!50001 DROP VIEW IF EXISTS `branch_emp_super_sub`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `branch_emp_super_sub` (
  `Employee_id` tinyint NOT NULL,
  `Employee_Name` tinyint NOT NULL,
  `Supervisor_id` tinyint NOT NULL,
  `Manager_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `branch_employees`
--

DROP TABLE IF EXISTS `branch_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch_employees` (
  `Branch_id` int(10) unsigned NOT NULL,
  `Employee_id` int(10) unsigned NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Employee_id`,`Branch_id`),
  KEY `fk_Bank_details_has_Bank_employee_details_Bank_employee_det_idx` (`Employee_id`),
  KEY `fk_Bank_details_has_Bank_employee_details_Bank_details_idx` (`Branch_id`),
  CONSTRAINT `fk_Bank_details_has_Bank_employee_details_Bank_details` FOREIGN KEY (`Branch_id`) REFERENCES `branches` (`Branch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bank_details_has_Bank_employee_details_Bank_employee_detai1` FOREIGN KEY (`Employee_id`) REFERENCES `employees` (`Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_employees`
--

LOCK TABLES `branch_employees` WRITE;
/*!40000 ALTER TABLE `branch_employees` DISABLE KEYS */;
INSERT INTO `branch_employees` VALUES (121,107181,'2009-10-07',NULL),(126,107181,'2009-05-01','2009-10-06'),(124,107182,'2010-10-07',NULL),(129,107182,'2010-01-01','2010-10-06'),(131,107183,'2011-01-01','2011-09-18'),(133,107183,'2011-09-18',NULL),(126,107184,'2012-08-10',NULL),(127,107185,'2013-07-05',NULL),(128,107186,'2014-06-04',NULL),(129,107187,'2015-01-01',NULL),(121,107188,'2010-10-06',NULL),(124,107189,'2011-09-12',NULL),(133,107190,'2012-08-13',NULL),(133,107191,'2013-07-14',NULL),(133,107192,'2011-06-25',NULL),(126,107193,'2010-04-26',NULL),(126,107194,'2009-08-26',NULL),(127,107195,'2008-09-26',NULL),(126,107196,'2008-08-12','2010-10-25'),(127,107196,'2010-10-26',NULL),(122,107197,'2009-06-10','2011-11-22'),(128,107197,'2011-11-26',NULL),(123,107198,'2010-01-01','2010-07-10'),(124,107198,'2010-07-11','2012-12-23'),(128,107198,'2012-12-26',NULL),(121,107199,'2008-07-01','2008-08-11'),(123,107199,'2008-08-12','2013-04-21'),(129,107199,'2013-04-26',NULL),(121,107200,'2007-09-01','2014-03-25'),(129,107200,'2014-03-26',NULL);
/*!40000 ALTER TABLE `branch_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `branch_total_amount`
--

DROP TABLE IF EXISTS `branch_total_amount`;
/*!50001 DROP VIEW IF EXISTS `branch_total_amount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `branch_total_amount` (
  `Branch_id` tinyint NOT NULL,
  `branch_name` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `amount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `Branch_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Branch_Name` varchar(45) NOT NULL,
  `Street_Address` varchar(50) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` char(2) NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `Phone_Number` varchar(12) NOT NULL,
  PRIMARY KEY (`Branch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (121,'Congressional Plan','101 Halpine Road','Rockville','MD',20852,'301-984-4850'),(122,'Cabin John','7941 Tuckerman Lane','Potomac','MD',20854,'301-299-5800'),(123,'DeQuincy','102 North Pine Street','DeQuincy','LA',70633,'337-786-3213'),(124,'Magruder House','7340 Westlake Terrace','Bethesda','MD',20817,'301-365-5100'),(125,'Rehoboth','19268 Old Landing Road','Rehoboth','DE',19971,'302-645-1360'),(126,'Market-Van Ness','1525 Market St','San Francisco','CA',94103,'415-622-0283'),(127,'Fifth Ave Plaza','800 5th Ave','Seattle','WA',98104,'206-358-0500'),(128,'State Street','60 State St','Boston','MA',2109,'617-723-8506'),(129,'Flat Rock','27511 Telegraph Rd','Flat Rock','MI',48134,'734-782-1119'),(130,'Woodward/Mack','3670 Woodward','Detroit','MI',48201,'313-832-4744'),(131,'Collier Center','201 E Washington St','Phoenix','AZ',20854,'602-523-2371'),(132,'Flushing-Roosevelt','136-01 Roosevelt Ave','Flushing','NY',11354,'718-445-1702'),(133,'Downtown Tampa','101 E Kennedy Blvd','Tampa','FL',33602,'813-225-8153'),(134,'Hyde Park','249 S Hyde Park Ave','Tampa','FL',33606,'813-251-2786'),(135,'Gaslamp','455 Island Ave','SanDiego','CA',92101,'619-238-8200');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cc_transactions`
--

DROP TABLE IF EXISTS `cc_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cc_transactions` (
  `Transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CC_Number` varchar(20) NOT NULL,
  `Transaction_Date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `Merchant_Details` varchar(45) NOT NULL,
  PRIMARY KEY (`Transaction_id`),
  KEY `fk_CC_transaction_details_Credit_card_details1_idx` (`CC_Number`),
  CONSTRAINT `fk_CC_transaction_details_Credit_card_details1` FOREIGN KEY (`CC_Number`) REFERENCES `credit_cards` (`CC_number`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=109241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cc_transactions`
--

LOCK TABLES `cc_transactions` WRITE;
/*!40000 ALTER TABLE `cc_transactions` DISABLE KEYS */;
INSERT INTO `cc_transactions` VALUES (109220,'5177949222736068','2013-10-28',23.00,'CVS Store, depot street'),(109221,'344660171599125','2011-09-17',8.30,'Subway North Henrico'),(109222,'4334517567232257','2012-09-22',16.34,'Forever 21 online transaction'),(109223,'4645207099011161','2013-10-10',100.00,'Sevenspring appartment'),(109224,'5381459681047122','2012-08-17',22.40,'Amazon online transaction'),(109225,'5139240276589982','2012-06-06',69.00,'Hair cutterybaltimore'),(109226,'4520741985877972','2012-01-07',23.00,'saladworks ceadar street'),(109227,'374494451771957','2013-09-07',340.00,'Forever 21 Nashville'),(109228,'4937540713790809','2013-07-17',50.00,'Ebay online tranasaction'),(109229,'371536125440616','2013-08-20',19.23,'COSTCO'),(109230,'4698069325275719','2015-08-12',33.33,'Body shop online transaction'),(109231,'5129065032168296','2015-12-23',250.00,'Applebees, Lake worth'),(109232,'374136060573161','2013-06-24',120.00,'Hair saloon, medavile'),(109233,'374136060573161','2013-06-24',100.00,'Nail saloon,medavile'),(109234,'374136060573161','2013-06-24',25.00,'Starbucks, medavile'),(109235,'379171565065628','2015-01-01',650.00,'Parkside appartment'),(109236,'5421954424069264','2015-02-18',50.00,'Mcdonalds'),(109237,'348740507690709','2014-08-24',340.00,'Apple online'),(109238,'5174242996526888','2014-01-15',2000.00,'Samsug online'),(109239,'348283329774155','2014-07-25',650.00,'Amazon online'),(109240,'348283329774155','2014-07-25',30.00,'Amazon online');
/*!40000 ALTER TABLE `cc_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_cards` (
  `CC_number` varchar(20) NOT NULL,
  `Maximum_Limit` decimal(10,2) NOT NULL,
  `Expiry_Date` date NOT NULL,
  `Credit_Score` int(11) NOT NULL,
  `Customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`CC_number`),
  KEY `fk_Credit_card_details_Customer1_idx` (`Customer_id`),
  CONSTRAINT `fk_Credit_card_details_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES ('344660171599125',1000.00,'2014-12-17',700,5),('348283329774155',1800.00,'2015-07-25',650,21),('348476787661668',11300.00,'2016-02-23',800,1),('348740507690709',1000.00,'2014-08-24',650,11),('371536125440616',1600.00,'2015-10-30',630,8),('374136060573161',3700.00,'2015-06-24',750,4),('374494451771957',1900.00,'2014-09-07',740,25),('379171565065628',13000.00,'2014-11-08',780,3),('4334517567232257',1900.00,'2014-09-12',750,16),('4520741985877972',4200.00,'2016-01-07',700,7),('4645207099011161',1800.00,'2015-10-08',720,6),('4698069325275719',1700.00,'2015-08-12',640,24),('4701197894942012',12000.00,'2015-11-07',790,22),('4937540713790809',1400.00,'2014-07-17',730,9),('5125420384574684',2300.00,'2015-01-23',700,17),('5129065032168296',1000.00,'2015-12-23',500,10),('5139240276589982',11300.00,'2014-06-06',690,14),('5174242996526888',19000.00,'2016-01-15',700,15),('5177949222736068',6000.00,'2014-10-02',700,2),('5381459681047122',6300.00,'2015-08-17',730,18),('5421954424069264',9200.00,'2015-05-18',750,19);
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `cust_joint_account`
--

DROP TABLE IF EXISTS `cust_joint_account`;
/*!50001 DROP VIEW IF EXISTS `cust_joint_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `cust_joint_account` (
  `Customer_id` tinyint NOT NULL,
  `Account_id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `cust_transactions`
--

DROP TABLE IF EXISTS `cust_transactions`;
/*!50001 DROP VIEW IF EXISTS `cust_transactions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `cust_transactions` (
  `Transaction_Count_For_Month` tinyint NOT NULL,
  `Customer_id` tinyint NOT NULL,
  `Customer_Name` tinyint NOT NULL,
  `Transaction_Month` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_branch`
--

DROP TABLE IF EXISTS `customer_branch`;
/*!50001 DROP VIEW IF EXISTS `customer_branch`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_branch` (
  `Branch_id` tinyint NOT NULL,
  `branch_name` tinyint NOT NULL,
  `state` tinyint NOT NULL,
  `NumberOfCustomers` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_credit_card`
--

DROP TABLE IF EXISTS `customer_credit_card`;
/*!50001 DROP VIEW IF EXISTS `customer_credit_card`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_credit_card` (
  `customer_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `Last_Name` tinyint NOT NULL,
  `Expiry_Date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `customer_credit_score`
--

DROP TABLE IF EXISTS `customer_credit_score`;
/*!50001 DROP VIEW IF EXISTS `customer_credit_score`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `customer_credit_score` (
  `customer_id` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `Last_Name` tinyint NOT NULL,
  `Loan_Amount_Taken` tinyint NOT NULL,
  `Loan_Type` tinyint NOT NULL,
  `Credit_Score` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `Customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Street_Address` varchar(50) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` char(2) NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Sex` char(1) NOT NULL,
  PRIMARY KEY (`Customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Bhagyashree','Kulkarni','1990-12-25','101 Halpine Road','Rockville','MD',20852,'prajakta@umd.edu','F'),(2,'Risa','Slater','2000-11-19','450 Depot Street','Potomac','MD',20854,'risa23_19@gmail.com','F'),(3,'Kuame','Swanson','1957-09-08','1124 Eget, Av.','DeQuincy','LA',70633,'Nam@gmail.com','M'),(4,'Hall','Valencia','2006-05-10','8327 Buckingham Drive','Bethesda','MD',20817,'valencia@yahoo.com','M'),(5,'Mariam','Holcomb','2000-10-16','698 3rd Street','Rehoboth','DE',19971,'holcob89@hotmail.com','F'),(6,'Lucas','Key','1990-12-25','1575 Pin Oak Drive','San Francisco','CA',94103,'lucas1575@hotmail.com','M'),(7,'Sade','Morrow','1981-07-27','225 Cedar Street','Seattle','WA',98104,'sade_morrow.98@yahoo.co.in','F'),(8,'Chaney','Hicks','1990-03-21','7164 Hill Street','Boston','MA',2109,'hicks123@gmail.com','M'),(9,'Dorian','Owens','1995-09-09','1621 6th Avenue','Minot','ND',58701,'owens2008@yahoo.co.in','M'),(10,'Aidan','Hines','1964-01-13','9809 Marshall Street','Billings','MT',59101,'aidan.hines12@gmail.com','M'),(11,'Alexa','Castaneda','1990-08-11','1000 8th Street',' South Halethorpe','MD',21227,'cas_alexa.15@rediff.com','F'),(12,'Rinah','Mullen','1950-08-31','777 4th Street West',' Oak Creek','WI',53154,'mul.rinah3108@hotmail.com','F'),(13,'Hall','Kaufman','1971-09-21','7235 Elmwood Avenue','Zanesville','OH',43701,'hallkauf1971@rediff.com','M'),(14,'Herrod','Massey','1969-12-17','856 Cedar Lane','Flat Rock','MI',48134,'mass@hotmail.com','M'),(15,'Nasim','Travis','2007-06-25','868 Catherine Street','Detroit','MI',48201,'travisnas09@gmail.com','M'),(16,'Vera','Mueller','1943-04-28','119 Smith Street','Phoenix','AZ',20854,'vera.mueller@gmail.com','F'),(17,'Rigel','Lancaster','1966-01-12','657 Briarwood Drive','Flushing','NY',11354,'lancaster_09@gmail.com','M'),(18,'Elaine','Hamilton','1992-03-01','939 Clinton Street','Tampa','FL',33602,'ela_1992@rediffmail.com','F'),(19,'Arden','Everett','1997-05-12','257 Water Street','Tampa','FL',33606,'arden_work@gmail.com','M'),(20,'Hilel','Mills','1968-09-10','754 Lexington Drive','Jamaica Plain','MA',2130,'mills007_09@yahoo.com','M'),(21,'Hilda','Lang','1981-05-29','543 Orchard Lane','San Diego','CA',92101,'lan_hilda.76@yahoo.co.in','F'),(22,'Ryan','Saunders','1967-03-30','647 Durham Court','Morgantown','WV',26508,'ryan.sanders_89@rediff.com','M'),(23,'Delilah','Carrillo','1982-05-22','754 2nd Street West',' Lake In The Hills','IL',60156,'carrillo@yahoo.com','F'),(24,'Lawrence','Valencia','1987-10-06','525 7th Avenue','Lake Worth','FL',33460,'law_cool@gmail.com','M'),(25,'Wang','Williamson','1980-08-07','666 5th Street West ','Nashville','TN',37205,'wang_09_1980@yahoo.co.in','M'),(26,'Lucas','Mills','1990-12-25','1575 Pin Oak Drive','San Francisco','CA',94103,'lucas@gmail.com','M'),(27,'Sade','Owens','1970-07-27','225 Cedar Street','Seattle','WA',98104,'sade_morrow@yahoo.co.in','F'),(28,'Chaney','Owens','1980-03-21','7111 Owen Hill Street','Boston','MA',2109,'hicksowens@gmail.com','M'),(29,'Dorian','ken','1990-09-09','1621 6th Avenue','Minot','ND',58701,'owens@yahoo.co.in','M'),(30,'dorothy','Hines','1960-01-13','9809 Marshall Street','Billings','MT',59101,'aidan120@gmail.com','M'),(31,'Alex','nomadi','1980-08-11','1000 8th Street',' South Halethorpe','MD',21227,'cas_alexa.15@rediff.com','F'),(32,'Renny','hines','1960-08-31','777 4th Street West',' Oak Creek','WI',53154,'mulwe8@hotmail.com','F'),(33,'flames','Kaufman','1971-09-21','7235 Elmwood Avenue','Zanesville','OH',43701,'hallkauf@rediff.com','M');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `Employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(45) NOT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Supervisor_id` int(10) unsigned DEFAULT NULL,
  `Level_of_Access` varchar(15) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Street_Address` varchar(50) NOT NULL,
  `City` varchar(25) NOT NULL,
  `State` char(2) NOT NULL,
  `Zipcode` int(11) NOT NULL,
  `Sex` char(1) NOT NULL,
  PRIMARY KEY (`Employee_id`),
  KEY `fk_Employees_Employees1_idx` (`Supervisor_id`),
  CONSTRAINT `fk_Employees_Employees1` FOREIGN KEY (`Supervisor_id`) REFERENCES `employees` (`Employee_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=107201 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (107181,'Aditya','Desai',NULL,'admin','1981-12-25','600 5th Avenue 908','Potomac','MD',20853,'M'),(107182,'Jeff','Hingman',NULL,'admin','1975-10-15','117-3385 Imperdiet Avenue','Bethesda','MD',20816,'M'),(107183,'Katherine','Pierce',NULL,'admin','1965-05-10','172-8938 NatoqueSt.','Tampa','FL',33605,'F'),(107184,'Ruby','Winchester',NULL,'admin','1975-06-13','101-8820 EratSt.','San Francisco','CA',94101,'F'),(107185,'Oliver','Queen',NULL,'admin','1978-07-08','857 Scelerisque Street','Boston','MA',2110,'M'),(107186,'Damon','Salvatore',NULL,'admin','1981-08-20','653-1798 Litora Rd.','Seattle','WA',98102,'M'),(107187,'Caroline','Forbes',NULL,'admin','1979-09-17','589-8607 Risus Rd.','Detroit','MI',48133,'F'),(107188,'Meghna','Desai',107181,'regular','1989-02-21','9308 Cherry Hill Rd 102','Potomac','MD',20853,'F'),(107189,'Anurag','Basu',107182,'regular','1991-06-25','857 Scelerisque Street','Bethesda','MD',20816,'M'),(107190,'Luke','Skywalker',107183,'regular','1982-07-25','9692 Elementum Rd.','Tampa','FL',33605,'M'),(107191,'Jane','Smith',107183,'regular','1983-08-25','6685 Vitae Ave','Tampa','FL',33604,'M'),(107192,'Chrissy','Gardner',107183,'regular','1985-09-25','7729 TinciduntSt.','Tampa','FL',33603,'F'),(107193,'Tom','Cruise',107184,'regular','1984-02-25','301-185 Vel Street','San Francisco','CA',94102,'M'),(107194,'Will','Gates',107184,'regular','1985-10-25','7500 Dolor, St.','San Francisco','CA',94103,'M'),(107195,'Jill','Smith',107185,'regular','1986-11-25','8628 Suspendisse Av.','Boston','MA',2110,'F'),(107196,'John','Snow',107185,'regular','1987-07-25','527-6077 Enim, Avenue','Boston','MA',2108,'M'),(107197,'Lily','Stark',107186,'regular','1988-04-25','7871 UtStreet','Seattle','WA',98102,'F'),(107198,'Tyrion','Lannister',107186,'regular','1991-03-25','5697 Pede, Av.','Seattle','WA',98103,'M'),(107199,'Jamie','Lannister',107187,'regular','1990-05-25','833 Dictum Rd.','Detroit','MI',48132,'M'),(107200,'Stana','Baratheon',107187,'regular','1982-07-25','2913 Velit Road','Detroit','MI',48131,'F');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `joint_account`
--

DROP TABLE IF EXISTS `joint_account`;
/*!50001 DROP VIEW IF EXISTS `joint_account`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `joint_account` (
  `Account_id` tinyint NOT NULL,
  `Customer_id` tinyint NOT NULL,
  `First_Name` tinyint NOT NULL,
  `Last_Name` tinyint NOT NULL,
  `Date_of_Birth` tinyint NOT NULL,
  `Street_Address` tinyint NOT NULL,
  `City` tinyint NOT NULL,
  `State` tinyint NOT NULL,
  `Zipcode` tinyint NOT NULL,
  `Email` tinyint NOT NULL,
  `Sex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `Loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `Duration_in_Years` decimal(4,2) NOT NULL,
  `Loan_Start_Date` date NOT NULL,
  `Interest_Rate` decimal(4,2) NOT NULL,
  `Loan_Amount_Taken` decimal(10,2) NOT NULL,
  `Loan_Amount_Repaid` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Loan_Type` varchar(45) NOT NULL,
  `Customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Loan_id`),
  KEY `fk_Loan_Customer1_idx` (`Customer_id`),
  CONSTRAINT `fk_Loan_Customer1` FOREIGN KEY (`Customer_id`) REFERENCES `customers` (`Customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4008 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
INSERT INTO `loan` VALUES (3988,5.00,'2012-12-12',10.25,25000.00,5000.00,'Education',1),(3989,5.00,'2012-02-12',12.25,28000.00,5000.00,'Home',2),(3990,6.00,'2013-02-11',11.75,20000.00,4000.00,'Personal',3),(3991,5.00,'2014-02-12',10.25,25000.00,3000.00,'Education',4),(3992,6.00,'2015-12-21',12.25,25000.00,5000.00,'Education',5),(3993,7.00,'2015-04-12',9.25,26000.00,4000.00,'Home',6),(3994,8.00,'2014-06-12',10.25,27000.00,5000.00,'Home',7),(3995,5.00,'2014-07-12',8.25,28000.00,8000.00,'Education',8),(3996,6.00,'2014-08-12',13.25,25000.00,10000.00,'Vehicle',8),(3997,10.00,'2014-09-12',13.25,28000.00,5000.00,'Education',10),(3998,3.00,'2013-10-12',9.75,20000.00,6000.00,'Education',11),(3999,2.00,'2013-11-12',10.25,21000.00,9000.00,'Home',12),(4000,4.00,'2013-02-12',10.75,22000.00,4000.00,'Education',13),(4001,5.00,'2013-03-12',12.25,23000.00,8000.00,'Home',13),(4002,7.00,'2012-03-12',11.75,29000.00,7000.00,'Education',15),(4003,5.00,'2012-04-12',13.75,25000.00,12000.00,'Vehicle',16),(4004,6.00,'2011-05-12',7.25,18000.00,2000.00,'Vehicle',17),(4005,8.00,'2011-06-12',12.75,30000.00,2000.00,'Education',17),(4006,9.00,'2011-06-12',11.75,28000.00,3000.00,'Home',17),(4007,10.00,'2011-07-12',10.50,25000.00,2000.00,'Vehicle',20);
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `loan_interest_rate`
--

DROP TABLE IF EXISTS `loan_interest_rate`;
/*!50001 DROP VIEW IF EXISTS `loan_interest_rate`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `loan_interest_rate` (
  `int_rate` tinyint NOT NULL,
  `first_name` tinyint NOT NULL,
  `Last_Name` tinyint NOT NULL,
  `Loan_Amount_Taken` tinyint NOT NULL,
  `Loan_Type` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `branch_emp_super`
--

/*!50001 DROP TABLE IF EXISTS `branch_emp_super`*/;
/*!50001 DROP VIEW IF EXISTS `branch_emp_super`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_emp_super` AS select `branchemp`.`Branch_id` AS `Branch_id`,`branch`.`Branch_Name` AS `Branch_Name`,`branchemp`.`Start_Date` AS `Start_Date`,`emp`.`Employee_id` AS `Employee_id`,`emp`.`Employee_Name` AS `Employee_Name`,`emp`.`Supervisor_id` AS `Supervisor_id`,`emp`.`Manager_Name` AS `Manager_Name` from ((`branch_employees` `branchemp` join `branches` `branch`) join `branch_emp_super_sub` `emp`) where (isnull(`branchemp`.`End_Date`) and (`branchemp`.`Employee_id` = `emp`.`Employee_id`) and (`branchemp`.`Branch_id` = `branch`.`Branch_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_emp_super_sub`
--

/*!50001 DROP TABLE IF EXISTS `branch_emp_super_sub`*/;
/*!50001 DROP VIEW IF EXISTS `branch_emp_super_sub`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_emp_super_sub` AS select `e1`.`Employee_id` AS `Employee_id`,concat(`e1`.`First_Name`,' ',`e1`.`Last_Name`) AS `Employee_Name`,`e1`.`Supervisor_id` AS `Supervisor_id`,concat(`e2`.`First_Name`,' ',`e2`.`Last_Name`) AS `Manager_Name` from (`employees` `e1` join `employees` `e2` on((`e1`.`Supervisor_id` = `e2`.`Employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `branch_total_amount`
--

/*!50001 DROP TABLE IF EXISTS `branch_total_amount`*/;
/*!50001 DROP VIEW IF EXISTS `branch_total_amount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `branch_total_amount` AS select `br`.`Branch_id` AS `Branch_id`,`br`.`Branch_Name` AS `branch_name`,`br`.`City` AS `City`,sum((case when (`bt`.`Transaction_Type` = 'credit') then `bt`.`Amount` else (`bt`.`Amount` * -(1)) end)) AS `amount` from ((((`banking_transactions` `bt` join `customers` `cu`) join `account_customers` `ac`) join `accounts` `acc`) join `branches` `br`) where ((`bt`.`Customer_id` = `cu`.`Customer_id`) and (`cu`.`Customer_id` = `ac`.`Customer_id`) and (`ac`.`Account_id` = `acc`.`Account_id`) and (`acc`.`Branch_id` = `br`.`Branch_id`)) group by `br`.`Branch_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cust_joint_account`
--

/*!50001 DROP TABLE IF EXISTS `cust_joint_account`*/;
/*!50001 DROP VIEW IF EXISTS `cust_joint_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cust_joint_account` AS select distinct `first`.`Customer_id` AS `Customer_id`,`first`.`Account_id` AS `Account_id` from (`account_customers` `first` join `account_customers` `second`) where ((`first`.`Account_id` = `second`.`Account_id`) and (`first`.`Customer_id` <> `second`.`Customer_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cust_transactions`
--

/*!50001 DROP TABLE IF EXISTS `cust_transactions`*/;
/*!50001 DROP VIEW IF EXISTS `cust_transactions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cust_transactions` AS select count(0) AS `Transaction_Count_For_Month`,`cust`.`Customer_id` AS `Customer_id`,concat(`cust`.`First_Name`,' ',`cust`.`Last_Name`) AS `Customer_Name`,monthname(`trans`.`Transaction_Date`) AS `Transaction_Month` from ((`cc_transactions` `trans` join `credit_cards` `cc`) join `customers` `cust`) where ((`trans`.`CC_Number` = `cc`.`CC_number`) and (`cc`.`Customer_id` = `cust`.`Customer_id`)) group by month(`trans`.`Transaction_Date`),`cust`.`Customer_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_branch`
--

/*!50001 DROP TABLE IF EXISTS `customer_branch`*/;
/*!50001 DROP VIEW IF EXISTS `customer_branch`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_branch` AS select `br`.`Branch_id` AS `Branch_id`,`br`.`Branch_Name` AS `branch_name`,`br`.`State` AS `state`,count(distinct `cu`.`Customer_id`) AS `NumberOfCustomers` from (((`customers` `cu` join `account_customers` `ac`) join `accounts` `acc`) join `branches` `br`) where ((`cu`.`Customer_id` = `ac`.`Customer_id`) and (`ac`.`Account_id` = `acc`.`Account_id`) and (`acc`.`Branch_id` = `br`.`Branch_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_credit_card`
--

/*!50001 DROP TABLE IF EXISTS `customer_credit_card`*/;
/*!50001 DROP VIEW IF EXISTS `customer_credit_card`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_credit_card` AS select `cu`.`Customer_id` AS `customer_id`,`cu`.`First_Name` AS `first_name`,`cu`.`Last_Name` AS `Last_Name`,`cc`.`Expiry_Date` AS `Expiry_Date` from (`customers` `cu` join `credit_cards` `cc` on((`cu`.`Customer_id` = `cc`.`Customer_id`))) where (`cc`.`Expiry_Date` between '2015-05-20' and '2016-05-20') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_credit_score`
--

/*!50001 DROP TABLE IF EXISTS `customer_credit_score`*/;
/*!50001 DROP VIEW IF EXISTS `customer_credit_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_credit_score` AS select `cu`.`Customer_id` AS `customer_id`,`cu`.`First_Name` AS `first_name`,`cu`.`Last_Name` AS `Last_Name`,`lo`.`Loan_Amount_Taken` AS `Loan_Amount_Taken`,`lo`.`Loan_Type` AS `Loan_Type`,`cc`.`Credit_Score` AS `Credit_Score` from ((`customers` `cu` join `loan` `lo` on((`cu`.`Customer_id` = `lo`.`Customer_id`))) join `credit_cards` `cc` on((`cu`.`Customer_id` = `cc`.`Customer_id`))) where (`cc`.`Credit_Score` > 600) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `joint_account`
--

/*!50001 DROP TABLE IF EXISTS `joint_account`*/;
/*!50001 DROP VIEW IF EXISTS `joint_account`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `joint_account` AS select `cust_acc`.`Account_id` AS `Account_id`,`cust`.`Customer_id` AS `Customer_id`,`cust`.`First_Name` AS `First_Name`,`cust`.`Last_Name` AS `Last_Name`,`cust`.`Date_of_Birth` AS `Date_of_Birth`,`cust`.`Street_Address` AS `Street_Address`,`cust`.`City` AS `City`,`cust`.`State` AS `State`,`cust`.`Zipcode` AS `Zipcode`,`cust`.`Email` AS `Email`,`cust`.`Sex` AS `Sex` from (`customers` `cust` join `cust_joint_account` `cust_acc`) where (`cust_acc`.`Customer_id` = `cust`.`Customer_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `loan_interest_rate`
--

/*!50001 DROP TABLE IF EXISTS `loan_interest_rate`*/;
/*!50001 DROP VIEW IF EXISTS `loan_interest_rate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `loan_interest_rate` AS select avg(`lo`.`Interest_Rate`) AS `int_rate`,`cu`.`First_Name` AS `first_name`,`cu`.`Last_Name` AS `Last_Name`,`lo`.`Loan_Amount_Taken` AS `Loan_Amount_Taken`,`lo`.`Loan_Type` AS `Loan_Type` from (`customers` `cu` join `loan` `lo` on((`cu`.`Customer_id` = `lo`.`Customer_id`))) group by `lo`.`Loan_Type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-12 15:28:34
