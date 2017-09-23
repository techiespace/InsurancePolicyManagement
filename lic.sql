-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 23, 2017 at 12:10 PM
-- Server version: 5.7.19-0ubuntu0.17.04.1
-- PHP Version: 7.0.22-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lic`
--

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL,
  `a_uname` varchar(15) DEFAULT NULL,
  `a_passwd` varchar(15) DEFAULT NULL,
  `a_fname` varchar(15) DEFAULT NULL,
  `a_lname` varchar(15) DEFAULT NULL,
  `a_phone` varchar(10) DEFAULT NULL,
  `a_email` varchar(30) DEFAULT NULL,
  `a_addr` varchar(90) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent`
--

INSERT INTO `agent` (`agent_id`, `a_uname`, `a_passwd`, `a_fname`, `a_lname`, `a_phone`, `a_email`, `a_addr`) VALUES
(1, 'Jay', 'jay123', 'Jay', 'Thanvi', '8975871151', 'jay7@gmail.com', 'Shegaon'),
(2, 'Soham', 'soham123', 'Soham', 'Ray', '8975871444', 'iamray@gmail.com', 'Pune'),
(3, 'Sharan', 'sharan123', 'Sharan', 'Rajani', '9875871251', 'sharan7@gmail.com', 'Pune'),
(4, 'Shreyas', 'shreyas123', 'Shreyas', 'Waghmare', '9545126354', 'iamshreyas4@gmail.com', 'Bhusawal');

-- --------------------------------------------------------

--
-- Table structure for table `agent_policy`
--

CREATE TABLE `agent_policy` (
  `agent_id` int(11) NOT NULL,
  `pol_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agent_policy`
--

INSERT INTO `agent_policy` (`agent_id`, `pol_no`) VALUES
(1, 897456123),
(2, 897456124),
(3, 897456125),
(4, 897456126);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `c_uname` varchar(30) NOT NULL,
  `c_passwd` varchar(30) NOT NULL,
  `c_email` varchar(30) NOT NULL,
  `c_phone` varchar(10) NOT NULL,
  `c_dob` date DEFAULT NULL,
  `c_addr` varchar(90) DEFAULT NULL,
  `c_fname` varchar(15) NOT NULL,
  `c_mname` varchar(15) DEFAULT NULL,
  `c_lname` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `c_uname`, `c_passwd`, `c_email`, `c_phone`, `c_dob`, `c_addr`, `c_fname`, `c_mname`, `c_lname`) VALUES
(1, 'Akash', 'akash123', 'akash@gmail.com', '9422926454', '1996-05-25', 'Katraj', 'Akash', 'Avinash', 'Kathole'),
(2, 'Bhushan', 'bhushan123', 'bhushan@gmail.com', '7787945124', '1997-04-14', 'Ambegaon', 'Bhushan', 'Amey', 'Gujrathi'),
(3, 'Chaitraj', 'chaitraj123', 'chaitraj@gmail.com', '7787777124', '1998-12-21', 'Chinchwad', 'Chaitraj', 'Vishal', 'Mete'),
(4, 'Dinesh', 'dines123', 'dinesh@gmail.com', '8484339026', '1997-09-11', 'Shaniwarwada', 'Dinesh', 'Lalit', 'Bohra'),
(5, 'Dilip', 'dilip123', 'dilip@gmail.com', '8989897544', '1998-12-05', 'Thane', 'Dilip', 'Vishwanath', 'Joshi');

-- --------------------------------------------------------

--
-- Table structure for table `customer_agent`
--

CREATE TABLE `customer_agent` (
  `cust_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_agent`
--

INSERT INTO `customer_agent` (`cust_id`, `agent_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer_policy`
--

CREATE TABLE `customer_policy` (
  `cust_id` int(11) NOT NULL,
  `pol_no` int(11) NOT NULL,
  `prem_sdate` date DEFAULT NULL,
  `prem_edate` date DEFAULT NULL,
  `prem_pdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_policy`
--

INSERT INTO `customer_policy` (`cust_id`, `pol_no`, `prem_sdate`, `prem_edate`, `prem_pdate`) VALUES
(1, 897456123, '2017-09-12', '2018-09-12', '2017-10-05'),
(1, 897456126, '2017-02-20', '2019-02-20', '2017-09-20'),
(2, 897456123, '2017-02-25', '2019-02-20', '2017-10-25'),
(2, 897456124, '2017-01-01', '2018-03-01', '2017-09-05'),
(3, 897456125, '2017-02-19', '2017-11-19', '2017-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `trans_no` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `amt` int(11) NOT NULL,
  `pol_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`trans_no`, `cust_id`, `agent_id`, `date`, `amt`, `pol_no`) VALUES
(1, 1, 1, '2017-08-01', 5000, 897456123),
(2, 2, 2, '2017-08-10', 10000, 897456124),
(3, 3, 3, '2017-07-21', 1000, 897456125),
(4, 1, 1, '2017-09-01', 5000, 897456123),
(5, 2, 2, '2017-09-10', 10000, 897456124),
(6, 3, 3, '2017-08-21', 1000, 897456125);

-- --------------------------------------------------------

--
-- Table structure for table `policy`
--

CREATE TABLE `policy` (
  `pol_no` int(11) NOT NULL,
  `p_name` varchar(30) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `late_fee` int(11) DEFAULT NULL,
  `premium` int(11) DEFAULT NULL,
  `commision` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy`
--

INSERT INTO `policy` (`pol_no`, `p_name`, `duration`, `late_fee`, `premium`, `commision`) VALUES
(897456123, 'Jeevan Utkarsh', 12, 250, 5000, 250),
(897456124, 'Jeevan Anand', 15, 500, 10000, 500),
(897456125, 'Jeevan Pragati', 9, 150, 1000, 100),
(897456126, 'Jeevan Lakshaya', 36, 1000, 50000, 1250);

-- --------------------------------------------------------

--
-- Table structure for table `policy_description`
--

CREATE TABLE `policy_description` (
  `p_name` varchar(30) NOT NULL,
  `plan_type` varchar(40) DEFAULT NULL,
  `entry_age` varchar(20) DEFAULT NULL,
  `premium` int(11) DEFAULT NULL,
  `policy_duration` int(5) DEFAULT NULL,
  `medical_exam` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `descp` varchar(10000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `policy_description`
--

INSERT INTO `policy_description` (`p_name`, `plan_type`, `entry_age`, `premium`, `policy_duration`, `medical_exam`, `status`, `descp`) VALUES
('Jeevan Anand', 'Participation Endowment Plan', '18-50 years', 10000, 75, 'Required', 'Discntinued', '<p style=\"text-align: justify;\"><strong>Salient Features</strong>\r\n                                        </p>\r\n                                        <ul style=\"text-align: justify;\">\r\n                                            <li><strong>Immediate Annuity Plan</strong>&nbsp;– Annuity starts as early as the next month</li>\r\n                                            <li><strong>Single Premium Plan</strong>&nbsp;– “Pay Once, Enjoy Forever”</li>\r\n                                            <li><strong>Minimum purchase price</strong>&nbsp;is Rs.1, 00,000 for offline and Rs.1, 50,000 for online purchase. There is no maximum limit on purchase or annuity.</li>\r\n                                            <li><strong>More Annuity Options</strong>&nbsp;– 7 Options of Annuities to choose from</li>\r\n                                            <li><strong>Annuity payable for life</strong>&nbsp;at a uniform rate till the life assured is alive.</li>\r\n                                            <li><strong>Annuity payable for 5, 10, 15 or 20 years</strong>&nbsp;no matter if the insured person is alive or not, and thereafter as long as the annuitant is alive.</li>\r\n                                            <li><strong>Annuity for life with return of purchase price on death</strong>&nbsp;of the annuitant.</li>\r\n                                            <li><strong>Increasing Annuity&nbsp;</strong>in which the pension is paid till the life assured is alive at an increasing rate of 3% p.a.</li>\r\n                                            <li><strong>Annuity for life with a provision of 50% of the annuity</strong>&nbsp;payable to spouse during his/her lifetime on death of the annuitant.</li>\r\n                                            <li><strong>Annuity for life with a provision of 100% of the annuity</strong>&nbsp;payable to spouse during his/her life time on death of annuitant. The purchase price will be returned on the death of last survivor.</li>\r\n                                            <li><strong>Annuity for life with a provision for 100% of the annuity</strong>&nbsp;payable to the spouse of the annuitant for life on death of the annuitant, with return of purchase price on the death of last survivor</li>\r\n                                            <li><strong>Covers broad range of age</strong>&nbsp;<strong>group</strong>&nbsp;– From 30 years to 85 years</li>\r\n                                            <li><strong>Maturity Benefit</strong>&nbsp;– No maturity benefits are available in this policy.</li>\r\n                                            <li><strong>No medical examination</strong>&nbsp;is required.</li>\r\n                                            <li><strong>Income Tax Benefit</strong>&nbsp;– Although, premiums paid under this policy are exempted from tax under section 80C, but the pension received will be taxable.</li>\r\n                                            <li><strong>No surrender value&nbsp;</strong>shall be payable under this policy.</li>\r\n                                            <li><strong>No loan available&nbsp;</strong>under this plan.</li>\r\n                                            <li><strong>Incentive for online</strong>&nbsp;– Rebate of 1% by way of increase in the basic annuity rate will be available.\r\n                                                <br>\r\n                                                <br>\r\n                                            </li>\r\n                                        </ul>'),
('Jeevan Lakshaya', 'With-Profit Endowment Assurance Plan', '18-50', 50000, 65, 'Not Required', 'Continued', 'N'),
('Jeevan Pragati', 'Endowment Plan', '18-65 years', 1000, 12, 'Required', 'DisContinued', 'N'),
('Jeevan Utkarsh', '-', '6-47 years', 7500, 12, 'NotRequired', 'Continued', '<h2>Key Features</h2>\r\n<ul>\r\n	<li>High Risk Cover (10 times of Single Premium)</li>\r\n	<li>5,10 or 15 years settlement option</li>\r\n	<li>Premium  paid is eligible for rebate under 80(C)</li>\r\n	<li>Maturity  amount will be tax free under 10(10D)</li>\r\n</ul>\r\n\r\n<h2>Plan Parameters</h2>\r\n	<table>\r\n		<tr>\r\n			<th>Age at Entry</th><td>6 Years (Completed)</td>\r\n		</tr>\r\n		<tr>\r\n			<th>Maximum Age at Entry</th>\r\n			<td>47 (Nearest Birthday)<br /> <a target=\"_blank\" href=\"http://www.insurance21.in/lic-age-calculator.php\">Calculate your Age</a></td>\r\n		</tr>\r\n		\r\n		<tr>\r\n		<th>Premium Paying Mode</th>\r\n		<td>One Time (Single Premium)<br /><a href=\"http://www.insurance21.in/premium-calculator/lic-jeevan-utkarsh-plan-846.html\">Calculate Premium</a></td>\r\n		</tr>\r\n		<tr>\r\n  		<th>Policy Term</th>\r\n  			<td>12 Years</td>\r\n	  </tr><tr><th>Sum Assured</th>\r\n			<td>75,000 and above</td>\r\n		</tr>\r\n		<tr>\r\n		  <th>Surrender</th>\r\n		  <td>70% of Single Premium in 1st Policy Year <br />\r\n		  90% of Single Premium from 2nd Policy Year</td>\r\n		</tr>\r\n		<tr>\r\n		  <th>Loan</th>\r\n		  <td>Can be Availed after 3 Months </td>\r\n		</tr>\r\n</table>\r\n<br />\r\n<h2>Maturity Benefits</h2>\r\n<ul>\r\n<li>On survival of policy holder i.e. completion of 12 year term, maturity will be <b>Sum Assured</b> + <b>Loyalty Addition</b>.</li>\r\n</ul>\r\n\r\n<h2>Death benefits</h2>\r\n<ul>\r\n<li>On death during <b>First Five Years</b> of the policy:</li>\r\n	<ul>\r\n	<li>\r\n	If Death happens <b>before 8 years of Age</b>, then death claim amount will be single premium (excluding Rider premium and GST) without any interest. \r\n	</li>\r\n	<li>\r\n	If Death happens <b>after 8 years of age</b>, then death claim amount will be 10 times of single premium paid (excluding Rider premium and GST). \r\n	</li>\r\n	</ul>\r\n</ul>\r\n<ul>\r\n<li>On death after 5 years of the policy and before maturity:</li>\r\n	<ul>\r\n	<li>Death Claim amount will be 10 times of single premium paid (excluding Rider premium and GST) + Loyalty Addition.</li>\r\n	</ul>\r\n</ul>\r\n<p><strong>Note: </strong>8 Years is minimum age of risk commencement under this policy and Loyalty Addition is applicable only after 5 years of successful policy term.</p>  \r\n<div>\r\n<h2>Jeevan Utkarsh Policy (846) with an Example</h2>\r\n<div>\r\n	<div>\r\n		<p>Let\'s take and example of Jeevan Utkarsh policy with following details.</p>\r\n		<table>\r\n		<tr><td><strong>Purchase Year</strong></td><td>2017</td></tr>\r\n		<tr><td><strong>Age</strong></td><td>25 Years</td></tr>\r\n		<tr><td><strong>Basic Sum Assured</strong></td><td>5,00,000</td></tr>\r\n		<tr><td><strong>Premium Paying Term</strong></td><td>1</td></tr>\r\n		<tr><td><strong>Policy Term</strong></td><td>12</td></tr>\r\n		<tr><td><strong>Premium of Basic Plan (without GST)</strong></td><td>2,62,450</td></tr>\r\n		<tr><td><strong>Premium of Basic Plan with AD &amp; DB Rider (without GST)</strong></td><td>2,67,000</td></tr>\r\n	</table><br />\r\n	</div></div></div>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- Indexes for table `agent_policy`
--
ALTER TABLE `agent_policy`
  ADD PRIMARY KEY (`agent_id`,`pol_no`),
  ADD KEY `pol_no` (`pol_no`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `customer_agent`
--
ALTER TABLE `customer_agent`
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `customer_policy`
--
ALTER TABLE `customer_policy`
  ADD PRIMARY KEY (`cust_id`,`pol_no`),
  ADD KEY `pol_no` (`pol_no`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`trans_no`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `agent_id` (`agent_id`),
  ADD KEY `pol_no` (`pol_no`);

--
-- Indexes for table `policy`
--
ALTER TABLE `policy`
  ADD PRIMARY KEY (`pol_no`);

--
-- Indexes for table `policy_description`
--
ALTER TABLE `policy_description`
  ADD PRIMARY KEY (`p_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agent`
--
ALTER TABLE `agent`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `trans_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `policy`
--
ALTER TABLE `policy`
  MODIFY `pol_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=897456127;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `agent_policy`
--
ALTER TABLE `agent_policy`
  ADD CONSTRAINT `agent_policy_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `agent_policy_ibfk_2` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`);

--
-- Constraints for table `customer_agent`
--
ALTER TABLE `customer_agent`
  ADD CONSTRAINT `agent_id` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`);

--
-- Constraints for table `customer_policy`
--
ALTER TABLE `customer_policy`
  ADD CONSTRAINT `customer_policy_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `customer_policy_ibfk_2` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`pol_no`) REFERENCES `policy` (`pol_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
