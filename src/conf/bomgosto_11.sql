-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 26, 2017 at 05:30 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bomgosto`
--
CREATE DATABASE `bomgosto` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bomgosto`;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nome`) VALUES
(1, 'Pizza'),
(2, 'Bebida');

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cep` varchar(10) NOT NULL,
  `cidade` varchar(45) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `num_casa` varchar(20) NOT NULL,
  `complemento` varchar(45) DEFAULT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `telefone`, `cep`, `cidade`, `endereco`, `num_casa`, `complemento`, `login`, `senha`) VALUES
(1, 'Convidado', '(00) 00000-0000', '77777-777', '0000000', '0000000', '32', '645', 'c@a.a', '1');
-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `link`, `icone`) VALUES
(1, 'Categoria', 'listar_categoria.jsp', 'list-alt'),
(2, 'Cliente', 'listar_cliente.jsp', 'user'),
(3, 'Menu', 'listar_menu.jsp', 'menu-hamburger'),
(4, 'Pedido', 'listar_pedido.jsp', 'list'),
(5, 'Perfil', 'listar_perfil.jsp', 'duplicate'),
(6, 'Produto', 'listar_produto.jsp', 'inbox'),
(7, 'Usuário', 'listar_usuario.jsp', 'briefcase');

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE IF NOT EXISTS `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_pedido` varchar(15) NOT NULL,
  `obs` text,
  `status` varchar(40) NOT NULL,
  `tipo_pagamento` varchar(15) NOT NULL,
  `preco_final` double NOT NULL,
  `cliente_id` int NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`,`usuario_id`),
  KEY `fk_pedido_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pedido_produto`
--

CREATE TABLE IF NOT EXISTS `pedido_produto` (
  `pedido_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `qtd` int NOT NULL,
  `tamanho` varchar(45) NOT NULL,
  `preco_pedido` double NOT NULL,
  PRIMARY KEY (`pedido_id`,`produto_id`),
  KEY `fk_pedidos_has_produto_produto1_idx` (`produto_id`),
  KEY `fk_pedidos_has_produto_pedidos1_idx` (`pedido_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`, `locked`) VALUES
(1, 'Administrador', 'Administrador', 1),
(2, 'Gerente', 'Gerente', 1),
(3, 'Funcionário', 'Funcionario', 1),
(4, 'Cliente', 'Cliente', 1);

--
-- Triggers `perfil`
--
DROP TRIGGER IF EXISTS `foo_del`;
DELIMITER //
CREATE TRIGGER `foo_del` BEFORE DELETE ON `perfil`
 FOR EACH ROW IF OLD.locked THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete locked record';
END IF
//
DELIMITER ;
DROP TRIGGER IF EXISTS `foo_upd`;
DELIMITER //
CREATE TRIGGER `foo_upd` BEFORE UPDATE ON `perfil`
 FOR EACH ROW IF OLD.locked THEN
  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot update locked record';
END IF
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `perfil_menu`
--

CREATE TABLE IF NOT EXISTS `perfil_menu` (
  `perfil_id` int NOT NULL,
  `menu_id` int NOT NULL,
  PRIMARY KEY (`perfil_id`,`menu_id`),
  KEY `fk_perfil_has_menu_menu1_idx` (`menu_id`),
  KEY `fk_perfil_has_menu_perfil1_idx` (`perfil_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perfil_menu`
--

INSERT INTO `perfil_menu` (`perfil_id`, `menu_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `tamanho` varchar(40) NOT NULL,
  `unidade_medida` varchar(40) NOT NULL,
  `preco_unitario` double NOT NULL,
  `imagem` varchar(50) NOT NULL,
  `categoria_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto_categoria1_idx` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

INSERT INTO `produto` (`id`, `nome`, `preco_unitario`, `imagem`, `categoria_id`) VALUES
(1, 'Pizza de Calabresa', 15.99, 'pizza-calabresa.jpg', 1),
(2, 'Pizza a Moda da Casa', 16.99, 'pizza-moda-da-casa.jpg', 1),
(3, 'Pizza de Mussarela', 12.69, 'pizza-mussarela.jpg', 1),
(4, 'Pizza de Cholocate', 13.59, 'pizza-chocolate.jpeg', 1),
(5, 'Pizza Portuguesa',  20.99, 'pizza-portuguesa.jpg', 1),
(6, 'Suco de Açaí', 5.99, 'suco-de-acai.jpg', 2),
(7, 'Suco de Laranja',  3.99, 'suco-de-laranja.jpg', 2),
(8, 'Suco de Maracujá',  2.69, 'suco-de-maracuja.jpg', 2),
(9, 'Suco de Cupuaçu',  3.59, 'suco-de-cupuacu.jpg', 2),
(10, 'Suco de Acerola',  2.99, 'suco-de-acelora.jpg', 2);

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `senha` varchar(16) NOT NULL,
  `perfil_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_perfil1_idx` (`perfil_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `telefone`, `cpf`, `senha`, `perfil_id`) VALUES
(1, 'Administrador', '(00) 00000-0000', '000.000.000-00', '0', 1),
(2, 'Gerente', '(00) 00000-0000', '111.111.111-11', '1', 2),
(3, 'Funcionário', '(00) 00000-0000', '222.222.222-22', '2', 3),
(4, 'Convidado', '(00) 00000-0000', 'convidado', '1', 4);
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `fk_pedidos_has_produto_pedidos1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_has_produto_produto1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_perfil_has_menu_menu1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfil_has_menu_perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_categoria1` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_cliente_perfil1` FOREIGN KEY (`perfil_id`) REFERENCES `perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
