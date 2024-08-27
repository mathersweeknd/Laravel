-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para catalogo_midia
CREATE DATABASE IF NOT EXISTS `catalogo_midia` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `catalogo_midia`;

-- Copiando estrutura para tabela catalogo_midia.cds
CREATE TABLE IF NOT EXISTS `cds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `artista` varchar(255) NOT NULL,
  `gravadora` varchar(255) DEFAULT NULL,
  `ano_lancamento` year DEFAULT NULL,
  `codigo_barras` varchar(20) NOT NULL,
  `espaco_prateleira_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_barras` (`codigo_barras`),
  KEY `espaco_prateleira_id` (`espaco_prateleira_id`),
  CONSTRAINT `cds_ibfk_1` FOREIGN KEY (`espaco_prateleira_id`) REFERENCES `espacos_prateleira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela catalogo_midia.cds: ~0 rows (aproximadamente)
INSERT IGNORE INTO `cds` (`id`, `titulo`, `artista`, `gravadora`, `ano_lancamento`, `codigo_barras`, `espaco_prateleira_id`) VALUES
	(1, 'Thriller', 'Michael Jackson', 'Epic', '1982', '074643811227', 1);

-- Copiando estrutura para tabela catalogo_midia.livros
CREATE TABLE IF NOT EXISTS `livros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `editora` varchar(255) DEFAULT NULL,
  `ano_publicacao` year DEFAULT NULL,
  `isbn` varchar(20) NOT NULL,
  `espaco_prateleira_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `espaco_prateleira_id` (`espaco_prateleira_id`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`espaco_prateleira_id`) REFERENCES `espacos_prateleira` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela catalogo_midia.livros: ~0 rows (aproximadamente)
INSERT IGNORE INTO `livros` (`id`, `titulo`, `autor`, `editora`, `ano_publicacao`, `isbn`, `espaco_prateleira_id`) VALUES
	(1, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'HarperCollins', '1954', '9780261102385', 1);

-- Copiando estrutura para tabela catalogo_midia.prateleiras
CREATE TABLE IF NOT EXISTS `prateleiras` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identificacao` varchar(50) NOT NULL,
  `descricao` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacao` (`identificacao`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela catalogo_midia.prateleiras: ~0 rows (aproximadamente)
INSERT IGNORE INTO `prateleiras` (`id`, `identificacao`, `descricao`) VALUES
	(1, 'P1', 'Prateleira para livros e CDs');

-- Copiando estrutura para tabela catalogo_midia.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `email` varchar(110) NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `sexo` enum('Masculino','Feminino','Outro') NOT NULL,
  `data_nasc` date NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `estado` char(45) NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela catalogo_midia.usuarios: ~2 rows (aproximadamente)
INSERT IGNORE INTO `usuarios` (`id`, `nome`, `email`, `telefone`, `sexo`, `data_nasc`, `cidade`, `estado`, `endereco`, `senha`) VALUES
	(1, 'Matheus', 'matheus@gmail.com', 'Pop', 'Masculino', '1982-02-01', 'Michael Jackson', 'Thriller', 'CD', '123'),
	(10, 'Mathias', 'mathias@gmail.com', 'Ficção', 'Feminino', '2002-02-01', 'JK Rowling', 'Harry Potter e a Pedra Filosofal', 'Livro', '1234');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
