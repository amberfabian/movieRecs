-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2023 at 09:15 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movierecs`
--
CREATE DATABASE IF NOT EXISTS `movierecs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `movierecs`;

-- --------------------------------------------------------

--
-- Table structure for table `cast`
--

CREATE TABLE `cast` (
  `People_Id` int(100) NOT NULL,
  `MovieID` varchar(100) NOT NULL,
  `Role` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cast`
--

INSERT INTO `cast` (`People_Id`, `MovieID`, `Role`) VALUES
(1, 'Ready Player One', 'Actor'),
(2, 'Knives Out', 'Actor');

-- --------------------------------------------------------

--
-- Table structure for table `film_data`
--

CREATE TABLE `film_data` (
  `MovieID` varchar(100) NOT NULL,
  `Year` int(4) NOT NULL,
  `Duration` varchar(10) NOT NULL,
  `Company` varchar(50) NOT NULL,
  `Rating` varchar(50) NOT NULL,
  `IMDb` int(10) NOT NULL,
  `RottenTomatoes` int(50) NOT NULL,
  `BoxOffice` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film_data`
--

INSERT INTO `film_data` (`MovieID`, `Year`, `Duration`, `Company`, `Rating`, `IMDb`, `RottenTomatoes`, `BoxOffice`) VALUES
('Knives Out', 2019, '2h10', 'Lionsgate Films', 'PG-13', 8, 97, '312 million usd'),
('Ready Player One', 2018, '2h20', 'Warner Bros Pictures', 'PG-13', 7, 72, '583 Million usd');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `MovieID` varchar(100) NOT NULL,
  `Genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`MovieID`, `Genre`) VALUES
('Knives Out', 'Comedy'),
('Knives Out', 'Mystery'),
('Ready Player One', 'Action'),
('Ready Player One', 'Sci-Fi');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `People_Id` int(50) NOT NULL,
  `FName` varchar(100) NOT NULL,
  `LName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`People_Id`, `FName`, `LName`) VALUES
(1, 'Tye', 'Sheridan'),
(2, 'Ana', 'De Armas');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserId` int(50) NOT NULL,
  `FName` varchar(100) NOT NULL,
  `LName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserId`, `FName`, `LName`) VALUES
(1, 'Bryan', 'Rivera'),
(2, 'Amber', 'Fabian');

-- --------------------------------------------------------

--
-- Table structure for table `user_recommendations`
--

CREATE TABLE `user_recommendations` (
  `MovieID` varchar(100) NOT NULL,
  `UserId` int(50) NOT NULL,
  `UserRating` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_recommendations`
--

INSERT INTO `user_recommendations` (`MovieID`, `UserId`, `UserRating`) VALUES
('Knives Out', 2, 5),
('Ready Player One', 1, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cast`
--
ALTER TABLE `cast`
  ADD PRIMARY KEY (`People_Id`,`MovieID`,`Role`),
  ADD KEY `Mov` (`MovieID`);

--
-- Indexes for table `film_data`
--
ALTER TABLE `film_data`
  ADD PRIMARY KEY (`MovieID`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`MovieID`,`Genre`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`People_Id`),
  ADD UNIQUE KEY `FName` (`FName`),
  ADD UNIQUE KEY `FName_2` (`FName`),
  ADD UNIQUE KEY `FName_3` (`FName`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `user_recommendations`
--
ALTER TABLE `user_recommendations`
  ADD PRIMARY KEY (`MovieID`,`UserId`),
  ADD KEY `User` (`UserId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cast`
--
ALTER TABLE `cast`
  ADD CONSTRAINT `Mov` FOREIGN KEY (`MovieID`) REFERENCES `film_data` (`MovieID`),
  ADD CONSTRAINT `People_ID` FOREIGN KEY (`People_Id`) REFERENCES `people` (`People_Id`);

--
-- Constraints for table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `MovieID` FOREIGN KEY (`MovieID`) REFERENCES `film_data` (`MovieID`);

--
-- Constraints for table `user_recommendations`
--
ALTER TABLE `user_recommendations`
  ADD CONSTRAINT `Movie` FOREIGN KEY (`MovieID`) REFERENCES `film_data` (`MovieID`),
  ADD CONSTRAINT `User` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
