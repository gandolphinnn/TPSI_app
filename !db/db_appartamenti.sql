-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 09:02 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_appartamenti`
--

-- --------------------------------------------------------

--
-- Table structure for table `abitazione`
--

CREATE TABLE `abitazione` (
  `Id_Appartamento` int(11) NOT NULL,
  `Codice_Appartamento` varchar(11) NOT NULL,
  `Locali` int(11) NOT NULL,
  `Piano` int(11) NOT NULL,
  `Metratura` int(11) NOT NULL,
  `Id_Edificio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `affitto`
--

CREATE TABLE `affitto` (
  `Id_Affitto` int(11) NOT NULL,
  `Data_Inizio` date NOT NULL,
  `Data_Fine` date NOT NULL,
  `Mensilità` varchar(11) NOT NULL,
  `Mesi_Pagati` int(11) NOT NULL,
  `Id_Abitazione` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `Codice_Fiscale` varchar(11) NOT NULL,
  `Nome` varchar(11) NOT NULL,
  `Cognome` varchar(11) NOT NULL,
  `Data_Nascita` date NOT NULL,
  `Numero_Telefono` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `edificio`
--

CREATE TABLE `edificio` (
  `Id_Edificio` int(11) NOT NULL,
  `Indirizzo` varchar(255) NOT NULL,
  `Piani` int(11) NOT NULL,
  `Appartamenti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abitazione`
--
ALTER TABLE `abitazione`
  ADD PRIMARY KEY (`Id_Appartamento`),
  ADD KEY `Id_Appartamento` (`Id_Appartamento`),
  ADD KEY `Id_Edificio` (`Id_Edificio`),
  ADD KEY `Id_Edificio_2` (`Id_Edificio`);

--
-- Indexes for table `affitto`
--
ALTER TABLE `affitto`
  ADD PRIMARY KEY (`Id_Affitto`),
  ADD KEY `Id_Affitto` (`Id_Affitto`),
  ADD KEY `Id_Abitazione` (`Id_Abitazione`,`Id_Cliente`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`),
  ADD UNIQUE KEY `Codice_Fiscale` (`Codice_Fiscale`),
  ADD KEY `Id_Cliente` (`Id_Cliente`);

--
-- Indexes for table `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`Id_Edificio`),
  ADD UNIQUE KEY `Indirizzo` (`Indirizzo`),
  ADD KEY `Id_Edificio` (`Id_Edificio`);

--
-- Indexes for table `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_utente` (`id_utente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abitazione`
--
ALTER TABLE `abitazione`
  MODIFY `Id_Appartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `affitto`
--
ALTER TABLE `affitto`
  MODIFY `Id_Affitto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `edificio`
--
ALTER TABLE `edificio`
  MODIFY `Id_Edificio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abitazione`
--
ALTER TABLE `abitazione`
  ADD CONSTRAINT `abitazione_ibfk_1` FOREIGN KEY (`Id_Edificio`) REFERENCES `edificio` (`Id_Edificio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `affitto`
--
ALTER TABLE `affitto`
  ADD CONSTRAINT `affitto_ibfk_1` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `affitto_ibfk_2` FOREIGN KEY (`Id_Abitazione`) REFERENCES `abitazione` (`Id_Appartamento`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
