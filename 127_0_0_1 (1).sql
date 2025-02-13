-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Fev-2025 às 21:25
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `eduardosedrezestoque`
--
DROP DATABASE IF EXISTS `eduardosedrezestoque`;
CREATE DATABASE IF NOT EXISTS `eduardosedrezestoque` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `eduardosedrezestoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cod_cliente` int(11) NOT NULL COMMENT 'Esse campo é responsavel por amazenar a chave primaria.',
  `nome_cliente` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar o nome do cliente.',
  `endereco` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar o endereço.',
  `cidade` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar a cidade do cliente.',
  `cep` varchar(10) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar o CEP do cliente.',
  `cnpj` varchar(30) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar o CNPJ.',
  `uf` char(2) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar a unidade federativa.',
  `ie` int(10) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar a inscrição estadual.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`cod_cliente`, `nome_cliente`, `endereco`, `cidade`, `cep`, `cnpj`, `uf`, `ie`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679300', '3248512673268', 'SP', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078500', '1451276498349', 'PR', NULL),
(130, 'Edmar', 'Rua da Prais s/n', 'Salvador', '30079300', '234632842349', 'BA', 7121),
(157, 'Paulo', 'Tv. Moraes c/3', 'Londrina', NULL, '328482233242', 'PR', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077500', '1273657123474', 'SC', NULL),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124391', '2831521393488', 'MG', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841650', '2176357612323', 'DF', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046500', '217635712329', 'RJ', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225900', '1327657112314', 'SP', 1820),
(390, 'Sebastião', 'Rua da Igreja n. 10', 'Uberaba', '30438700', '321765472133', 'MG', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078900', '1283512823469', 'RJ', 7431),
(720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358310', '121132309967', 'RJ', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '3012683', '3281698574656', 'SP', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763931', '2253412693879', 'SP', 4631);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_de_pedido`
--

CREATE TABLE `item_de_pedido` (
  `num_pedido` int(11) NOT NULL,
  `cod_produto` int(11) NOT NULL,
  `qtdn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `item_de_pedido`
--

INSERT INTO `item_de_pedido` (`num_pedido`, `cod_produto`, `qtdn`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8),
(148, 78, 10),
(101, 78, 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `num_pedido` int(11) NOT NULL,
  `prazo_entregue` int(10) DEFAULT NULL,
  `cod_cliente` int(11) NOT NULL,
  `cod_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`num_pedido`, `prazo_entregue`, `cod_cliente`, `cod_vendedor`) VALUES
(91, 20, 260, 11),
(97, 20, 720, 101),
(98, 20, 410, 209),
(101, 15, 720, 101),
(103, 20, 260, 11),
(104, 30, 110, 101),
(105, 15, 180, 240),
(108, 15, 290, 310),
(111, 20, 260, 240),
(119, 30, 390, 250),
(121, 20, 410, 209),
(127, 10, 410, 11),
(137, 20, 720, 720),
(138, 20, 260, 11),
(143, 30, 20, 111),
(148, 20, 720, 101),
(189, 15, 870, 213),
(203, 30, 830, 250);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `cod_produto` int(11) NOT NULL,
  `unid_produto` varchar(10) DEFAULT NULL,
  `desc_produto` varchar(50) DEFAULT NULL,
  `valor_unit` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`cod_produto`, `unid_produto`, `desc_produto`, `valor_unit`) VALUES
(13, 'G', 'Ouro', 6.18),
(22, 'M', 'Linho', 0.11),
(25, 'Kg', 'Queijo', 0.97),
(30, 'SAC', 'Açucar', 0.30),
(31, 'Bar', 'Chocolate', 0.87),
(45, 'M', 'Madeira', 0.25),
(53, 'M', 'Linha', 1.80),
(77, 'M', 'Papel', 1.05),
(78, 'L', 'Vinho', 2.00),
(87, 'M', 'Cano', 1.97);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `cod_vendedor` int(11) NOT NULL COMMENT 'Esse campo é responsavel por amazenar a chave primaria.',
  `nome_vendedor` varchar(50) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar o nome do vendedor',
  `sal_fixo` decimal(15,2) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar o salário fixo.',
  `faixa_comissao` char(2) DEFAULT NULL COMMENT 'Esse campo é responsavel por amazenar a faixa de comisão'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`cod_vendedor`, `nome_vendedor`, `sal_fixo`, `faixa_comissao`) VALUES
(11, 'João', 2780.00, 'C'),
(101, 'João', 2650.32, 'C'),
(111, 'Carlos', 2490.00, 'A'),
(209, 'José', 1800.00, 'C'),
(213, 'Jonas', 2300.50, 'A'),
(240, 'Antonio', 9500.00, 'C'),
(250, 'Mauricío', 2930.00, 'B'),
(310, 'Josias', 870.00, 'B'),
(720, 'Felipe', 4600.00, 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cod_cliente`);

--
-- Índices para tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD KEY `fk_num_pedido` (`num_pedido`),
  ADD KEY `fk_cod_produto_produto` (`cod_produto`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `FK_CLIENTE_PEDIDO` (`cod_cliente`),
  ADD KEY `FK_VENDEDOR_PEDIDO` (`cod_vendedor`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`cod_produto`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`cod_vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `fk_cod_produto_produto` FOREIGN KEY (`cod_produto`) REFERENCES `produto` (`cod_produto`),
  ADD CONSTRAINT `fk_num_pedido` FOREIGN KEY (`num_pedido`) REFERENCES `pedido` (`num_pedido`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_CLIENTE_PEDIDO` FOREIGN KEY (`cod_cliente`) REFERENCES `cliente` (`cod_cliente`),
  ADD CONSTRAINT `FK_VENDEDOR_PEDIDO` FOREIGN KEY (`cod_vendedor`) REFERENCES `vendedor` (`cod_vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
