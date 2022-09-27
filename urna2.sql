-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 27-Set-2022 às 15:16
-- Versão do servidor: 8.0.18
-- versão do PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `urna`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidato`
--

DROP TABLE IF EXISTS `candidato`;
CREATE TABLE IF NOT EXISTS `candidato` (
  `id_candidato` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `endereco` varchar(120) NOT NULL,
  `partido` int(11) NOT NULL,
  `cargo` int(11) NOT NULL,
  PRIMARY KEY (`id_candidato`),
  KEY `partido_id_fk` (`partido`),
  KEY `cargo_id_fk` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `candidato`
--

INSERT INTO `candidato` (`id_candidato`, `nome`, `endereco`, `partido`, `cargo`) VALUES
(1, 'marcus smoke', 'dfgdfg', 1, 1),
(2, 'laurinha do camarão', 'dfgdfg', 2, 2),
(3, 'juvenal o predeiro', 'dfgdf', 3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `descricao` varchar(120) NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`id_cargo`, `nome`, `descricao`) VALUES
(1, 'dar o cu1', 'blablalba'),
(2, 'dar o cu2', 'blablalba'),
(3, 'dar o cu3', 'blablalba');

-- --------------------------------------------------------

--
-- Estrutura da tabela `eleitor`
--

DROP TABLE IF EXISTS `eleitor`;
CREATE TABLE IF NOT EXISTS `eleitor` (
  `id_eleitor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `endereço` varchar(120) NOT NULL,
  PRIMARY KEY (`id_eleitor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `eleitor`
--

INSERT INTO `eleitor` (`id_eleitor`, `nome`, `endereço`) VALUES
(1, 'juvenal1', 'fdgfdd'),
(2, 'juvenal2', 'dfgdfgfd'),
(3, 'juvenal3', 'dfgdfgf');

-- --------------------------------------------------------

--
-- Estrutura da tabela `partido`
--

DROP TABLE IF EXISTS `partido`;
CREATE TABLE IF NOT EXISTS `partido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `sigla` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `partido`
--

INSERT INTO `partido` (`id`, `nome`, `sigla`) VALUES
(1, 'partido1', 'p1'),
(2, 'partido2', 'p2'),
(3, 'partido3', 'p3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `voto`
--

DROP TABLE IF EXISTS `voto`;
CREATE TABLE IF NOT EXISTS `voto` (
  `id_voto` int(11) NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `quantidade` int(11) NOT NULL,
  `eleitor` int(11) NOT NULL,
  `cargo` int(11) NOT NULL,
  PRIMARY KEY (`id_voto`),
  KEY `eleitor_id_fk` (`eleitor`),
  KEY `cargo_id_fk2` (`cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `voto`
--

INSERT INTO `voto` (`id_voto`, `data`, `quantidade`, `eleitor`, `cargo`) VALUES
(1, '2022-10-02', 13, 1, 1),
(2, '2022-10-02', 13, 2, 2),
(3, '2022-10-02', 13, 3, 3);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `cargo_id_fk` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `partido_id_fk` FOREIGN KEY (`partido`) REFERENCES `partido` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Limitadores para a tabela `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `cargo_id_fk2` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `eleitor_id_fk` FOREIGN KEY (`eleitor`) REFERENCES `eleitor` (`id_eleitor`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/*b) SELECT * FROM voto where id_voto>=10 /*
/*c) select partido.id, candidato.nome from partido join candidato on partido.id = candidato.partido_id_fk*/


