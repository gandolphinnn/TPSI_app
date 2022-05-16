-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 16, 2022 alle 20:05
-- Versione del server: 10.4.19-MariaDB
-- Versione PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_immobiliare`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `affitto`
--

CREATE TABLE `affitto` (
  `id_affitto` int(11) NOT NULL,
  `data_inizio` date NOT NULL,
  `data_fine` date DEFAULT NULL,
  `mensilità` double NOT NULL,
  `mesi_pagati` int(11) DEFAULT 0,
  `id_appartamento` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `affitto`
--

INSERT INTO `affitto` (`id_affitto`, `data_inizio`, `data_fine`, `mensilità`, `mesi_pagati`, `id_appartamento`, `id_cliente`) VALUES
(1, '2022-05-02', '2022-08-02', 120, 3, 1, 1),
(2, '2014-03-08', '2014-10-08', 55.54, 7, 2, 2),
(3, '2012-04-04', '2012-08-04', 300, 4, 3, 3),
(4, '2017-08-10', '2017-12-10', 454, 4, 4, 4),
(5, '2008-07-03', '2008-10-03', 312, 3, 5, 5),
(6, '2012-03-02', '2012-09-02', 620.5, 6, 6, 6),
(7, '2000-05-21', '2000-11-21', 69.69, 6, 7, 7),
(8, '2014-08-29', '2014-09-29', 1000, 1, 8, 8),
(9, '2019-02-03', '2019-05-03', 40.2, 3, 9, 9),
(10, '2009-03-06', '2009-12-06', 221, 9, 10, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `appartamento`
--

CREATE TABLE `appartamento` (
  `id_appartamento` int(11) NOT NULL,
  `locali` int(11) NOT NULL,
  `piano` int(11) NOT NULL,
  `metratura` double NOT NULL,
  `id_edificio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `appartamento`
--

INSERT INTO `appartamento` (`id_appartamento`, `locali`, `piano`, `metratura`, `id_edificio`) VALUES
(1, 6, 2, 90, 1),
(2, 10, 3, 190, 2),
(3, 7, 1, 123, 3),
(4, 6, 1, 130, 4),
(5, 5, 3, 85, 5),
(6, 8, 3, 230, 6),
(7, 5, 4, 100, 7),
(8, 12, 1, 325, 8),
(9, 5, 10, 70, 9),
(10, 7, 2, 150, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `codice_fiscale` varchar(16) NOT NULL,
  `nome` varchar(11) NOT NULL,
  `cognome` varchar(11) NOT NULL,
  `data_nascita` date NOT NULL,
  `telefono` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `codice_fiscale`, `nome`, `cognome`, `data_nascita`, `telefono`) VALUES
(1, 'GCMRST70A29F305Z', 'Giovanni', 'Campanaro', '1981-07-14', '3813412789'),
(2, 'RSSMRA70A41F205Z', 'Rossi', 'Maria', '1970-01-01', '3912375657'),
(3, 'LCARSS31SO8H501H', 'Luca', 'Bislungo', '2000-08-03', '3711438903'),
(4, 'RSFSVC41LO9M311M', 'Diego', 'Vimercatesi', '1994-11-11', '3459871213'),
(5, 'SFMLUD24JK4B355C', 'Silvio', 'Renzi', '1994-08-05', '3223114334'),
(6, 'KJHIUY45CD8V654B', 'Kevin', 'Brambilla', '1990-05-03', '311996969'),
(7, 'POIUNO09FI6G699A', 'Antonella', 'Scipponi', '1986-03-05', '3667751278'),
(8, 'DOPOES21DA4J889E', 'Domenico', 'Riso', '1951-12-31', '3987654321'),
(9, 'DISEUO41IJ7J372E', 'Luciano', 'Fregato', '2002-09-01', '3246547485'),
(10, 'KJHGFD09OP8F321U', 'Qifsha', 'Nonen', '2003-01-29', '3711538397');

-- --------------------------------------------------------

--
-- Struttura della tabella `edificio`
--

CREATE TABLE `edificio` (
  `id_edificio` int(11) NOT NULL,
  `codice` varchar(255) NOT NULL,
  `indirizzo` varchar(255) NOT NULL,
  `piani` int(11) NOT NULL,
  `appartamenti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `edificio`
--

INSERT INTO `edificio` (`id_edificio`, `codice`, `indirizzo`, `piani`, `appartamenti`) VALUES
(1, 'a', 'via Luciano Ungheretti ', 4, 8),
(2, 'b', 'via Rodolfo Pascoli ', 3, 3),
(3, 'c', 'via Federico Gatti', 4, 8),
(4, 'd', 'via Diego Epiglotti', 2, 1),
(5, 'e', 'via Davide Wanluigi', 5, 15),
(6, 'f', 'via Habibi Ropt', 4, 4),
(7, 'g', 'via Un Skam Frik', 5, 10),
(8, 'h', 'via Simona Vercelli', 1, 1),
(9, 'i', 'via Tony Montana ', 10, 20),
(10, 'j', 'via Walter White', 3, 6);

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id_utente` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id_utente`, `username`, `email`, `password`) VALUES
(1, 'Admin', 'admin@admin.com', 'admin');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `affitto`
--
ALTER TABLE `affitto`
  ADD PRIMARY KEY (`id_affitto`),
  ADD KEY `id_affitto` (`id_affitto`),
  ADD KEY `id_abitazione` (`id_appartamento`,`id_cliente`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indici per le tabelle `appartamento`
--
ALTER TABLE `appartamento`
  ADD PRIMARY KEY (`id_appartamento`),
  ADD KEY `id_appartamento` (`id_appartamento`),
  ADD KEY `id_edificio` (`id_edificio`),
  ADD KEY `id_edificio_2` (`id_edificio`);

--
-- Indici per le tabelle `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `cf` (`codice_fiscale`),
  ADD UNIQUE KEY `telefono` (`telefono`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indici per le tabelle `edificio`
--
ALTER TABLE `edificio`
  ADD PRIMARY KEY (`id_edificio`),
  ADD UNIQUE KEY `codice` (`codice`),
  ADD KEY `id_edificio` (`id_edificio`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id_utente`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_utente` (`id_utente`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `affitto`
--
ALTER TABLE `affitto`
  MODIFY `id_affitto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `appartamento`
--
ALTER TABLE `appartamento`
  MODIFY `id_appartamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `edificio`
--
ALTER TABLE `edificio`
  MODIFY `id_edificio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id_utente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `affitto`
--
ALTER TABLE `affitto`
  ADD CONSTRAINT `affitto_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `affitto_ibfk_2` FOREIGN KEY (`id_appartamento`) REFERENCES `appartamento` (`id_appartamento`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `appartamento`
--
ALTER TABLE `appartamento`
  ADD CONSTRAINT `appartamento_ibfk_1` FOREIGN KEY (`id_edificio`) REFERENCES `edificio` (`id_edificio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
