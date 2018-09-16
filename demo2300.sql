-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 01, 2017 at 07:40 AM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo2300`
--

-- --------------------------------------------------------

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
CREATE TABLE IF NOT EXISTS `contains` (
  `FoodID` char(6) NOT NULL,
  `IngredientID` char(6) NOT NULL,
  `Amountcontained` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodID`,`IngredientID`),
  KEY `IngredientID` (`IngredientID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contains`
--

INSERT INTO `contains` (`FoodID`, `IngredientID`, `Amountcontained`) VALUES
('F00002', 'I00001', 120),
('F00002', 'I00002', 20),
('F00002', 'I00003', 50);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Phonenumber` char(10) NOT NULL,
  `CustomerName` char(30) DEFAULT NULL,
  PRIMARY KEY (`Phonenumber`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Phonenumber`, `CustomerName`) VALUES
('6043334868', 'Fern Andres'),
('6045004787', 'Daniel Williams'),
('6048555432', 'Chris Williams'),
('7788555432', 'Maria Juliana'),
('6045525565', 'Steven'),
('6043334867', 'Gordon');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE IF NOT EXISTS `food` (
  `FoodID` char(6) NOT NULL,
  `FoodName` char(30) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`FoodID`, `FoodName`, `Price`) VALUES
('F00001', 'Caesar', 8),
('F00002', 'Linguine Carbonara', 14),
('F00003', 'Paella', 37),
('F80504', 'Chicken Burger', 13),
('F80658', 'Green Salad', 10),
('F95800', 'French Fries', 6),
('F95850', 'Veggie Burger', 11);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE IF NOT EXISTS `ingredients` (
  `Ingredientid` char(6) NOT NULL,
  `Unit` char(30) DEFAULT NULL,
  `IngredientName` char(30) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`Ingredientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`Ingredientid`, `Unit`, `IngredientName`, `Cost`) VALUES
('I00001', 'kg', 'Romaine', 72),
('I00002', 'kg', 'Parmesan', 50),
('I00003', 'kg', 'Bread', 22),
('I00004', 'lbs', 'Tomato', NULL);

--
-- Triggers `ingredients`
--
DROP TRIGGER IF EXISTS `ingredientsTrigger`;
DELIMITER $$
CREATE TRIGGER `ingredientsTrigger` BEFORE INSERT ON `ingredients` FOR EACH ROW BEGIN
	IF (NEW.Cost < 10) THEN
    	SET NEW.Cost = null;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ordered`
--

DROP TABLE IF EXISTS `ordered`;
CREATE TABLE IF NOT EXISTS `ordered` (
  `FoodID` char(6) NOT NULL,
  `OrderID` char(6) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`FoodID`,`OrderID`),
  KEY `OrderID` (`OrderID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ordered`
--

INSERT INTO `ordered` (`FoodID`, `OrderID`, `amount`) VALUES
('F00001', 'O00001', 3),
('F00002', 'O00002', 2),
('F00003', 'O00003', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` char(6) NOT NULL,
  `StaffID` char(6) DEFAULT NULL,
  `TableID` char(6) DEFAULT NULL,
  `ODate` date DEFAULT NULL,
  `OHour` int(11) DEFAULT NULL,
  `Tips` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `StaffID` (`StaffID`),
  KEY `TableID` (`TableID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`OrderID`, `StaffID`, `TableID`, `ODate`, `OHour`, `Tips`) VALUES
('O00001', 'ST0001', 'TB0001', '2017-11-03', 2, 11),
('O00004', 'ST0001', 'TB0004', '2017-11-11', 2, 0),
('O00003', 'ST0002', 'TB0003', '2017-11-10', 1, 8),
('O00002', 'ST0001', 'TB0002', '2017-11-07', 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
CREATE TABLE IF NOT EXISTS `purchase` (
  `purchaseid` char(6) NOT NULL,
  `totalcost` int(11) DEFAULT NULL,
  `amountrequested` int(11) DEFAULT NULL,
  `ingredientid` char(6) DEFAULT NULL,
  `staffid` char(6) DEFAULT NULL,
  PRIMARY KEY (`purchaseid`),
  KEY `staffid` (`staffid`),
  KEY `ingredientid` (`ingredientid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseid`, `totalcost`, `amountrequested`, `ingredientid`, `staffid`) VALUES
('P00001', 150, 15, 'I00001', 'ST0001'),
('P00002', 600, 50, 'I00002', 'ST0001'),
('P00003', 80, 50, 'I00003', 'ST0001');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `TableID` char(6) NOT NULL,
  `RDate` date NOT NULL,
  `Rhour` int(11) NOT NULL,
  `StaffID` char(6) DEFAULT NULL,
  `PhoneNumber` char(10) DEFAULT NULL,
  PRIMARY KEY (`TableID`,`RDate`,`Rhour`),
  KEY `PhoneNumber` (`PhoneNumber`),
  KEY `StaffID` (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`TableID`, `RDate`, `Rhour`, `StaffID`, `PhoneNumber`) VALUES
('TB007', '2017-11-04', 18, 'ST0003', '7788555432'),
('TB008', '2017-11-03', 12, 'ST0001', '6043334868'),
('TB005', '2017-11-20', 14, 'ST0001', '6045525565');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `StaffID` char(6) NOT NULL,
  `StaffName` char(30) DEFAULT NULL,
  `Position` char(30) DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `StaffName`, `Position`) VALUES
('ST0005', 'Angelo Villadolid', 'CEO'),
('ST0001', 'Mijeong Lee', 'Manager'),
('ST0002', 'Robert Kappa', 'Cashier'),
('ST0003', 'Robert Johnson', 'Server');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplierid` char(6) NOT NULL,
  `suppliername` char(30) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplierid`, `suppliername`) VALUES
('S84557', 'Mary Smith'),
('S84600', 'Mark Wang'),
('S00001', 'James'),
('S00002', 'Maria'),
('S00003', 'Tim'),
('S48102', 'David Zhang');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers_supplies`
--

DROP TABLE IF EXISTS `suppliers_supplies`;
CREATE TABLE IF NOT EXISTS `suppliers_supplies` (
  `ingredientid` char(6) NOT NULL,
  `supplierid` char(6) NOT NULL,
  PRIMARY KEY (`ingredientid`,`supplierid`),
  KEY `supplierid` (`supplierid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `suppliers_supplies`
--

INSERT INTO `suppliers_supplies` (`ingredientid`, `supplierid`) VALUES
('I00001', 'S00001'),
('I00002', 'S00001'),
('I00003', 'S00002');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
CREATE TABLE IF NOT EXISTS `tables` (
  `Tableid` char(6) NOT NULL,
  `Seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`Tableid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`Tableid`, `Seats`) VALUES
('TB0008', 4),
('TB0007', 12),
('TB0006', 4),
('TB0005', 2),
('TB0000', 0),
('TB0001', 6),
('TB0002', 4),
('TB0003', 6),
('TB0004', 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
