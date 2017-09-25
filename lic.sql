-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: DBMS
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.16.04.1

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

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_uname` varchar(15) DEFAULT NULL,
  `a_passwd` varchar(15) DEFAULT NULL,
  `a_fname` varchar(15) DEFAULT NULL,
  `a_lname` varchar(15) DEFAULT NULL,
  `a_phone` varchar(10) DEFAULT NULL,
  `a_email` varchar(30) DEFAULT NULL,
  `a_addr` varchar(90) DEFAULT NULL,
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`agent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,'Jay','jay123','Jay','Thanvi','8975871151','jay7@gmail.com','Shegaon','images/agent2.jpg'),(2,'Soham','soham123','Soham','Ray','8975871444','iamray@gmail.com','S-21, Kubera Colony,<br> NIBM road, Kondhwa, <br>Pune- 411048','images/agent1.jpg'),(3,'Sharan','sharan123','Sharan','Rajani','9875871251','sharan7@gmail.com','Pune','images/agent3.jpg'),(4,'Shreyas','shreyas123','Shreyas','Waghmare','9545126354','iamshreyas4@gmail.com','Bhusawal','images/agent4.jpg');
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_policy`
--

DROP TABLE IF EXISTS `agent_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_policy` (
  `agent_id` int(11) NOT NULL,
  `pol_no` int(11) NOT NULL,
  PRIMARY KEY (`agent_id`,`pol_no`),
  KEY `pol_no` (`pol_no`),
  CONSTRAINT `agent_policy_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  CONSTRAINT `agent_policy_ibfk_2` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_policy`
--

LOCK TABLES `agent_policy` WRITE;
/*!40000 ALTER TABLE `agent_policy` DISABLE KEYS */;
INSERT INTO `agent_policy` VALUES (1,897456123),(2,897456124),(3,897456125),(4,897456126);
/*!40000 ALTER TABLE `agent_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_uname` varchar(30) NOT NULL,
  `c_passwd` varchar(30) NOT NULL,
  `c_email` varchar(30) NOT NULL,
  `c_phone` varchar(10) NOT NULL,
  `c_dob` date DEFAULT NULL,
  `c_addr` varchar(90) DEFAULT NULL,
  `c_fname` varchar(15) NOT NULL,
  `c_mname` varchar(15) DEFAULT NULL,
  `c_lname` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Akash','akash123','akash@gmail.com','9422926454','1996-05-25','Katraj','Akash','Avinash','Kathole'),(2,'Bhushan','bhushan123','bhushan@gmail.com','7787945124','1997-04-14','Ambegaon','Bhushan','Amey','Gujrathi'),(3,'Chaitraj','chaitraj123','chaitraj@gmail.com','7787777124','1998-12-21','Chinchwad','Chaitraj','Vishal','Mete'),(4,'Dinesh','dines123','dinesh@gmail.com','8484339026','1997-09-11','Shaniwarwada','Dinesh','Lalit','Bohra'),(5,'Dilip','dilip123','dilip@gmail.com','8989897544','1998-12-05','Thane','Dilip','Vishwanath','Joshi');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_agent_policy`
--

DROP TABLE IF EXISTS `customer_agent_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_agent_policy` (
  `cust_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `pol_no` int(11) NOT NULL,
  PRIMARY KEY (`cust_id`,`agent_id`,`pol_no`),
  KEY `cust_id` (`cust_id`),
  KEY `agent_id` (`agent_id`),
  KEY `pol_no` (`pol_no`),
  CONSTRAINT `agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  CONSTRAINT `cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `customer_agent_policy_ibfk_1` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_agent_policy`
--

LOCK TABLES `customer_agent_policy` WRITE;
/*!40000 ALTER TABLE `customer_agent_policy` DISABLE KEYS */;
INSERT INTO `customer_agent_policy` VALUES (1,1,897456123),(1,2,897456126),(2,2,897456123),(2,3,897456124),(3,3,897456125);
/*!40000 ALTER TABLE `customer_agent_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_policy`
--

DROP TABLE IF EXISTS `customer_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_policy` (
  `cust_id` int(11) NOT NULL,
  `pol_no` int(11) NOT NULL,
  `prem_sdate` date DEFAULT NULL,
  `prem_edate` date DEFAULT NULL,
  `prem_pdate` date DEFAULT NULL,
  PRIMARY KEY (`cust_id`,`pol_no`),
  KEY `pol_no` (`pol_no`),
  CONSTRAINT `customer_policy_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `customer_policy_ibfk_2` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_policy`
--

LOCK TABLES `customer_policy` WRITE;
/*!40000 ALTER TABLE `customer_policy` DISABLE KEYS */;
INSERT INTO `customer_policy` VALUES (1,897456123,'2017-09-12','2018-09-12','2017-10-05'),(1,897456126,'2017-02-20','2019-02-20','2017-09-25'),(2,897456123,'2017-02-25','2019-02-20','2017-10-26'),(2,897456124,'2017-01-01','2018-03-01','2017-09-05'),(3,897456125,'2017-02-19','2017-11-19','2017-10-05');
/*!40000 ALTER TABLE `customer_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `trans_no` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amt` decimal(11,2) DEFAULT NULL,
  `pol_no` int(11) NOT NULL,
  `commision` int(11) DEFAULT NULL,
  PRIMARY KEY (`trans_no`),
  KEY `cust_id` (`cust_id`),
  KEY `agent_id` (`agent_id`),
  KEY `pol_no` (`pol_no`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (9,1,2,'2017-09-25',52500.00,897456126,1500),(13,1,1,NULL,NULL,897456123,NULL),(14,1,2,'2017-09-25',52500.00,897456126,1500);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger p_date
after insert on payment
for each row
begin 

update customer_policy set prem_pdate =(select DATE_ADD(prem_pdate, INTERVAL 1 MONTH)) where customer_policy.cust_id=NEW.cust_id AND customer_policy.pol_no=NEW.pol_no;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `policy`
--

DROP TABLE IF EXISTS `policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy` (
  `pol_no` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(30) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `late_fee` int(11) DEFAULT NULL,
  `premium` int(11) DEFAULT NULL,
  `commision` int(11) DEFAULT NULL,
  PRIMARY KEY (`pol_no`)
) ENGINE=InnoDB AUTO_INCREMENT=897456127 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy`
--

LOCK TABLES `policy` WRITE;
/*!40000 ALTER TABLE `policy` DISABLE KEYS */;
INSERT INTO `policy` VALUES (897456123,'Jeevan Utkarsh',12,250,5000,5),(897456124,'Jeevan Anand',15,500,10000,5),(897456125,'Jeevan Pragati',9,150,1000,7),(897456126,'Jeevan Lakshaya',36,1000,50000,3);
/*!40000 ALTER TABLE `policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_description`
--

DROP TABLE IF EXISTS `policy_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_description` (
  `p_name` varchar(30) NOT NULL,
  `plan_type` varchar(40) DEFAULT NULL,
  `entry_age` varchar(20) DEFAULT NULL,
  `premium` int(11) DEFAULT NULL,
  `policy_duration` int(5) DEFAULT NULL,
  `medical_exam` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `descp` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`p_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_description`
--

LOCK TABLES `policy_description` WRITE;
/*!40000 ALTER TABLE `policy_description` DISABLE KEYS */;
INSERT INTO `policy_description` VALUES ('Jeevan Anand','Participation Endowment Plan','18-50 years',10000,75,'Required','Discontinued','<p style=\"text-align: justify;\"><strong>Salient Features</strong>\r\n                                        </p>\r\n                                        <ul style=\"text-align: justify;\">\r\n                                            <li><strong>Immediate Annuity Plan</strong>&nbsp;– Annuity starts as early as the next month</li>\r\n                                            <li><strong>Single Premium Plan</strong>&nbsp;– “Pay Once, Enjoy Forever”</li>\r\n                                            <li><strong>Minimum purchase price</strong>&nbsp;is Rs.1, 00,000 for offline and Rs.1, 50,000 for online purchase. There is no maximum limit on purchase or annuity.</li>\r\n                                            <li><strong>More Annuity Options</strong>&nbsp;– 7 Options of Annuities to choose from</li>\r\n                                            <li><strong>Annuity payable for life</strong>&nbsp;at a uniform rate till the life assured is alive.</li>\r\n                                            <li><strong>Annuity payable for 5, 10, 15 or 20 years</strong>&nbsp;no matter if the insured person is alive or not, and thereafter as long as the annuitant is alive.</li>\r\n                                            <li><strong>Annuity for life with return of purchase price on death</strong>&nbsp;of the annuitant.</li>\r\n                                            <li><strong>Increasing Annuity&nbsp;</strong>in which the pension is paid till the life assured is alive at an increasing rate of 3% p.a.</li>\r\n                                            <li><strong>Annuity for life with a provision of 50% of the annuity</strong>&nbsp;payable to spouse during his/her lifetime on death of the annuitant.</li>\r\n                                            <li><strong>Annuity for life with a provision of 100% of the annuity</strong>&nbsp;payable to spouse during his/her life time on death of annuitant. The purchase price will be returned on the death of last survivor.</li>\r\n                                            <li><strong>Annuity for life with a provision for 100% of the annuity</strong>&nbsp;payable to the spouse of the annuitant for life on death of the annuitant, with return of purchase price on the death of last survivor</li>\r\n                                            <li><strong>Covers broad range of age</strong>&nbsp;<strong>group</strong>&nbsp;– From 30 years to 85 years</li>\r\n                                            <li><strong>Maturity Benefit</strong>&nbsp;– No maturity benefits are available in this policy.</li>\r\n                                            <li><strong>No medical examination</strong>&nbsp;is required.</li>\r\n                                            <li><strong>Income Tax Benefit</strong>&nbsp;– Although, premiums paid under this policy are exempted from tax under section 80C, but the pension received will be taxable.</li>\r\n                                            <li><strong>No surrender value&nbsp;</strong>shall be payable under this policy.</li>\r\n                                            <li><strong>No loan available&nbsp;</strong>under this plan.</li>\r\n                                            <li><strong>Incentive for online</strong>&nbsp;– Rebate of 1% by way of increase in the basic annuity rate will be available.\r\n                                                <br>\r\n                                                <br>\r\n                                            </li>\r\n                                        </ul>'),('Jeevan Lakshaya','With-Profit Endowment Assurance Plan','18-50',50000,65,'Not Required','Continued','<h2>Key Features and Highlights of LIC Jeevan Lakshya</h2>\r\n\r\n<p>The Jeevan Lakshya plan’s salient features can be mentioned as follows -</p>\r\n<ul>\r\n    <li>Sum assured</li>\r\n    <ul>\r\n        <li>Minimum - Rs. 1,00,000</li>\r\n        <li>Maximum - No limit</li>\r\n        <li>Multiples - The basic sum assured can be in multiples of Rs. 10,000 only</li>\r\n    </ul>\r\n    <li>Policy term - 13 to 25 years</li>\r\n    <li>Premium payment modes - Premiums for the policy can be paid in yearly, half-yearly, quarterly and monthly periods and an option of Electronic Clearing Service (ECS) is also available, wherein it facilitates an easier option to pay the premiums</li>\r\n    <li>Premium payment term - The premium paying term is 3 years less than the policy term, irrespective of whatever term the policy is for</li>\r\n    <li>Age of entry</li>\r\n    <ul>\r\n        <li>Minimum - 18 years (completed)</li>\r\n        <li>Maximum - 50 years (nearest birthday)</li>\r\n    </ul>\r\n    <li>Maximum maturity age - 65 years (nearest birthday)</li>\r\n    <li>Bonuses - Being a With-Profits Endowment Assurance plan, this policy garners profits made by the Life Insurance Corporation of India through the Simple Reversionary Bonus and Final Additional Bonus (if applicable) and these are paid out at the end of the maturity period</li>\r\n    <li>Optional riders - The policy can have two optional riders</li>\r\n    <ul>\r\n        <li>LIC Accidental Death and Disability Benefit Rider</li>\r\n        <li>LIC New Term Assurance Rider</li>\r\n    </ul>\r\n</ul>\r\n'),('Jeevan Pragati','Endowment Plan','18-65 years',1000,12,'Required','DisContinued','N'),('Jeevan Utkarsh','-','6-47 years',7500,12,'NotRequired','Continued','<h2>Key Features</h2>\r\n<ul>\r\n	<li>High Risk Cover (10 times of Single Premium)</li>\r\n	<li>5,10 or 15 years settlement option</li>\r\n	<li>Premium  paid is eligible for rebate under 80(C)</li>\r\n	<li>Maturity  amount will be tax free under 10(10D)</li>\r\n</ul>\r\n\r\n<h2>Plan Parameters</h2>\r\n	<table>\r\n		<tr>\r\n			<th>Age at Entry</th><td>6 Years (Completed)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Maximum Age at Entry</th>\r\n			<td>47 (Nearest Birthday)<br /> <a target=\"_blank\" href=\"http://www.insurance21.in/lic-age-calculator.php\">Calculate your Age</a></td>\r\n		</tr>\r\n		\r\n		<tr>\r\n		<th>Premium Paying Mode</th>\r\n		<td>One Time (Single Premium)<br /><a href=\"http://www.insurance21.in/premium-calculator/lic-jeevan-utkarsh-plan-846.html\">Calculate Premium</a></td>\r\n		</tr>\r\n		<tr>\r\n  		<th>Policy Term</th>\r\n  			<td>12 Years</td>\r\n	  </tr><tr><th>Sum Assured</th>\r\n			<td>75,000 and above</td>\r\n		</tr>\r\n		<tr>\r\n		  <th>Surrender</th>\r\n		  <td>70% of Single Premium in 1st Policy Year <br />\r\n		  90% of Single Premium from 2nd Policy Year</td>\r\n		</tr>\r\n		<tr>\r\n		  <th>Loan</th>\r\n		  <td>Can be Availed after 3 Months </td>\r\n		</tr>\r\n</table>\r\n<br />\r\n<h2>Maturity Benefits</h2>\r\n<ul>\r\n<li>On survival of policy holder i.e. completion of 12 year term, maturity will be <b>Sum Assured</b> + <b>Loyalty Addition</b>.</li>\r\n</ul>\r\n\r\n<h2>Death benefits</h2>\r\n<ul>\r\n<li>On death during <b>First Five Years</b> of the policy:</li>\r\n	<ul>\r\n	<li>\r\n	If Death happens <b>before 8 years of Age</b>, then death claim amount will be single premium (excluding Rider premium and GST) without any interest. \r\n	</li>\r\n	<li>\r\n	If Death happens <b>after 8 years of age</b>, then death claim amount will be 10 times of single premium paid (excluding Rider premium and GST). \r\n	</li>\r\n	</ul>\r\n</ul>\r\n<ul>\r\n<li>On death after 5 years of the policy and before maturity:</li>\r\n	<ul>\r\n	<li>Death Claim amount will be 10 times of single premium paid (excluding Rider premium and GST) + Loyalty Addition.</li>\r\n	</ul>\r\n</ul>\r\n<p><strong>Note: </strong>8 Years is minimum age of risk commencement under this policy and Loyalty Addition is applicable only after 5 years of successful policy term.</p>  \r\n<div>\r\n<h2>Jeevan Utkarsh Policy (846) with an Example</h2>\r\n<div>\r\n	<div>\r\n		<p>Let\'s take and example of Jeevan Utkarsh policy with following details.</p>\r\n		<table>\r\n		<tr><td><strong>Purchase Year</strong></td><td>2017</td></tr>\r\n		<tr><td><strong>Age</strong></td><td>25 Years</td></tr>\r\n		<tr><td><strong>Basic Sum Assured</strong></td><td>5,00,000</td></tr>\r\n		<tr><td><strong>Premium Paying Term</strong></td><td>1</td></tr>\r\n		<tr><td><strong>Policy Term</strong></td><td>12</td></tr>\r\n		<tr><td><strong>Premium of Basic Plan (without GST)</strong></td><td>2,62,450</td></tr>\r\n		<tr><td><strong>Premium of Basic Plan with AD &amp; DB Rider (without GST)</strong></td><td>2,67,000</td></tr>\r\n	</table><br />\r\n	</div></div></div>');
/*!40000 ALTER TABLE `policy_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 18:13:38
