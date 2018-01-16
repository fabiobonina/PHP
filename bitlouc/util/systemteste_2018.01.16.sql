-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16-Jan-2018 às 09:06
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `systemteste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bem`
--

CREATE TABLE `tb_bem` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `numeracao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fabricante` int(11) NOT NULL,
  `fabricanteNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `proprietario` int(11) NOT NULL,
  `proprietarioNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `proprietarioLocal` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `plaqueta` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataFrabricacao` date DEFAULT '0000-00-00',
  `dataCompra` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_bem`
--

INSERT INTO `tb_bem` (`id`, `produto`, `tag`, `name`, `modelo`, `numeracao`, `fabricante`, `fabricanteNick`, `proprietario`, `proprietarioNick`, `proprietarioLocal`, `categoria`, `plaqueta`, `dataFrabricacao`, `dataCompra`) VALUES
(1, 1, 'tag', 'name', 'modelo', 'numeracao', 1, 'fabricanteNick', 1, 'proprietarioNick', 2, 1, '10101010', '2017-12-28', '2017-12-28'),
(2, 1, 'tag', 'name', 'modelo', 'numeracao', 1, 'fabricanteNick', 1, 'proprietarioNick', 2, 1, '10101010', '2017-12-28', '2017-12-28'),
(3, 1, 'MSA', 'MASCARA AUTONOMA', '300lbs', '1234', 1, 'MSA', 1, 'AGESPISA', 2, 1, '101010', '2017-12-28', '2017-12-28'),
(4, 2, 'SCL', 'SISTEMA CLORACAO', '26KG', '', 2, 'CLORANDO', 1, 'AGESPISA', 2, 1, '111111', '2017-12-28', '2017-12-28'),
(5, 3, 'CLORADOR', 'CLORADOR', '100kg', '10000', 2, 'CLORANDO', 1, 'AGESPISA', 2, 1, '101010', '2017-12-28', '2017-12-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bem_componentes`
--

CREATE TABLE `tb_bem_componentes` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `capacidade` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `unidade` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `numeracao` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fabricante` int(11) NOT NULL,
  `fabricanteNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `proprietario` int(11) NOT NULL,
  `proprietarioNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `local` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `dataFrabricacao` date NOT NULL DEFAULT '0000-00-00',
  `dataCompra` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_bem_componentes`
--

INSERT INTO `tb_bem_componentes` (`id`, `produto`, `tag`, `name`, `capacidade`, `unidade`, `numeracao`, `fabricante`, `fabricanteNick`, `proprietario`, `proprietarioNick`, `local`, `categoria`, `dataFrabricacao`, `dataCompra`) VALUES
(1, 3, 'CLORADOR', 'SISTEMA DE CLORACAO', '240', 'KG', '123123', 2, 'CLORANDO', 24, 'SABARA', 2, 1, '2017-12-17', '2017-12-17'),
(2, 4, 'MSA', 'CILINDRO AR', '3.6', 'KG', 'J31243', 1, 'MSA', 24, 'SABARA', 2, 1, '2017-12-10', '2017-12-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bem_localizacao`
--

CREATE TABLE `tb_bem_localizacao` (
  `id` int(11) NOT NULL,
  `bem` int(11) NOT NULL,
  `loja` int(11) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `dataInicial` date DEFAULT '0000-00-00',
  `dataFinal` date DEFAULT '0000-00-00',
  `status` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_bem_localizacao`
--

INSERT INTO `tb_bem_localizacao` (`id`, `bem`, `loja`, `local`, `dataInicial`, `dataFinal`, `status`) VALUES
(1, 1, 1, 2, '2017-12-28', '0000-00-00', '0'),
(2, 2, 1, 2, '2017-12-28', '0000-00-00', '0'),
(3, 3, 1, 2, '2017-12-28', '0000-00-00', '1'),
(4, 4, 1, 2, '2017-12-28', '0000-00-00', '0'),
(5, 5, 1, 2, '2017-12-28', '0000-00-00', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bens_familia`
--

CREATE TABLE `tb_bens_familia` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_bens_familia`
--

INSERT INTO `tb_bens_familia` (`id`, `name`, `tag`) VALUES
(1, 'MASCARA AUTONOMA', 'MSA'),
(2, 'Sistema Cloração', 'SCL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bens_frabricante`
--

CREATE TABLE `tb_bens_frabricante` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `nick` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_bens_frabricante`
--

INSERT INTO `tb_bens_frabricante` (`id`, `name`, `nick`) VALUES
(1, 'MSA', 'MSA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bens_grupo`
--

CREATE TABLE `tb_bens_grupo` (
  `id` int(11) NOT NULL,
  `bem` int(11) NOT NULL,
  `grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_bens_nivel`
--

CREATE TABLE `tb_bens_nivel` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tag` int(11) NOT NULL,
  `segmento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_bens_nivel`
--

INSERT INTO `tb_bens_nivel` (`id`, `name`, `tag`, `segmento`) VALUES
(1, 'PRIMERIO', 1, 1),
(2, 'SECUNDARIO', 2, 1),
(3, 'TERCERARIO', 3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tag` varchar(30) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_categoria`
--

INSERT INTO `tb_categoria` (`id`, `name`, `tag`) VALUES
(1, 'GAS CLORO', 'GCL'),
(2, 'SEGURACA', 'SEG'),
(3, 'POLICLORETO ALUMINIO', 'PAC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_equipamentos`
--

CREATE TABLE `tb_equipamentos` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `capacidade` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `unidade` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `numeracao` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `fabricante` int(11) NOT NULL,
  `fabricanteNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `proprietario` int(11) NOT NULL,
  `proprietarioNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `local` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `plaqueta` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `dataFrabricacao` date NOT NULL DEFAULT '0000-00-00',
  `dataCompra` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_equipamentos`
--

INSERT INTO `tb_equipamentos` (`id`, `produto`, `tag`, `name`, `capacidade`, `unidade`, `numeracao`, `fabricante`, `fabricanteNick`, `proprietario`, `proprietarioNick`, `local`, `categoria`, `plaqueta`, `dataFrabricacao`, `dataCompra`) VALUES
(1, 2, 'SCL', 'SISTEMA DE CLORACAO', '240', 'KG', '123123', 2, 'CLORANDO', 24, 'SABARA', 2, 1, '101010', '2017-12-17', '2017-12-17'),
(2, 1, 'MSA', 'MASCARA AUTONOMA', '3', 'KG', '123123', 1, 'MSA', 24, 'SABARA', 2, 1, '', '2017-12-10', '2017-12-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_eq_componentes`
--

CREATE TABLE `tb_eq_componentes` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `capacidade` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `unidade` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `numeracao` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `frabicante` int(11) NOT NULL,
  `frabicanteNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `proprietario` int(11) NOT NULL,
  `proprietarioNick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `local` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `dataFrabricacao` date NOT NULL DEFAULT '0000-00-00',
  `dataCompra` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_eq_componentes`
--

INSERT INTO `tb_eq_componentes` (`id`, `produto`, `tag`, `name`, `capacidade`, `unidade`, `numeracao`, `frabicante`, `frabicanteNick`, `proprietario`, `proprietarioNick`, `local`, `categoria`, `dataFrabricacao`, `dataCompra`) VALUES
(1, 3, 'CLORADOR', 'SISTEMA DE CLORACAO', '240', 'KG', '123123', 2, 'CLORANDO', 24, 'SABARA', 2, 1, '2017-12-17', '2017-12-17'),
(2, 4, 'MSA', 'CILINDRO AR', '3.6', 'KG', 'J31243', 1, 'MSA', 24, 'SABARA', 2, 1, '2017-12-10', '2017-12-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_eq_localizacao`
--

CREATE TABLE `tb_eq_localizacao` (
  `id` int(11) NOT NULL,
  `equipamento` int(11) NOT NULL,
  `loja` int(11) NOT NULL,
  `local` int(11) DEFAULT NULL,
  `dataIncial` date DEFAULT '0000-00-00',
  `dataFinal` date DEFAULT '0000-00-00',
  `status` enum('0','1','2','3') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_eq_localizacao`
--

INSERT INTO `tb_eq_localizacao` (`id`, `equipamento`, `loja`, `local`, `dataIncial`, `dataFinal`, `status`) VALUES
(1, 1, 24, 535, '2017-12-01', '2017-12-17', '3'),
(2, 1, 1, 2, '2017-12-18', '0000-00-00', '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_fabricante`
--

CREATE TABLE `tb_fabricante` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nick` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_fabricante`
--

INSERT INTO `tb_fabricante` (`id`, `name`, `nick`) VALUES
(1, 'MSA', 'MSA'),
(2, 'CLORANDO', 'CLORANDO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_frabricante`
--

CREATE TABLE `tb_frabricante` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nick` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_frabricante`
--

INSERT INTO `tb_frabricante` (`id`, `name`, `nick`) VALUES
(1, 'MSA', 'MSA'),
(2, 'CLORANDO', 'CLORANDO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grupo`
--

CREATE TABLE `tb_grupo` (
  `id` int(11) NOT NULL,
  `decricao` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_grupo`
--

INSERT INTO `tb_grupo` (`id`, `decricao`) VALUES
(2, 'Proprietario'),
(1, 'Cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_grupoloja`
--

CREATE TABLE `tb_grupoloja` (
  `id` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `decricao` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_grupoloja`
--

INSERT INTO `tb_grupoloja` (`id`, `decricao`) VALUES
('P', 'Proprietario'),
('C', 'Cliente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_insumos`
--

CREATE TABLE `tb_insumos` (
  `id` int(11) NOT NULL,
  `tb_oat_id` int(11) NOT NULL,
  `descricao` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `quantidade` double NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `obs` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_locais`
--

CREATE TABLE `tb_locais` (
  `id` int(11) NOT NULL,
  `loja` int(11) NOT NULL,
  `tipo` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `regional` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `municipio` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_locais`
--

INSERT INTO `tb_locais` (`id`, `loja`, `tipo`, `regional`, `name`, `municipio`, `uf`, `latitude`, `longitude`, `ativo`) VALUES
(2, 1, 'ETA', 'FLORIANO', 'FLORIANO', 'FLORIANO', 'PI', -6.784000, -43.020000, '0'),
(3, 1, 'ETA', 'PARNAIBA', 'PARNAIBA', 'PARNAIBA', 'PI', -2.922000, -41.758999, '0'),
(4, 2, 'ETA', '', 'BARCARENA', 'BARCARENA', 'PA', -1.550000, -48.738998, '0'),
(5, 3, 'ETA', '', 'JOAO PESSOA', 'JOAO PESSOA', 'PB', -7.188000, -34.916000, '0'),
(6, 4, 'ETA', '', 'TIMOTEO', 'TIMOTEO', 'MG', -19.524000, -42.653000, '0'),
(7, 6, 'ETA', '', 'PEDRAS DE FOGO', 'PEDRAS DE FOGO', 'PB', -7.353000, -35.027000, '0'),
(8, 7, 'ETA', '', 'ETA-ARAPIRACA', 'ARAPIRACA', 'AL', -9.702000, -36.688999, '0'),
(9, 7, 'ETA', '', 'PILAR', 'PILAR', 'AL', 0.000000, 0.000000, '0'),
(10, 7, 'ETA', '', 'SAO BRAS (ETA-MORRO DO GAIA)', 'SAO BRAS', 'AL', 0.000000, 0.000000, '0'),
(11, 8, 'ETA', '', 'CUIABA ETA I', 'CUIABA', 'MT', -15.590000, -56.098999, '0'),
(12, 8, 'ETA', '', 'CUIABA ETA II', 'CUIABA', 'MT', 0.000000, 0.000000, '0'),
(13, 9, 'ETA', 'IMPERATRIZ', 'ACAILANDIA ELEVATORIA', 'ACAILANDIA', 'MA', -4.951000, -47.493000, '0'),
(14, 9, 'ETA', '', 'ALCANTARA', 'ALCANTARA', 'MA', -2.358000, -44.432999, '0'),
(15, 9, 'ETA', '', 'ARAIOSES', 'ARAIOSES', 'MA', 0.000000, 0.000000, '0'),
(16, 9, 'ETA', 'ITAPECURU MIRIM', 'AREIAS', 'SAO LUIS', 'MA', 0.000000, 0.000000, '0'),
(17, 9, 'ETA', '', 'AXIXA', 'AXIXA', 'MA', -2.838000, -44.062000, '0'),
(18, 9, 'ETA', 'SAO JOAO DOS PATOS', 'BARAO DE GRAJAU', 'BARAO DE GRAJAU', 'MA', -6.758000, -43.022999, '0'),
(19, 9, 'ETA', 'PRESIDENTE DUTRA', 'BARRA DO CORDA', 'BARRA DO CORDA', 'MA', 0.000000, 0.000000, '0'),
(20, 9, 'ETA', 'BARREIRINHAS', 'BARREIRINHAS', 'BARREIRINHAS', 'MA', 0.000000, 0.000000, '0'),
(21, 9, 'ETA', '', 'BOM JESUS DAS SELVAS', 'BOM JESUS DAS SELVAS', 'MA', 0.000000, 0.000000, '0'),
(22, 9, 'ETA', '', 'BREJO', 'BREJO', 'MA', -3.680000, -42.689999, '0'),
(23, 9, 'ETA', '', 'BURITI DE INACIA VAZ', 'SAO LUIS', 'MA', -3.941000, -42.922001, '0'),
(24, 9, 'ETA', '', 'CANTANHEDE', 'CANTANHEDE', 'MA', 0.000000, 0.000000, '0'),
(25, 9, 'ETA', 'CHAPADINHA', 'CHAPADINHA', 'CHAPADINHA', 'MA', -3.743000, -43.355000, '0'),
(26, 9, 'ETA', 'SAO JOAO DOS PATOS', 'COLINAS', 'COLINAS', 'MA', -6.034000, -44.257000, '0'),
(27, 9, 'ETA', '', 'DUQUE BACELAR', 'DUQUE BACELAR', 'MA', -4.162000, -42.942001, '0'),
(28, 9, 'ETA', 'IMPERATRIZ', 'IMPERATRIZ', 'IMPERATRIZ', 'MA', -5.548000, -47.476002, '0'),
(29, 9, 'ETA', 'BACABEIRA', 'ITALUIS', 'ROSARIO', 'MA', -3.027000, -44.308998, '0'),
(30, 9, 'ETA', 'ITAPECURU MIRIM', 'ITAPECURU MIRIM', 'ITAPECURU MIRIM', 'MA', -3.409000, -44.348000, '0'),
(31, 9, 'ETA', 'SAO JOAO DOS PATOS', 'LORETO', 'LORETO', 'MA', -7.096000, -45.129002, '0'),
(32, 9, 'ETA', '', 'MIRANDA DO NORTE', 'MIRANDA DO NORTE', 'MA', 0.000000, 0.000000, '0'),
(33, 9, 'ETA', 'ITAPECURU MIRIM', 'MORROS', 'MORROS', 'MA', -2.862000, -44.023998, '0'),
(34, 9, 'ETA', 'CHAPADINHA', 'NINA RODRIGUES', 'NINA RODRIGUES', 'MA', -3.467000, -43.902000, '0'),
(35, 9, 'ETA', 'METROPOLITANA', 'PACIENCIA', 'SAO LUIS', 'MA', -2.556000, -44.209999, '0'),
(36, 9, 'ETA', '', 'PEDREIRAS', 'PEDREIRAS', 'MA', -4.574000, -44.602001, '0'),
(37, 9, 'ETA', '', 'PINHEIRO', 'PINHEIRO', 'MA', -2.527000, -45.083000, '0'),
(38, 9, 'ETA', '', 'PIRAPEMAS', 'PIRAPEMAS', 'MA', -3.728000, -44.229000, '0'),
(39, 9, 'ETA', 'IMPERATRIZ', 'RIACHAO', 'RIACHAO', 'MA', 0.000000, 0.000000, '0'),
(40, 9, 'ETA', 'METROPOLITANA', 'SACAVEM', 'ACAILANDIA', 'MA', -2.566000, -44.252998, '0'),
(41, 9, 'ETA', '', 'SANTA QUITERIA', 'SANTA QUITERIA DO MARANHAO', 'MA', -3.501000, -42.562000, '0'),
(42, 9, 'ETA', '', 'SAO BENEDITO DO RIO PRETO', 'ACAILANDIA', 'MA', 0.000000, 0.000000, '0'),
(43, 9, 'ETA', '', 'SAO BERNARDO', 'SAO BERNARDO', 'MA', 0.000000, 0.000000, '0'),
(44, 9, 'ETA', 'SAO JOAO DOS PATOS', 'SAO RAIMUNDO DAS MANGABEIRAS', 'SAO RAIMUNDO DAS MANGABEIRAS', 'MA', -7.024000, -45.478001, '0'),
(45, 9, 'ETA', 'COROATA', 'TIMBIRAS', 'TIMBIRAS', 'MA', 0.000000, 0.000000, '0'),
(46, 9, 'ETA', 'DEDREIRAS', 'TRIZIDELA DO VALE', 'TRIZIDELA DO VALE', 'MA', -4.573000, -44.617001, '0'),
(47, 9, 'ETA', '', 'TUTOIA', 'TUTOIA', 'MA', -2.761000, -42.275002, '0'),
(48, 9, 'ETA', '', 'URBANO SANTOS', 'URBANO SANTOS', 'MA', -3.203000, -43.389999, '0'),
(49, 9, 'ETA', 'CHAPADINHA', 'VARGEM GRANDE', 'VARGEM GRANDE', 'MA', 0.000000, 0.000000, '0'),
(50, 9, 'ETA', 'SANTA INES', 'VITORIA DO MEARIM', 'VITORIA DO MEARIM', 'MA', -3.477000, -44.867001, '0'),
(51, 10, 'ETA', '', 'ALTO ALEGRE', 'ALTO ALEGRE', 'RR', 2.835000, -60.728001, '0'),
(52, 10, 'ETA', '', 'CARACARAI', 'CARACARAI', 'RR', 1.829000, -61.132000, '0'),
(53, 10, 'ETA', '', 'CAROEBE', 'CAROEBE', 'RR', 0.876169, -59.662998, '0'),
(54, 10, 'ETA', '', 'MUCAJAI', 'MUCAJAI', 'RR', 2.448000, -60.917999, '0'),
(55, 10, 'ETA', '', 'NORMANDIA', 'NORMANDIA', 'RR', 3.878000, -59.626999, '0'),
(56, 10, 'ETA', '', 'PACARAIMA', 'PACARAIMA', 'RR', 4.477000, -61.146999, '0'),
(57, 10, 'ETA', '', 'RORAINOPOLIS', 'RORAINOPOLIS', 'RR', 0.941046, -60.423000, '0'),
(58, 10, 'ETA', '', 'SAO JOAO DA BALIZA', 'SAO JOAO DA BALIZA', 'RR', 0.950526, -59.909000, '0'),
(59, 10, 'ETA', '', 'SAO LUIZ DO ANAUA', 'SAO JOAO DA BALIZA', 'RR', 1.010000, -60.033001, '0'),
(60, 10, 'ETA', '', 'SAO PEDRO', 'BOA VISTA', 'RR', 2.826000, -60.658001, '0'),
(61, 11, 'ETA', '', 'ACARI', 'ACARI', 'RN', 0.000000, 0.000000, '0'),
(62, 11, 'ETA', '', 'ADUTORA DO BOQUEIRAO', 'RIACHO DA CRUZ', 'RN', 0.000000, 0.000000, '0'),
(63, 11, 'ETA', '', 'ALTO RODRIGUES', 'ALTO DO RODRIGUES', 'RN', -5.301000, -36.764000, '0'),
(64, 11, 'ETA', '', 'ANGICOS - CENTRO', 'ANGICOS', 'RN', 0.000000, 0.000000, '0'),
(65, 11, 'ETA', '', 'ANGICOS - EB2', 'ANGICOS', 'RN', 0.000000, 0.000000, '0'),
(66, 11, 'ETA', '', 'ANGICOS- ADUTORA CENTAL', 'ANGICOS', 'RN', 0.000000, 0.000000, '0'),
(67, 11, 'ETA', '', 'APODI', 'APODI', 'RN', -5.660000, -37.798000, '0'),
(68, 11, 'ETA', '', 'AREIA BRANCA', 'AREIA BRANCA', 'RN', 0.000000, 0.000000, '0'),
(69, 11, 'ETA', '', 'ASSU', 'ACU', 'RN', -5.578000, -36.925999, '0'),
(70, 11, 'ETA', '', 'BOA SAUDE', 'BOA SAUDE', 'RN', -6.138000, -35.577000, '0'),
(71, 11, 'ETA', '', 'BOM JESUS - EB - 8', 'BOM JESUS', 'RN', 0.000000, 0.000000, '0'),
(72, 11, 'ETA', '', 'BRASIL NOVO', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(73, 11, 'ETA', 'CAICO', 'CAICO', 'CAICO', 'RN', -6.467000, -37.091999, '0'),
(74, 11, 'ETA', '', 'CAICO ZONA NORTE', 'CAICO', 'RN', 0.000000, 0.000000, '0'),
(75, 11, 'ETA', '', 'CAMPO REDONDO', 'CAMPO REDONDO', 'RN', 0.000000, 0.000000, '0'),
(76, 11, 'ETA', '', 'CANDELARIA', 'NATAL', 'RN', -5.839000, -35.220001, '0'),
(77, 11, 'ETA', '', 'CANGUARETAMA', 'CANGUARETAMA', 'RN', -6.378000, -35.127998, '0'),
(78, 11, 'ETA', '', 'CARAUBAS', 'CARAUBAS', 'RN', -5.634000, -37.535999, '0'),
(79, 11, 'ETA', '', 'CARNAUBAIS', 'CARNAUBAIS', 'RN', -5.339000, -36.830002, '0'),
(80, 11, 'ETA', '', 'CARNAUBAS-PALMA', 'CARNAUBAIS', 'RN', 0.000000, 0.000000, '0'),
(81, 11, 'ETA', '', 'CERRO CORA ETA LOCAL', 'CERRO CORA', 'RN', -6.036000, -36.347000, '0'),
(82, 11, 'ETA', '', 'CIDADE CAMPESTRE - P78', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(83, 11, 'ETA', '', 'CIDADE DOS BOSQUES - P17', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(84, 11, 'ETA', 'LITORAL SUL', 'CIDADE SATELITE', 'NATAL', 'RN', -5.863000, -35.230000, '0'),
(85, 11, 'ETA', '', 'CIDADE SATELITE - P9', 'NATAL', 'RN', -5.860000, -35.243000, '0'),
(86, 11, 'ETA', '', 'CONJUNTO JIQUI - P2', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(87, 11, 'ETA', '', 'CRUZETA - CAPITACAO', 'CRUZETA', 'RN', -6.411000, -36.794998, '0'),
(88, 11, 'ETA', '', 'CRUZETA - ESCRITORIO', 'CRUZETA', 'RN', -6.412000, -36.787998, '0'),
(89, 11, 'ETA', '', 'CURRAIS NOVOS', 'CURRAIS NOVOS', 'RN', -6.255000, -36.522999, '0'),
(90, 11, 'ETA', '', 'DIX-SEPT ROSADO', 'GOVERNADOR DIX-SEPT ROSADO', 'RN', 0.000000, 0.000000, '0'),
(91, 11, 'ETA', '', 'Dr. SEVERIANO', 'DOUTOR SEVERIANO', 'RN', 0.000000, 0.000000, '0'),
(93, 11, 'ETA', '', 'ELOI DE SOUSA - EB - 10', 'SENADOR ELOI DE SOUZA', 'RN', 0.000000, 0.000000, '0'),
(94, 11, 'ETA', '', 'EMAUS - P90', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(95, 11, 'ETA', '', 'ENTRONCAMENTO', 'NATAL', 'RN', -5.582000, -35.655998, '0'),
(96, 11, 'ETA', '', 'EQUADOR', 'EQUADOR', 'RN', 0.000000, 0.000000, '0'),
(97, 11, 'ETA', '', 'ESPIRITO SANTO I', 'ESPIRITO SANTO', 'RN', -6.335000, -35.299000, '0'),
(98, 11, 'ETA', '', 'ESPIRITO SANTO II VARZEA', 'ESPIRITO SANTO', 'RN', -6.334000, -35.370998, '0'),
(99, 11, 'ETA', '', 'CALDEIRAO - SANTANA DO SERIDO', 'SANTANA DO SERIDO', 'RN', -6.705000, -36.693001, '0'),
(100, 11, 'ETE', '', 'ETE - DO BALDO', 'NATAL', 'RN', -5.790000, -35.210999, '0'),
(101, 11, 'ETE', '', 'ETE-PARNAMIRIM', 'PARNAMIRIM', 'RN', -5.935000, -35.237999, '0'),
(102, 11, 'ETA', '', 'EXTREMOZ', 'EXTREMOZ', 'RN', -5.726000, -35.282001, '0'),
(103, 11, 'ETA', '', 'FELIPE CAMARA', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(104, 11, 'ETA', '', 'FELIPE CAMARAO - P01', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(105, 11, 'ETA', '', 'FELIPE CAMARAO - P10', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(106, 11, 'ETA', 'CAICO', 'FLORANEA EB4', 'FLORANIA', 'RN', -6.123000, -36.806999, '0'),
(107, 11, 'ETA', '', 'FRANCISCO CAMPOS - P9', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(108, 11, 'ETA', '', 'FRANCISCO DANTAS', 'FRANCISCO DANTAS', 'RN', 0.000000, 0.000000, '0'),
(109, 11, 'ETA', '', 'GARGALHEIRAS', 'ACARI', 'RN', -6.427000, -36.603001, '0'),
(110, 11, 'ETA', '', 'GRAMORE', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(111, 11, 'ETA', '', 'GUARAPES P4', 'NATAL', 'RN', -5.840000, -35.273998, '0'),
(112, 11, 'ETA', '', 'IPANGUACU', 'IPANGUACU', 'RN', -5.508000, -36.860001, '0'),
(113, 11, 'ETA', '', 'IPUEIRA', 'IPUEIRA', 'RN', -6.814000, -37.201000, '0'),
(114, 11, 'ETA', '', 'ITAJA - ADUTORA SERTAO CENTRAL', 'ITAJA', 'RN', -5.631000, -36.861000, '0'),
(115, 11, 'ETA', '', 'ITAU', 'ITAU', 'RN', -5.837000, -37.987000, '0'),
(116, 11, 'ETA', '', 'JANDAIRA', 'JANDAIRA', 'RN', 0.000000, 0.000000, '0'),
(117, 11, 'ETA', '', 'JANDAIRA - P02', 'JANDAIRA', 'RN', 0.000000, 0.000000, '0'),
(118, 11, 'ETA', '', 'JANDAIRA - P03', 'JANDAIRA', 'RN', 0.000000, 0.000000, '0'),
(119, 11, 'ETA', '', 'JANDAIRA - P05', 'JANDAIRA', 'RN', 0.000000, 0.000000, '0'),
(120, 11, 'ETA', '', 'JARDIM DE ANGICOS', 'JARDIM DE ANGICOS', 'RN', 0.000000, 0.000000, '0'),
(121, 11, 'ETA', '', 'JARDIM DE PIRANHAS - ETA ESCRITORIO LOCAL', 'JARDIM DE PIRANHAS', 'RN', -6.379000, -37.347000, '0'),
(122, 11, 'ETA', '', 'JARDIM DO SERIDO - PASSAGEM DAS TRAIRAS ', 'JARDIM DO SERIDO', 'RN', -6.517000, -36.937000, '0'),
(123, 11, 'ETA', '', 'JARDIM PROGRESSO', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(124, 11, 'ETA', '', 'JERONIMO ROSADO - EB - 1', 'ACU', 'RN', -5.614000, -36.896000, '0'),
(125, 11, 'ETA', '', 'JERONIMO ROSADO - EB - 2', 'MOSSORO', 'RN', -5.236000, -37.317001, '0'),
(126, 11, 'ETA', '', 'JIQUI', 'NATAL', 'RN', -5.917000, -35.188000, '0'),
(127, 11, 'ETA', '', 'JIQUI - P1', 'NATAL', 'RN', -5.862000, -35.208000, '0'),
(128, 11, 'ETA', '', 'JOSE DA PENHA', 'JOSE DA PENHA', 'RN', 0.000000, 0.000000, '0'),
(129, 11, 'ETA', '', 'JUCURUTU', 'JUCURUTU', 'RN', -6.034000, -37.016998, '0'),
(130, 11, 'ETA', '', 'JUNDIA', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(131, 11, 'ETA', 'LITORAL SUL', 'LAGOA NOVA I', 'LAGOA NOVA', 'RN', 0.000000, 0.000000, '0'),
(132, 11, 'ETA', 'LITORAL SUL', 'LAGOA NOVA II', 'LAGOA NOVA', 'RN', 0.000000, 0.000000, '0'),
(133, 11, 'ETA', '', 'LAJES - ADUTORA SERTAO CENTRAL', 'LAJES', 'RN', -5.690000, -36.321999, '0'),
(134, 11, 'ETA', '', 'LAJES - CABUGI', 'LAJES', 'RN', 0.000000, 0.000000, '0'),
(135, 11, 'ETA', 'LITORAL NORTE', 'MACAIBA - GRANJA RECREIO', 'MACAIBA', 'RN', -5.875000, -35.307999, '0'),
(136, 11, 'ETA', '', 'MACAU - ETA TAMBAUBA', 'MACAU', 'RN', -5.160000, -36.597000, '0'),
(137, 11, 'ETA', '', 'MARCELINO VIEIRA', 'MARCELINO VIEIRA', 'RN', 0.000000, 0.000000, '0'),
(138, 11, 'ETA', '', 'MARTINS', 'MARTINS', 'RN', -6.094000, -37.911999, '0'),
(139, 11, 'ETA', '', 'MEDIO OESTE', 'ACU', 'RN', -5.886000, -36.994999, '0'),
(140, 11, 'ETA', '', 'MONTANHAS', 'MONTANHAS', 'RN', -6.479000, -35.292999, '0'),
(141, 11, 'ETA', '', 'MONTE ALEGRE', 'MONTE ALEGRE', 'RN', 0.000000, 0.000000, '0'),
(142, 11, 'ETA', '', 'MOSSORO', 'MOSSORO', 'RN', 0.000000, 0.000000, '0'),
(143, 11, 'ETA', '', 'NISIA FLORESTA - ETA BOMFIM - ADUT. MONSEN. EXP.', 'NISIA FLORESTA', 'RN', 0.000000, 0.000000, '0'),
(144, 11, 'ETA', '', 'NOVA CRUZ', 'NOVA CRUZ', 'RN', -6.486000, -35.426998, '0'),
(145, 11, 'ETA', '', 'NOVA PARNAMIRIM - P11', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(146, 11, 'ETA', '', 'NOVA PARNAMIRIM - P20', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(147, 11, 'ETA', '', 'NOVA PARNAMIRIM - P29', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(148, 11, 'ETA', '', 'NOVO CAMPO - P1', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(149, 11, 'ETA', '', 'OURO BRANCO ETA', 'OURO BRANCO', 'RN', -6.709000, -36.950001, '0'),
(150, 11, 'ETA', '', 'P20 - ZONA NORTE', 'NATAL', 'RN', -5.739000, -35.280998, '0'),
(151, 11, 'ETA', '', 'P36 - ZONA NORTE', 'NATAL', 'RN', -5.752000, -35.256001, '0'),
(152, 11, 'ETA', '', 'P56 - ZONA NORTE', 'NATAL', 'RN', -5.747000, -35.230000, '0'),
(153, 11, 'ETA', '', 'P6 - MOSSORO', 'MOSSORO', 'RN', -5.176000, -37.361000, '0'),
(154, 11, 'ETA', '', 'PALMA', 'CAICO', 'RN', -6.629000, -37.150002, '0'),
(155, 11, 'ETA', '', 'PARELHAS', 'PARELHAS', 'RN', -6.694000, -36.631001, '0'),
(156, 11, 'ETA', '', 'PARNAMIRIM - LAGOA DO BONFIM', 'PARNAMIRIM', 'RN', -6.041000, -35.226002, '0'),
(157, 11, 'ETA', '', 'PARNAMIRIM I', 'PARNAMIRIM', 'RN', -5.921000, -35.263000, '0'),
(158, 11, 'ETA', '', 'PARNAMIRIM II - RIACHO VERMELHO', 'PARNAMIRIM', 'RN', -5.933000, -35.271999, '0'),
(159, 11, 'ETA', '', 'PARQUE DAS DUNAS', 'NATAL', 'RN', -5.811000, -35.193001, '0'),
(160, 11, 'ETA', '', 'PAU DOS FERROS', 'PAU DOS FERROS', 'RN', -6.146000, -38.193001, '0'),
(161, 11, 'ETA', '', 'PEDRO VELHO', 'PEDRO VELHO', 'RN', 0.000000, 0.000000, '0'),
(162, 11, 'ETA', 'ASSU', 'PENDENCIAS', 'PENDENCIAS', 'RN', -5.263000, -36.715000, '0'),
(163, 11, 'ETA', '', 'PILOES', 'PILOES', 'RN', 0.000000, 0.000000, '0'),
(164, 11, 'ETA', '', 'PIRANGI', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(165, 11, 'ETA', '', 'PLANALTO', 'PAU DOS FERROS', 'RN', 0.000000, 0.000000, '0'),
(166, 11, 'ETA', '', 'PLANALTO - P01', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(167, 11, 'ETA', '', 'PLANALTO - P02', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(168, 11, 'ETA', '', 'PLANALTO - P03', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(169, 11, 'ETA', '', 'PLANALTO - P05', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(171, 11, 'ETA', '', 'PLANALTO P7', 'NATAL', 'RN', -5.835000, -35.262001, '0'),
(172, 11, 'ETA', '', 'PLANALTO P9', 'NATAL', 'RN', -5.835000, -35.264999, '0'),
(173, 11, 'ETA', '', 'PONTA NEGRA', 'NATAL', 'RN', -5.880000, -35.181999, '0'),
(174, 11, 'ETA', '', 'PORTALEGRE', 'PORTALEGRE', 'RN', 0.000000, 0.000000, '0'),
(175, 11, 'ETA', '', 'POTENGI - ALTO DA TORRE', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(176, 11, 'ETA', '', 'POTENGI - POCO 35', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(177, 11, 'ETA', '', 'POTENGI - POCO 44', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(178, 11, 'ETA', '', 'PUREZA', 'PUREZA', 'RN', 0.000000, 0.000000, '0'),
(179, 11, 'ETA', '', 'REDINHA P57', 'NATAL', 'RN', -5.746000, -35.233002, '0'),
(180, 11, 'ETA', '', 'RIACHUELO', 'RIACHUELO', 'RN', 0.000000, 0.000000, '0'),
(181, 11, 'ETA', '', 'RIO BAHIA P2', 'NATAL', 'RN', -5.840000, -35.276001, '0'),
(182, 11, 'ETA', '', 'RODOLFO FERNANDES', 'RODOLFO FERNANDES', 'RN', 0.000000, 0.000000, '0'),
(183, 11, 'ETA', '', 'SAN VALE - P1', 'NATAL', 'RN', -5.854000, -35.216999, '0'),
(184, 11, 'ETA', '', 'SANTA CRUZ - EB - 16', 'SANTA CRUZ', 'RN', -6.247000, -35.966000, '0'),
(185, 11, 'ETA', '', 'SANTA FE', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(186, 11, 'ETA', '', 'SANTA TEREZA - P28', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(187, 11, 'ETA', '', 'SANTANA DO MATOS', 'SANTANA DO MATOS', 'RN', -5.966000, -36.660000, '0'),
(188, 11, 'ETA', '', 'SANTANA DO SERIDO', 'SANTANA DO SERIDO', 'RN', -6.772000, -36.735001, '0'),
(189, 11, 'ETA', '', 'SAO FERNANDO', 'SAO FERNANDO', 'RN', -6.376000, -37.185001, '0'),
(190, 11, 'ETA', '', 'SAO JOAO DO SABUGI', 'SAO JOAO DO SABUGI', 'RN', -6.717000, -37.203999, '0'),
(191, 11, 'ETA', '', 'SAO JOSE DO MIPIBU', 'SAO JOSE DE MIPIBU', 'RN', -6.075000, -35.231998, '0'),
(192, 11, 'ETA', '', 'SAO MIGUEL', 'SAO MIGUEL', 'RN', -6.215000, -38.429001, '0'),
(193, 11, 'ETA', '', 'SAO RAFAEL', 'SAO RAFAEL', 'RN', -5.802000, -36.879002, '0'),
(194, 11, 'ETE', '', 'ETE SAO TOME', 'SAO TOME', 'RN', -5.973000, -36.070000, '0'),
(546, 13, 'ETA', '', 'ARACAGI', 'ARACAGI', 'PB', -6.852000, -35.293999, '0'),
(196, 11, 'ETA', '', 'SERRA DE SANTANA', 'FLORANIA', 'RN', -6.128000, -36.820999, '0'),
(197, 25, 'ETA', '', 'SAAE - SERRA NEGRA DO NORTE', 'SERRA NEGRA DO NORTE', 'RN', -6.670000, -37.390999, '0'),
(198, 11, 'ETA', '', 'SERRINHA DOS PINTOS', 'SERRINHA DOS PINTOS', 'RN', 0.000000, 0.000000, '0'),
(199, 11, 'ETA', '', 'TORRES P5', 'NATAL', 'RN', -5.844000, -35.271999, '0'),
(200, 11, 'ETA', 'LITORAL SUL', 'TOUROS - BOQUEIRAO', 'NATAL', 'RN', -5.251000, -35.532001, '0'),
(201, 11, 'ETA', '', 'UMARIZAL', 'UMARIZAL', 'RN', -5.990000, -37.818001, '0'),
(202, 11, 'ETA', '', 'VERA CRUZ', 'VERA CRUZ', 'RN', -6.041000, -35.446999, '0'),
(203, 11, 'ETA', '', 'ZONA NORTE - P23', 'NATAL', 'RN', -5.739000, -35.224998, '0'),
(204, 11, 'ETA', '', 'ZONA NORTE - P57', 'NATAL', 'RN', -5.746000, -35.233002, '0'),
(205, 11, 'ETA', '', 'ZONA NORTE - POCO 37', 'NATAL', 'RN', 0.000000, 0.000000, '0'),
(206, 11, 'ETA', 'NORTE', 'ZONA-16', 'NATAL', 'RN', -5.726000, -35.248001, '0'),
(207, 12, 'ETA', '', 'ETA OESTE', 'CAUCAIA', 'CE', -3.787000, -38.655998, '0'),
(208, 12, 'ETA', '', 'PAVUNA', 'PACATUBA', 'CE', -3.915000, -38.598999, '0'),
(209, 13, 'ETA', '', 'AGUA BRANCA', 'AGUA BRANCA', 'PB', 0.000000, 0.000000, '0'),
(210, 13, 'ETA', '', 'ALAGOA GRANDE', 'ALAGOA GRANDE', 'PB', 0.000000, 0.000000, '0'),
(211, 13, 'ETA', '', 'ALAGOA NOVA', 'ALAGOA NOVA', 'PB', 0.000000, 0.000000, '0'),
(212, 13, 'ETA', '', 'ALGODAO DE JANDAIRA', 'ALGODAO DE JANDAIRA', 'PB', 0.000000, 0.000000, '0'),
(213, 13, 'ETA', '', 'ALHANDRA CLORACAO', 'ALHANDRA', 'PB', -7.435000, -34.903000, '0'),
(214, 13, 'ETA', '', 'ALHANDRA PRE-CLORACAO', 'ALHANDRA', 'PB', 0.000000, 0.000000, '1'),
(215, 13, 'ETA', '', 'APARECIDA', 'APARECIDA', 'PB', -6.786000, -38.077999, '0'),
(216, 13, 'ETA', '', 'ARARA', 'ARARA', 'PB', 0.000000, 0.000000, '0'),
(217, 13, 'ETA', 'BORBOREMA', 'AREIA', 'AREIA', 'PB', -6.923000, -35.667000, '0'),
(218, 13, 'ETA', '', 'AREIA - SAULO MAIA', 'AREIA', 'PB', 0.000000, 0.000000, '0'),
(219, 13, 'ETA', '', 'AREIAL', 'AREIAL', 'PB', 0.000000, 0.000000, '0'),
(220, 13, 'ETA', 'BORBOREMA', 'AROEIRAS', 'AROEIRAS', 'PB', 0.000000, 0.000000, '0'),
(221, 13, 'ETA', '', 'BANANEIRAS', 'BANANEIRAS', 'PB', -6.762000, -35.634998, '0'),
(222, 13, 'ETA', '', 'BARRA DE SANTA ROSA', 'BARRA DE SANTA ROSA', 'PB', 0.000000, 0.000000, '0'),
(223, 13, 'ETA', 'BORBOREMA', 'BARRA DE SAO MIGUEL', 'BARRA DE SAO MIGUEL', 'PB', -7.747000, -36.313999, '0'),
(224, 13, 'ETA', 'BORBOREMA', 'BARRAGEM SAO JOSE', 'MONTEIRO', 'PB', 0.000000, 0.000000, '0'),
(225, 13, 'ETA', '', 'BELEM', 'BELEM', 'PB', -6.726000, -35.555000, '0'),
(226, 13, 'ETA', 'BORBOREMA', 'BOA VISTA', 'BOA VISTA', 'PB', 0.000000, 0.000000, '0'),
(227, 13, 'ETA', '', 'BOM JESUS', 'BOM JESUS', 'PB', -6.896000, -38.523998, '0'),
(228, 13, 'ETA', '', 'BONITO DE SANTA FE', 'BONITO DE SANTA FE', 'PB', -7.315000, -38.516998, '0'),
(229, 13, 'ETA', 'BORBOREMA', 'BOQUEIRAO', 'BOQUEIRAO', 'PB', -7.484000, -36.136002, '0'),
(230, 13, 'ETA', '', 'BREJO DO CRUZ', 'BREJO DO CRUZ', 'PB', -6.344000, -37.500000, '0'),
(231, 13, 'ETA', 'RIO DO PEIXE', 'BREJO DOS SANTOS', 'BREJO DOS SANTOS', 'PB', -6.373000, -37.830002, '0'),
(232, 13, 'ETA', '', 'CAAPORA', 'CAAPORA', 'PB', -7.510000, -34.924999, '0'),
(233, 13, 'ETA', 'BORBOREMA', 'CABACEIRAS', 'CABACEIRAS', 'PB', 0.000000, 0.000000, '0'),
(234, 13, 'ETA', '', 'CACHOEIRA DOS INDIOS', 'CACHOEIRA DOS INDIOS', 'PB', 0.000000, 0.000000, '0'),
(235, 13, 'ETA', '', 'CACIMBA DE DENTRO', 'CACIMBA DE DENTRO', 'PB', -6.650000, -35.789001, '0'),
(236, 13, 'ETA', '', 'CACIMBAS', 'CACIMBAS', 'PB', 0.000000, 0.000000, '0'),
(237, 13, 'ETA', '', 'CAJA', 'CAMPINA GRANDE', 'PB', 0.000000, 0.000000, '0'),
(238, 13, 'ETA', 'ALTO PIRANHAS', 'CAJAZEIRAS (ENG. AVIDOS)', 'CAJAZEIRAS', 'PB', -6.977000, -38.456001, '0'),
(239, 13, 'ETA', '', 'CAJAZEIRINHAS', 'CAJAZEIRINHAS', 'PB', 0.000000, 0.000000, '0'),
(240, 13, 'ETA', 'BORBOREMA', 'CAMALAU', 'CAMALAU', 'PB', -7.888000, -36.821999, '0'),
(241, 13, 'ETA', '', 'CAMPINA GRANDE', 'CAMPINA GRANDE', 'PB', -7.385000, -35.974998, '0'),
(242, 13, 'ETA', 'LITORAL', 'CAPIM', 'CAPIM', 'PB', 0.000000, 0.000000, '0'),
(243, 13, 'ETA', '', 'CARAUBAS', 'CARAUBAS', 'PB', -7.762000, -36.548000, '0'),
(244, 13, 'ETA', '', 'CARRAPATEIRA', 'CARRAPATEIRA', 'PB', 0.000000, 0.000000, '0'),
(245, 13, 'ETA', '', 'CASSERENGUE', 'CASSERENGUE', 'PB', 0.000000, 0.000000, '0'),
(246, 13, 'ETA', 'ESPINHARAS', 'CATINGUEIRA', 'CATINGUEIRA', 'PB', -7.092000, -37.647999, '0'),
(247, 13, 'ETA', '', 'CATOLE DO ROCHA', 'CATOLE DO ROCHA', 'PB', -6.344000, -37.748001, '0'),
(248, 13, 'ETA', '', 'CEPILHO', 'AREIA', 'PB', 0.000000, 0.000000, '0'),
(249, 13, 'ETA', '', 'CHA DOS PEREIROS', 'INGA', 'PB', 0.000000, 0.000000, '0'),
(250, 13, 'ETA', '', 'CONCEICAO', 'CONCEICAO', 'PB', 0.000000, 0.000000, '0'),
(251, 13, 'ETA', '', 'CONDE', 'CONDE', 'PB', 0.000000, 0.000000, '0'),
(252, 13, 'ETA', '', 'CONGO', 'CONGO', 'PB', 0.000000, 0.000000, '0'),
(253, 13, 'ETA', 'BORBOREMA', 'COXIXOLA', 'COXIXOLA', 'PB', 0.000000, 0.000000, '0'),
(254, 13, 'ETA', '', 'CRUZ DO ESPIRITO SANTO', 'CRUZ DO ESPIRITO SANTO', 'PB', -7.127000, -35.098000, '0'),
(255, 13, 'ETA', 'BORBOREMA', 'CUBATI', 'CUBATI', 'PB', 0.000000, 0.000000, '0'),
(256, 13, 'ETA', '', 'CUITE', 'CUITE', 'PB', 0.000000, 0.000000, '0'),
(257, 13, 'ETA', 'BREJO', 'CUITEGI', 'CUITEGI', 'PB', -6.906000, -35.535000, '0'),
(258, 13, 'ETA', '', 'DESTERRO', 'DESTERRO', 'PB', 0.000000, 0.000000, '0'),
(259, 13, 'ETA', '', 'DIAMANTE', 'DIAMANTE', 'PB', 0.000000, 0.000000, '0'),
(260, 13, 'ETA', '', 'DUAS ESTRADAS', 'DUAS ESTRADAS', 'PB', -6.703000, -35.442001, '0'),
(261, 13, 'ETA', 'BORBOREMA', 'EB3 - MONTEIRO', 'MONTEIRO', 'PB', 0.000000, 0.000000, '0'),
(262, 13, 'ETA', '', 'EMAS', 'EMAS', 'PB', -7.097000, -37.715000, '0'),
(263, 13, 'ETA', 'BORBOREMA', 'ESPERANCA', 'ESPERANCA', 'PB', -7.034000, -35.859001, '0'),
(264, 13, 'ETA', 'LITORAL', 'ITABAIANA - NOVA ETA II', 'ITABAIANA', 'PB', -7.343000, -35.335999, '0'),
(265, 13, 'ETA', '', 'ITABAIANA - FORUM ETA III', 'ITABAIANA', 'PB', -7.317000, -35.341999, '0'),
(266, 13, 'ETA', '', 'ITABAIANA - VELHA ETA I', 'ITABAIANA', 'PB', -7.342000, -35.334999, '0'),
(267, 13, 'ETA', 'BORBOREMA', 'FAGUNDES', 'FAGUNDES', 'PB', -7.350000, -35.783001, '0'),
(268, 13, 'ETA', 'BORBOREMA', 'FREI MARTINHO', 'FREI MARTINHO', 'PB', 0.000000, 0.000000, '0'),
(269, 13, 'ETA', '', 'GADO BRAVO', 'GADO BRAVO', 'PB', 0.000000, 0.000000, '0'),
(270, 13, 'ETA', '', 'GRAMAME', 'JOAO PESSOA', 'PB', -7.228000, -34.919998, '0'),
(271, 13, 'ETA', '', 'GRAVATA', 'SAO JOAO DO RIO DO PEIXE', 'PB', -7.385000, -35.976002, '0'),
(272, 13, 'ETA', '', 'GUARABIRA', 'GUARABIRA', 'PB', 0.000000, 0.000000, '0'),
(273, 13, 'ETA', '', 'GURINHEM', 'GURINHEM', 'PB', 0.000000, 0.000000, '0'),
(274, 13, 'ETA', '', 'GURJAO', 'GURJAO', 'PB', -7.248000, -36.494999, '0'),
(275, 13, 'ETA', '', 'IBIARA', 'IBIARA', 'PB', 0.000000, 0.000000, '0'),
(276, 13, 'ETA', '', 'IGARACY', 'IGARACY', 'PB', -7.176000, -38.154999, '0'),
(277, 13, 'ETA', '', 'IMACULADA', 'IMACULADA', 'PB', 0.000000, 0.000000, '0'),
(278, 13, 'ETA', '', 'INGA', 'INGA', 'PB', 0.000000, 0.000000, '0'),
(279, 13, 'ETA', '', 'IPUEIRA', 'PAULISTA', 'PB', 0.000000, 0.000000, '0'),
(280, 13, 'ETA', '', 'ITAPORANGA ETA VELHA', 'ITAPORANGA', 'PB', -7.323000, -38.228001, '0'),
(281, 13, 'ETA', 'BORBOREMA', 'ITATUBA', 'ITATUBA', 'PB', -7.415000, -35.637001, '0'),
(282, 13, 'ETA', '', 'JACARAU', 'JACARAU', 'PB', -6.619000, -35.286999, '0'),
(283, 13, 'ETA', 'LITORAL', 'JACUMA', 'CONDE', 'PB', -7.286000, -34.805000, '0'),
(284, 13, 'ETA', '', 'JERICO', 'JERICO', 'PB', -6.550000, -37.800999, '0'),
(285, 13, 'ETA', 'BORBOREMA', 'JUAREZ TAVORA', 'JUAREZ TAVORA', 'PB', -7.166000, -35.592999, '0'),
(286, 13, 'ETA', 'BORBOREMA', 'JUAZEIRINHO', 'JUAZEIRINHO', 'PB', 0.000000, 0.000000, '0'),
(287, 13, 'ETA', '', 'JURIPIRANGA', 'JURIPIRANGA', 'PB', 0.000000, 0.000000, '0'),
(288, 13, 'ETA', 'ESPINHARAS', 'JURU', 'JURU', 'PB', 0.000000, 0.000000, '0'),
(289, 13, 'ETA', '', 'LAGOA DO MATO', 'REMIGIO', 'PB', 0.000000, 0.000000, '0'),
(290, 13, 'ETA', '', 'LAGOA SECA', 'LAGOA SECA', 'PB', 0.000000, 0.000000, '0'),
(291, 13, 'ETA', '', 'LIVRAMENTO', 'LIVRAMENTO', 'PB', 0.000000, 0.000000, '0'),
(292, 13, 'ETA', '', 'LUCENA', 'LUCENA', 'PB', -6.898000, -34.872002, '0'),
(293, 13, 'ETA', '', 'MALTA', 'MALTA', 'PB', 0.000000, 0.000000, '0'),
(294, 13, 'ETA', '', 'MALTA-CONDADO', 'CONDADO', 'PB', 0.000000, 0.000000, '0'),
(295, 13, 'ETA', '', 'MAMANGUAPE', 'MAMANGUAPE', 'PB', -6.837000, -35.132000, '0'),
(296, 13, 'ETA', '', 'MANAIRA', 'MANAIRA', 'PB', 0.000000, 0.000000, '0'),
(297, 13, 'ETA', '', 'MARES - JOAO PESSOA', 'JOAO PESSOA', 'PB', -7.153000, -34.910000, '0'),
(298, 13, 'ETA', '', 'MARI', 'MARI', 'PB', 0.000000, 0.000000, '0'),
(299, 13, 'ETA', '', 'MARIZOPOLIS', 'MARIZOPOLIS', 'PB', 0.000000, 0.000000, '0'),
(300, 13, 'ETA', '', 'MASSARANDUBA', 'MASSARANDUBA', 'PB', 0.000000, 0.000000, '0'),
(301, 13, 'ETA', '', 'MATINHAS', 'MATINHAS', 'PB', 0.000000, 0.000000, '0'),
(302, 13, 'ETA', '', 'MATO GROSSO', 'MATO GROSSO', 'PB', 0.000000, 0.000000, '0'),
(303, 13, 'ETA', '', 'MATUREIA', 'MATUREIA', 'PB', 0.000000, 0.000000, '0'),
(304, 13, 'ETA', '', 'MOGEIRO', 'MOGEIRO', 'PB', 0.000000, 0.000000, '0'),
(305, 13, 'ETA', '', 'MONTADAS', 'MONTADAS', 'PB', 0.000000, 0.000000, '0'),
(306, 13, 'ETA', '', 'MONTE HOREBE', 'MONTE HOREBE', 'PB', -7.213000, -38.587002, '0'),
(307, 13, 'ETA', 'BORBOREMA', 'MONTEIRO', 'MONTEIRO', 'PB', -7.913000, -37.109001, '0'),
(308, 13, 'ETA', '', 'MULUNGU', 'MULUNGU', 'PB', 0.000000, 0.000000, '0'),
(309, 13, 'ETA', '', 'NATUBA ETA NOVA', 'NATUBA', 'PB', -7.641000, -35.549000, '0'),
(310, 13, 'ETA', '', 'NAZAREZINHO', 'NAZAREZINHO', 'PB', 0.000000, 0.000000, '0'),
(311, 13, 'ETA', '', 'NOVA FLORESTA', 'NOVA FLORESTA', 'PB', 0.000000, 0.000000, '0'),
(312, 13, 'ETA', '', 'NOVA OLINDA', 'NOVA OLINDA', 'PB', -7.482000, -38.041000, '0'),
(313, 13, 'ETA', '', 'NOVA PALMEIRA', 'NOVA PALMEIRA', 'PB', 0.000000, 0.000000, '0'),
(314, 13, 'ETA', '', 'OLHO DAGUA', 'OLHO DAGUA', 'PB', -7.216000, -37.752998, '0'),
(315, 13, 'ETA', '', 'OURO VELHO', 'OURO VELHO', 'PB', 0.000000, 0.000000, '0'),
(316, 13, 'ETA', '', 'PATOS', 'PATOS', 'PB', -7.059000, -37.271999, '0'),
(317, 13, 'ETA', '', 'PAULISTA', 'PAULISTA', 'PB', -6.600000, -37.624001, '0'),
(318, 13, 'ETA', '', 'PEDRAS DE FOGO', 'PEDRAS DE FOGO', 'PB', -7.392000, -35.105000, '0'),
(319, 13, 'ETA', '', 'PEDRO VELHO', 'AROEIRAS', 'PB', 0.000000, 0.000000, '0'),
(320, 13, 'ETA', '', 'PIANCO', 'PIANCO', 'PB', -7.188000, -37.914001, '0'),
(321, 13, 'ETA', 'BORBOREMA', 'PICUI', 'PICUI', 'PB', 0.000000, 0.000000, '0'),
(322, 13, 'ETA', '', 'PILAR', 'PILAR', 'PB', 0.000000, 0.000000, '0'),
(323, 13, 'ETA', '', 'PILOES', 'PILOES', 'PB', 0.000000, 0.000000, '0'),
(324, 13, 'ETA', '', 'PIRPIRITUBA', 'PIRPIRITUBA', 'PB', 0.000000, 0.000000, '0'),
(325, 13, 'ETA', 'LITORAL', 'PITIMBU', 'PITIMBU', 'PB', -7.472000, -34.811001, '0'),
(326, 13, 'ETA', 'BORBOREMA', 'POCINHOS', 'POCINHOS', 'PB', 0.000000, 0.000000, '0'),
(327, 13, 'ETA', '', 'POMBAL', 'POMBAL', 'PB', -6.773000, -37.792999, '0'),
(328, 13, 'ETA', '', 'PRATA', 'PRATA', 'PB', 0.000000, 0.000000, '0'),
(329, 13, 'ETA', '', 'PRINCESA ISABEL', 'PRINCESA ISABEL', 'PB', -7.733000, -37.992001, '0'),
(330, 13, 'ETA', '', 'PUXINANA', 'PUXINANA', 'PB', 0.000000, 0.000000, '0'),
(331, 13, 'ETA', '', 'REMIGIO', 'REMIGIO', 'PB', 0.000000, 0.000000, '0'),
(332, 13, 'ETA', '', 'REMIGIO (Cepilho)', 'REMIGIO', 'PB', -6.988000, -35.775002, '0'),
(333, 13, 'ETA', '', 'RIACHO DOS CAVALOS', 'RIACHO DOS CAVALOS', 'PB', -6.432000, -37.651001, '0'),
(334, 13, 'ETA', '', 'RIACHO STO. ANTONIO', 'RIACHO DE SANTO ANTONIO', 'PB', 0.000000, 0.000000, '0'),
(335, 13, 'ETA', '', 'RIO TINTO', 'RIO TINTO', 'PB', 0.000000, 0.000000, '0'),
(336, 13, 'ETA', 'LITORAL', 'SALGADO DE SAO FELIX', 'SALGADO DE SAO FELIX', 'PB', -7.357000, -35.443001, '0'),
(337, 13, 'ETA', '', 'SANTA CRUZ', 'SANTA CRUZ', 'PB', -6.535000, -38.051998, '0'),
(338, 13, 'ETA', '', 'SANTA GERTRUDES', 'PATOS', 'PB', -6.948000, -37.396999, '0'),
(339, 13, 'ETA', '', 'SANTA HELENA', 'SANTA HELENA', 'PB', 0.000000, 0.000000, '0'),
(340, 13, 'ETA', '', 'SANTA LUZIA', 'SANTA LUZIA', 'PB', -6.864000, -36.917000, '0'),
(341, 13, 'ETA', 'LITORAL', 'SANTA RITA', 'SANTA RITA', 'PB', -7.140000, -34.983002, '0'),
(342, 13, 'ETA', '', 'SANTA TEREZINHA', 'SANTA TERESINHA', 'PB', -7.085000, -37.445999, '0'),
(343, 13, 'ETA', '', 'SANTANA DE MANGUEIRA', 'SANTANA DE MANGUEIRA', 'PB', 0.000000, 0.000000, '0'),
(344, 13, 'ETA', '', 'SANTANA DOS GARROTES', 'SANTANA DOS GARROTES', 'PB', -7.390000, -37.987000, '0'),
(345, 13, 'ETA', '', 'SAO BENTINHO', 'SAO BENTINHO', 'PB', -6.892000, -37.729000, '0'),
(346, 13, 'ETA', '', 'SAO BENTO', 'SAO BENTO', 'PB', -6.494000, -37.449001, '0'),
(347, 13, 'ETA', '', 'SAO DOMINGOS', 'SAO DOMINGOS DO CARIRI', 'PB', 0.000000, 0.000000, '0'),
(348, 13, 'ETA', '', 'SAO GONCALO', 'SOUSA', 'PB', -6.846000, -38.325001, '0'),
(349, 13, 'ETA', '', 'SAO JOAO DO CARIRI', 'SAO JOAO DO CARIRI', 'PB', 0.000000, 0.000000, '0'),
(350, 13, 'ETA', '', 'SAO JOAO DO RIO DO PEIXE', 'SAO JOAO DO RIO DO PEIXE', 'PB', 0.000000, 0.000000, '0'),
(351, 13, 'ETA', '', 'SAO JOSE DA LAGOA TAPADA', 'SAO JOSE DA LAGOA TAPADA', 'PB', -6.944000, -38.162998, '0'),
(352, 13, 'ETA', '', 'SAO JOSE DE CAIANA', 'SAO JOSE DE CAIANA', 'PB', -7.252000, -38.299000, '0'),
(353, 13, 'ETA', '', 'SAO JOSE DE ESPINHARAS', 'SAO JOSE DE ESPINHARAS', 'PB', -6.842000, -37.321999, '0'),
(354, 13, 'ETA', '', 'SAO JOSE DO BOMFIM', 'SAO JOSE DO BONFIM', 'PB', -7.075000, -37.286999, '0'),
(355, 13, 'ETA', '', 'SAO JOSE DO SABUGI', 'SAO JOSE DO SABUGI', 'PB', -6.783000, -36.791000, '0'),
(356, 13, 'ETA', '', 'SAO JOSE DOS CORDEIROS', 'SAO JOSE DOS CORDEIROS', 'PB', 0.000000, 0.000000, '0'),
(357, 13, 'ETA', '', 'SAO JOSE PIRANHAS', 'SAO JOSE DE ESPINHARAS', 'PB', -7.124000, -38.500000, '0'),
(358, 13, 'ETA', '', 'SAO MAMEDE', 'SAO MAMEDE', 'PB', 0.000000, 0.000000, '0'),
(359, 13, 'ETA', '', 'SAO MIGUEL', 'SAO MIGUEL DE TAIPU', 'PB', 0.000000, 0.000000, '0'),
(360, 13, 'ETA', 'BORBOREMA', 'SAO SEBASTIAO DE LAGOA DE ROCA', 'SAO SEBASTIAO DE LAGOA DE ROCA', 'PB', -7.106000, -35.868000, '0'),
(361, 13, 'ETA', '', 'SAPE', 'SAPE', 'PB', -7.091000, -35.228001, '0'),
(362, 13, 'ETA', '', 'SERRA BRANCA', 'SERRA BRANCA', 'PB', 0.000000, 0.000000, '0'),
(363, 13, 'ETA', '', 'SERRA GRANDE', 'SERRA GRANDE', 'PB', 0.000000, 0.000000, '0'),
(364, 13, 'ETA', '', 'SERRA REDONDA', 'SERRA REDONDA', 'PB', 0.000000, 0.000000, '0'),
(365, 13, 'ETA', '', 'SERRARIA', 'SERRARIA', 'PB', -6.815000, -35.639000, '0'),
(366, 13, 'ETA', '', 'SOLANEA', 'SOLANEA', 'PB', -6.758000, -35.650002, '0'),
(367, 13, 'ETA', '', 'SOUSA', 'SOUSA', 'PB', 0.000000, 0.000000, '0'),
(368, 13, 'ETA', 'BORBOREMA', 'SUME - ETA VELHA', 'SUME', 'PB', 0.000000, 0.000000, '0'),
(369, 13, 'ETA', 'BORBOREMA', 'SUME-ADUTORA DO CONGO EB II', 'SUME', 'PB', -7.681000, -36.875999, '0'),
(370, 13, 'ETA', 'ESPINHARAS', 'TAPEROA', 'TAPEROA', 'PB', -7.216000, -36.826000, '0'),
(371, 13, 'ETA', '', 'TAVARES', 'TAVARES', 'PB', 0.000000, 0.000000, '0'),
(372, 13, 'ETA', '', 'TEIXEIRA', 'TEIXEIRA', 'PB', 0.000000, 0.000000, '0'),
(373, 13, 'ETA', '', 'TRIUNFO', 'TRIUNFO', 'PB', -6.580000, -38.601002, '0'),
(374, 13, 'ETA', '', 'UIRAUNA', 'UIRAUNA', 'PB', -6.512000, -38.414001, '0'),
(375, 13, 'ETA', '', 'UIRAUNA - CAPIVARA', 'UIRAUNA', 'PB', -6.542000, -38.465000, '0'),
(376, 13, 'ETA', 'BORBOREMA', 'UMBUZEIRO ETA VELHA', 'UMBUZEIRO', 'PB', -7.712000, -35.650002, '0'),
(377, 13, 'ETA', '', 'VARZEA', 'VARZEA', 'PB', -6.772000, -36.990002, '0'),
(378, 13, 'ETA', '', 'VISTA SERRANA', 'VISTA SERRANA', 'PB', -6.682000, -37.584999, '0'),
(379, 14, 'ETA', 'SERTAO', 'AGUA BRANCA - EE5', 'AGUA BRANCA', 'AL', -9.262000, -37.935001, '0'),
(380, 14, 'ETA', 'SERRANA', 'ANADIA', 'ANADIA', 'AL', -9.678000, -36.325001, '0'),
(381, 14, 'ETA', 'LESTE', 'BARRA DE SAO MIGUEL', 'BARRA DE SAO MIGUEL', 'AL', -9.829000, -35.903000, '0'),
(382, 14, 'ETA', 'BACIA', 'BATALHA', 'BATALHA', 'AL', -9.673000, -37.132000, '0'),
(383, 14, 'ETA', 'SERRANA', 'CAPELA', 'CAPELA', 'AL', -9.415000, -36.080002, '0'),
(384, 14, 'ETA', 'SERTAO', 'DELMIRO GOUVEIA - BARRAGEM LESTE', 'DELMIRO GOUVEIA', 'AL', -9.368000, -38.188999, '0'),
(385, 14, 'ETA', 'SERTAO', 'DELMIRO GOUVEIA - EE3', 'DELMIRO GOUVEIA', 'AL', -9.392000, -38.011002, '0'),
(386, 14, 'ETA', 'SERRANA', 'ESTRELA DE ALAGOAS', 'ESTRELA DE ALAGOAS', 'AL', -9.389000, -36.763000, '0'),
(387, 14, 'ETA', 'LESTE', 'FLEXEIRAS', 'FLEXEIRAS', 'AL', -9.280000, -35.721001, '0'),
(388, 14, 'ETA', 'LESTE', 'JOAQUIM GOMES', 'JOAQUIM GOMES', 'AL', -9.132000, -35.749001, '0'),
(389, 14, 'ETA', 'AGRESTE', 'JUNQUEIRO', 'CAJUEIRO', 'AL', -9.905000, -36.469002, '0'),
(390, 14, 'ETA', 'MACEIO', 'MACEIO - AVIACAO', 'MACEIO', 'AL', 0.000000, 0.000000, '0'),
(391, 14, 'ETA', 'MACEIO', 'MACEIO - CARDOSO', 'MACEIO', 'AL', -9.623000, -35.745998, '0'),
(392, 14, 'ETA', 'LESTE', 'MURICI - CACHOEIRA', 'MURICI', 'AL', 0.000000, 0.000000, '0'),
(393, 14, 'ETA', 'LESTE', 'MURICI - CANSANCAO', 'MURICI', 'AL', -9.319000, -35.950001, '0'),
(394, 14, 'ETA', 'LESTE', 'NOVO LINO', 'NOVO LINO', 'AL', -8.944000, -35.661999, '0'),
(395, 14, 'ETA', 'SERTAO', 'OLHO DAGUA DO CASADO', 'OLHO DAGUA DO CASADO', 'AL', -9.469000, -37.844002, '0'),
(396, 14, 'ETA', 'SERRANA', 'PALMEIRA DOS INDIOS', 'PALMEIRA DOS INDIOS', 'AL', -9.402000, -36.629002, '0'),
(397, 14, 'ETA', 'BACIA', 'PAO DE ACUCAR', 'PAO DE ACUCAR', 'AL', -9.705000, -37.415001, '0'),
(398, 14, 'ETA', 'SERRANA', 'PAULO JACINTO', 'PAULO JACINTO', 'AL', -9.359000, -36.365002, '0'),
(399, 14, 'ETA', 'AGRESTE', 'PIACABUCU', 'PIACABUCU', 'AL', -10.405000, -36.429001, '0'),
(400, 14, 'ETA', 'SERTAO', 'PIRANHAS', 'PIRANHAS', 'AL', -9.597000, -37.773998, '0'),
(401, 14, 'ETA', 'MACEIO', 'PRATAGY', 'MACEIO', 'AL', -9.558000, -35.737000, '0'),
(402, 14, 'ETA', 'SERRANA', 'QUEBRANGULO', 'QUEBRANGULO', 'AL', -9.315000, -36.473999, '0'),
(403, 14, 'ETA', 'SERRANA', 'QUEBRANGULO - CACAMBAS', 'QUEBRANGULO', 'AL', -9.303000, -36.478001, '0'),
(404, 14, 'ETA', 'LESTE', 'RIO LARGO - MATA DO ROLO', 'RIO LARGO', 'AL', -9.481000, -35.840000, '0'),
(405, 14, 'ETA', 'LESTE', 'RIO LARGO - TABULEIRO DO PINTO', 'RIO LARGO', 'AL', -9.505000, -35.812000, '0'),
(406, 14, 'ETA', 'LESTE', 'SATUBA', 'SATUBA', 'AL', -9.559000, -35.819000, '0'),
(407, 14, 'ETA', 'AGRESTE', 'TRAIPU', 'TRAIPU', 'AL', -9.962000, -36.997002, '0'),
(408, 17, 'ETA', '', '40 HORAS SABIA', 'ANANINDEUA', 'PA', 0.000000, 0.000000, '0'),
(409, 17, 'ETA', '', '5 SETOR', 'BELEM', 'PA', -1.427000, -48.456001, '0'),
(410, 17, 'ETA', '', 'ABAETETUBA', 'ABAETETUBA', 'PA', -1.721000, -48.882000, '0'),
(411, 17, 'ETA', '', 'ABAETETUBA ALGODOAL', 'ABAETETUBA', 'PA', 0.000000, 0.000000, '0'),
(412, 17, 'ETA', '', 'AFUA', 'AFUA', 'PA', 0.000000, 0.000000, '0'),
(413, 17, 'ETA', '', 'ALENQUER', 'ALENQUER', 'PA', 0.000000, 0.000000, '0'),
(414, 17, 'ETA', '', 'ALTAMIRA', 'ALTAMIRA', 'PA', 0.000000, 0.000000, '0'),
(415, 17, 'ETA', '', 'ANAJAS', 'ANAJAS', 'PA', 0.000000, 0.000000, '0'),
(416, 17, 'ETA', '', 'ANANINDEUA - CENTRO', 'ANANINDEUA', 'PA', -1.353000, -48.373001, '0'),
(417, 17, 'ETA', '', 'ARIRI 1', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(418, 17, 'ETA', '', 'ARIRI 2', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(419, 17, 'ETA', '', 'ARIRI-BOLONHA', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(420, 17, 'ETA', '', 'AUGUSTO CORREIA', 'AUGUSTO CORREA', 'PA', 0.000000, 0.000000, '0'),
(421, 17, 'ETA', 'METROPOLITANA', 'BELEM - BEJAMIM SODRE P5/ P8', 'BELEM', 'PA', -1.358000, -48.446999, '0'),
(422, 17, 'ETA', '', 'BENGUI', 'BELEM', 'PA', -1.375000, -48.442001, '0'),
(423, 17, 'ETA', '', 'BOLONHA', 'BELEM', 'PA', -1.418000, -48.438999, '0'),
(424, 17, 'ETA', '', 'BRAGANCA - CHUMUCUI', 'BRAGANCA', 'PA', -1.095000, -46.792000, '0'),
(425, 17, 'ETA', '', 'BREU BRANCO', 'BREU BRANCO', 'PA', 0.000000, 0.000000, '0'),
(426, 17, 'ETA', '', 'BREVES', 'BREVES', 'PA', -1.686000, -50.483002, '0'),
(427, 17, 'ETA', '', 'CACHOEIRA DOA ARARI', 'CACHOEIRA DO ARARI', 'PA', 0.000000, 0.000000, '0'),
(428, 17, 'ETA', 'METROPOLITANA', 'CANARINHO', 'BELEM', 'PA', -1.336000, -48.456001, '0'),
(429, 17, 'ETA', '', 'CAPANEMA - VILA TAUARI', 'CAPANEMA', 'PA', -1.123000, -47.058998, '0'),
(430, 17, 'ETA', '', 'CAPITAO POCO', 'CAPITAO POCO', 'PA', 0.000000, 0.000000, '0'),
(431, 17, 'ETA', '', 'CASTANHAL', 'CASTANHAL', 'PA', 0.000000, 0.000000, '0'),
(432, 17, 'ETA', 'BAIXO AMAZONAS', 'CASTANHAL - CAICARA', 'CASTANHAL', 'PA', -1.316000, -47.896000, '0'),
(433, 17, 'ETA', '', 'CATALINA', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(434, 17, 'ETA', '', 'CDP', 'BELEM', 'PA', -1.402000, -48.480999, '0'),
(435, 17, 'ETA', '', 'CHEGUEVARA', 'MARITUBA', 'PA', -1.368000, -48.308998, '0'),
(436, 17, 'ETA', '', 'CIDADE NOVA ( ANANINDEUA )', 'ANANINDEUA', 'PA', -1.336000, -48.382999, '0'),
(437, 17, 'ETA', '', 'COHAB', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(438, 17, 'ETA', '', 'CASTANHAL - COMANDANTE ASSIS', 'CASTANHAL', 'PA', -1.290000, -47.931999, '0'),
(439, 17, 'ETA', '', 'CONCEICAO DO ARAGUAIA', 'CONCEICAO DO ARAGUAIA', 'PA', -8.283000, -49.264000, '0'),
(440, 17, 'ETA', '', 'CONJUNTO MAGUARI', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(441, 17, 'ETA', '', 'COQUEIRO', 'BELEM', 'PA', -1.370000, -48.429001, '0'),
(442, 17, 'ETA', '', 'CORDEIRO DE FARIAS I', 'BELEM', 'PA', -1.350000, -48.464001, '0'),
(443, 17, 'ETA', '', 'CORDEIRO DE FARIAS II', 'BELEM', 'PA', -1.350000, -48.464001, '0'),
(444, 17, 'ETA', '', 'DOM ELISEU', 'DOM ELISEU', 'PA', -4.247000, -47.561001, '0'),
(445, 17, 'ETA', '', 'FARO', 'FARO', 'PA', 0.000000, 0.000000, '0'),
(446, 17, 'ETA', '', 'GUANABARA I', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(447, 17, 'ETA', '', 'GUANABARA II', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(448, 17, 'ETA', '', 'IGARAPE - MIRI C. NOVA', 'IGARAPE-MIRI', 'PA', 0.000000, 0.000000, '1'),
(449, 17, 'ETA', '', 'IGARAPE - MIRI ESCRITORIO', 'IGARAPE-MIRI', 'PA', 0.000000, 0.000000, '1'),
(450, 17, 'ETA', '', 'IGARAPE - MIRI ESTACAO', 'IGARAPE-MIRI', 'PA', -1.980000, -48.964001, '0'),
(451, 17, 'ETA', '', 'INHANGAPI', 'INHANGAPI', 'PA', 0.000000, 0.000000, '0'),
(452, 17, 'ETA', '', 'ITAITUBA', 'ITAITUBA', 'PA', -4.276000, -55.986000, '0'),
(453, 17, 'ETA', '', 'ITUPIRANGA', 'ITUPIRANGA', 'PA', 0.000000, 0.000000, '0'),
(454, 17, 'ETA', '', 'JACUNDA', 'JACUNDA', 'PA', 0.000000, 0.000000, '0'),
(455, 17, 'ETA', '', 'JADERLANDIA', 'BELEM', 'PA', -1.303000, -47.895000, '0'),
(456, 17, 'ETA', '', 'JURUTI', 'JURUTI', 'PA', 0.000000, 0.000000, '0'),
(457, 17, 'ETA', '', 'LIMOEIRO DO AJURU', 'LIMOEIRO DO AJURU', 'PA', 0.000000, 0.000000, '0'),
(458, 17, 'ETA', '', 'MAGALHAES BARATA', 'MAGALHAES BARATA', 'PA', 0.000000, 0.000000, '0'),
(459, 17, 'ETA', '', 'MAGUARI', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(460, 17, 'ETA', '', 'MAIUATA', 'IGARAPE-MIRI', 'PA', 0.000000, 0.000000, '0'),
(461, 17, 'ETA', '', 'MARABA CIDADE NOVA', 'MARABA', 'PA', 0.000000, 0.000000, '0'),
(462, 17, 'ETA', '', 'MARABA NOVA', 'MARABA', 'PA', -5.326000, -49.077000, '0'),
(463, 17, 'ETA', '', 'MARABA PIONEIRA', 'MARABA', 'PA', -5.339000, -49.124001, '0'),
(464, 17, 'ETA', '', 'MARAPANIN', 'MARAPANIM', 'PA', 0.000000, 0.000000, '0'),
(465, 17, 'ETA', '', 'MARITUBA BEIJA FLOR', 'MARITUBA', 'PA', 0.000000, 0.000000, '0'),
(466, 17, 'ETA', '', 'MARITUBA CENTRO', 'MARITUBA', 'PA', 0.000000, 0.000000, '0'),
(467, 17, 'ETA', '', 'MARITUBA COHAB', 'MARITUBA', 'PA', 0.000000, 0.000000, '0'),
(468, 17, 'ETA', '', 'MARUDA', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(469, 17, 'ETA', '', 'CASTANHAL - MILAGRE', 'CASTANHAL', 'PA', -1.304000, -47.908001, '0'),
(470, 17, 'ETA', '', 'MOCAJUBA', 'MOCAJUBA', 'PA', -2.585000, -49.509998, '0'),
(471, 17, 'ETA', '', 'MOJU', 'MOJU', 'PA', 0.000000, 0.000000, '0'),
(472, 17, 'ETA', '', 'MONTE ALEGRE', 'MONTE ALEGRE', 'PA', -1.994000, -54.055000, '0'),
(473, 17, 'ETA', '', 'MOSQUEIRO - BAIA DO SOL', 'BELEM', 'PA', -1.065000, -48.334999, '0'),
(474, 17, 'ETA', 'NORDESTE', 'NOVA TIMBOTEUA - ESCRITORIO', 'NOVA TIMBOTEUA', 'PA', -1.206000, -47.386002, '0'),
(475, 17, 'ETA', '', 'NOVO REPARTIMENTO', 'NOVO REPARTIMENTO', 'PA', -4.248000, -49.956001, '0'),
(476, 17, 'ETA', '', 'OBIDOS', 'OBIDOS', 'PA', -1.900000, -55.507999, '0'),
(477, 17, 'ETA', '', 'OEIRA DO PARA', 'OEIRAS DO PARA', 'PA', 0.000000, 0.000000, '0'),
(478, 17, 'ETA', 'BAIXO AMAZONAS', 'ORIXIMINA', 'ORIXIMINA', 'PA', -1.763000, -55.866001, '0'),
(479, 17, 'ETA', '', 'OUREM', 'OUREM', 'PA', 0.000000, 0.000000, '0'),
(480, 17, 'ETA', '', 'PAAR', 'BELEM', 'PA', -1.336000, -48.382999, '0'),
(481, 17, 'ETA', '', 'PANORAMA XXI', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(482, 17, 'ETA', 'NORDESTE', 'PEIXE BOI', 'PEIXE-BOI', 'PA', -1.188000, -47.316002, '0'),
(483, 17, 'ETA', '', 'PONTA DE PEDRAS', 'PONTA DE PEDRAS', 'PA', 0.000000, 0.000000, '0'),
(484, 17, 'ETA', '', 'PORTEL', 'PORTEL', 'PA', 0.000000, 0.000000, '0'),
(485, 17, 'ETA', '', 'PRAINHA', 'PRAINHA', 'PA', 0.000000, 0.000000, '0'),
(486, 17, 'ETA', '', 'PRATINHA', 'BELEM', 'PA', -1.376000, -48.480000, '0'),
(487, 17, 'ETA', '', 'R6', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(488, 17, 'ETA', '', 'SALGADO GRANDE', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(489, 17, 'ETA', '', 'SALINOPOLIS - ESCRITORIO ', 'SALINOPOLIS', 'PA', -0.621626, -47.354000, '0'),
(490, 17, 'ETA', '', 'SALVA TERRA', 'SALVATERRA', 'PA', 0.000000, 0.000000, '0'),
(491, 17, 'ETA', '', 'SANTA CRUZ DO ARARI', 'SANTA CRUZ DO ARARI', 'PA', 0.000000, 0.000000, '0'),
(492, 17, 'ETA', '', 'SANTA LUZIA DO PARA', 'SANTA LUZIA DO PARA', 'PA', 0.000000, 0.000000, '0'),
(493, 17, 'ETA', '', 'SANTA MARIA DAS BARREIRAS', 'SANTA MARIA DAS BARREIRAS', 'PA', 0.000000, 0.000000, '0'),
(494, 17, 'ETA', '', 'SANTA MARIA DO PARA - POCO SANTA ROSA', 'SANTA MARIA DO PARA', 'PA', -1.357000, -47.568001, '0'),
(495, 17, 'ETA', 'BAIXO AMAZONAS', 'SANTAREM', 'SANTAREM', 'PA', -2.443000, -54.730999, '0'),
(496, 17, 'ETA', '', 'SAO BRAS', 'BELEM', 'PA', -1.449000, -48.469002, '0'),
(497, 17, 'ETA', '', 'SAO CAETANO DE ODOVELAS', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(498, 17, 'ETA', '', 'SAO FELIX DO XINGU', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(499, 17, 'ETA', '', 'SAO FRANCISCO DO PARA', 'BELEM', 'PA', -1.175000, -47.803001, '0'),
(500, 17, 'ETA', '', 'SATELITE', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(501, 17, 'ETA', '', 'SIDERAL', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(502, 17, 'ETA', '', 'SOURE', 'SOURE', 'PA', 0.000000, 0.000000, '0'),
(503, 17, 'ETA', '', 'TAILANDIA', 'TAILANDIA', 'PA', -2.948000, -48.953999, '0'),
(504, 17, 'ETA', '', 'TANGARAS', 'BELEM', 'PA', -1.276000, -47.953999, '0'),
(505, 17, 'ETA', '', 'TENONE', 'BELEM', 'PA', 0.000000, 0.000000, '0'),
(506, 17, 'ETA', '', 'TERRA SANTA', 'TERRA SANTA', 'PA', 0.000000, 0.000000, '0'),
(507, 17, 'ETA', '', 'TRACUATEUA', 'TRACUATEUA', 'PA', 0.000000, 0.000000, '0'),
(508, 17, 'ETA', '', 'UIRAPURU', 'ANANINDEUA', 'PA', -1.327000, -48.398998, '0'),
(509, 17, 'ETA', '', 'CASTANHAL - USINA', 'CASTANHAL', 'PA', -1.295000, -47.930000, '0'),
(510, 17, 'ETA', '', 'VERDEJANTE', 'BELEM', 'PA', -1.410000, -48.394001, '0'),
(511, 17, 'ETA', '', 'VIGIA DE NAZARE', 'VIGIA', 'PA', 0.000000, 0.000000, '0'),
(512, 17, 'ETA', '', 'VILA CAFEZAL', 'MAGALHAES BARATA', 'PA', 0.000000, 0.000000, '0'),
(513, 17, 'ETA', '', 'VILA CUIARANA - SALINOPOLIS', 'SALINOPOLIS', 'PA', -0.650630, -47.264999, '0'),
(514, 17, 'ETA', '', 'VILA DE BEJA', 'ABAETETUBA', 'PA', 0.000000, 0.000000, '0'),
(515, 17, 'ETA', '', 'CASTANHAL - VILA DO APEU', 'CASTANHAL', 'PA', -1.299000, -47.988998, '0'),
(516, 17, 'ETA', '', 'VILA FATIMA', 'TRACUATEUA', 'PA', 0.000000, 0.000000, '0'),
(517, 17, 'ETA', '', 'VILA MAUIATA', 'IGARAPE-MIRI', 'PA', 0.000000, 0.000000, '0'),
(518, 17, 'ETA', '', 'VILA TAUARI', 'CAPANEMA', 'PA', 0.000000, 0.000000, '0'),
(519, 17, 'ETA', '', 'VISEU', 'VISEU', 'PA', 0.000000, 0.000000, '0'),
(520, 18, 'ETA', '', 'ETA II - NOVA', 'VARZEA GRANDE', 'MT', -15.640000, -56.168999, '0'),
(521, 18, 'ETA', '', 'ETA I VELHA', 'VARZEA GRANDE', 'MT', -15.642000, -56.129002, '0'),
(522, 19, 'ETA', '', 'RIO BRANCO - SOBRAL', 'RIO BRANCO', 'AC', -10.004000, -67.842003, '0'),
(523, 20, 'ETA', '', 'ETA CAJAIBA - ITABAIANA', 'ITABAIANA', 'SE', -10.800000, -37.431000, '0'),
(524, 20, 'ETA', '', 'AREIA BRANCA', 'AREIA BRANCA', 'SE', -10.759000, -37.318001, '0'),
(525, 20, 'ETA', '', 'LAGARTO', 'LAGARTO', 'SE', -10.919000, -37.662998, '0'),
(526, 20, 'ETA', '', 'TOBIAS BARRETO', 'TOBIAS BARRETO', 'SE', -11.183000, -37.998001, '0'),
(527, 21, 'ETA', '', 'PETROLINA', 'PETROLINA', 'PE', -9.395000, -40.528999, '0'),
(528, 22, 'ETA', '', 'BACABAL', 'BACABAL', 'MA', -4.234000, -44.778000, '0'),
(529, 23, 'ETA', 'CAXIAS', 'CAXIAS - ETA POINT', 'CAXIAS', 'MA', -4.885000, -43.381001, '0'),
(530, 23, 'ETA', 'CAXIAS', 'CAXIAS - ETA VOLTA REDONDA', 'CAXIAS', 'MA', -4.883000, -43.354000, '0'),
(531, 26, 'ETA', '', 'PETROLINA', 'PETROLINA', 'PE', -9.395000, -40.529999, '0'),
(532, 27, 'ETA', '', 'CAMPUS - NATAL UFRN', 'NATAL', 'RN', -5.837000, -35.202000, '0'),
(533, 11, 'ETA', '', 'CAJUPIRANGA  - P68', 'PARNAMIRIM', 'RN', 0.000000, 0.000000, '0'),
(536, 28, 'ETA', '', 'BRASIL KIRIN IGARASSU', 'IGARASSU', 'PE', -7.797000, -34.928001, '0'),
(535, 24, 'ETA', '', 'ITAPISSUMA', 'ITAPISSUMA', 'PE', -7.799000, -34.924999, '0'),
(537, 26, 'ETA', '', 'ARAPIRACA', 'ARAPIRACA', 'AL', -9.785000, -36.654999, '0'),
(538, 11, 'ETA', '', 'SAO JOSE DO SERIDO', 'SAO JOSE DO SERIDO', 'RN', -6.450000, -36.875999, '0'),
(539, 14, 'ETA', '', 'ALTO SERTAO - AGUA BRANCA', 'AGUA BRANCA', 'AL', -9.314000, -37.980999, '0'),
(540, 3, 'ETA', '', 'ITAPISSUMA - XAROPARIA', 'ITAPISSUMA', 'PE', -7.751000, -34.924000, '0'),
(542, 3, 'ETA', '', 'ITAPISSUMA - ETA/ETEI', 'ITAPISSUMA', 'PE', -7.751000, -34.924000, '0'),
(543, 14, 'ETA', '', 'ALTO SERTAO(ETA NOVA)', 'DELMIRO GOUVEIA', 'AL', -9.314000, -37.980999, '0'),
(544, 11, 'ETA', '', 'JARDIM DE PIRANHAS - MANOEL TORRES EB1', 'JARDIM DE PIRANHAS', 'RN', -6.377000, -37.353001, '0'),
(545, 16, 'ETA', 'CPR Norte', 'BOTAFOGO', 'IGARASSU', 'PE', -7.852000, -34.938000, '0'),
(547, 16, 'ETA', 'CPR Norte', 'BOTAFOGO', 'IGARASSU', 'PE', -7.852000, -34.938000, '0'),
(548, 16, 'ETA', 'CPR Norte', 'ARACOIABA', 'ARACOIABA', 'PE', -7.788000, -35.091999, '0'),
(549, 16, 'ETA', 'CPR Norte', 'GOIANA', 'GOIANA', 'PE', -7.531000, -34.995998, '0'),
(550, 16, 'ETA', 'CPR Leste', 'ALTO DO CEU', 'RECIFE', 'PE', -8.014000, -34.890999, '0'),
(551, 16, 'ETA', 'CPR Leste', 'CAIXA DAGUA', 'RECIFE', 'PE', -7.995000, -34.904999, '0'),
(552, 16, 'ETA', 'CPR Leste', 'VERA CRUZ', 'CAMARAGIBE', 'PE', -7.954000, -35.007999, '0'),
(553, 16, 'ETA', 'CPR Leste', 'GUABIRABA - POCOS', 'RECIFE', 'PE', 0.000000, 0.000000, '0'),
(554, 16, 'ETA', 'CPR Leste', 'DOIS IRMAOS EE', 'RECIFE', 'PE', -8.015000, -34.944000, '0'),
(555, 16, 'ETA', 'CPR Leste', 'MACACOS EE', 'RECIFE', 'PE', -8.015000, -34.946999, '0'),
(556, 16, 'ETA', 'CPR Oeste', 'TAPACURA', 'RECIFE', 'PE', -8.078000, -34.988998, '0'),
(557, 16, 'ETA', 'CPR Oeste', 'VARZEA DO UNA', 'CAMARAGIBE', 'PE', -7.997000, -35.044998, '0'),
(558, 16, 'ETA', 'CPR Oeste', 'MANOEL DE SENA', 'JABOATAO DOS GUARARAPES', 'PE', -8.106000, -35.014999, '0'),
(559, 16, 'ETA', 'CPR Oeste', 'MORENO', 'MORENO', 'PE', -8.115000, -35.116001, '0'),
(560, 16, 'ETA', 'CPR Oeste', 'Parque CAPIBARIBE', 'SAO LOURENCO DA MATA', 'PE', 0.000000, 0.000000, '0'),
(561, 16, 'ETA', 'CPR Oeste', 'BONANCA', 'MORENO', 'PE', -8.112000, -35.188000, '0'),
(562, 16, 'ETA', 'CPR Oeste', 'MATRIZ DA LUZ', 'SAO LOURENCO DA MATA', 'PE', -8.037000, -35.099998, '0'),
(563, 16, 'ETA', 'CPR Sul', 'SUAPE', 'IPOJUCA', 'PE', -8.367000, -35.018002, '0'),
(564, 16, 'ETA', 'CPR Sul', 'PORTO DE GALINHAS', 'IPOJUCA', 'PE', -8.505000, -35.023998, '0'),
(565, 16, 'ETA', 'CPR Sul', 'IPOJUCA', 'IPOJUCA', 'PE', -8.396000, -35.062000, '0'),
(566, 16, 'ETA', 'CPR Sul', 'CAMELA', 'IPOJUCA', 'PE', -8.509000, -35.122002, '0'),
(567, 16, 'ETA', 'CPP', 'MARCOS FREIRE - CAPTACAO', 'JABOATAO DOS GUARARAPES', 'PE', -8.159000, -34.979000, '0'),
(568, 16, 'ETA', 'CPP', 'MARCOS FREIRE - CONV. E COMP.', 'JABOATAO DOS GUARARAPES', 'PE', -8.132000, -34.973999, '0'),
(569, 16, 'ETA', 'CPP', 'CHARNECA', 'CABO DE SANTO AGOSTINHO', 'PE', -8.296000, -35.062000, '0'),
(570, 16, 'ETA', 'CPP', 'MURIBEQUINHA - CAPTACAO', 'JABOATAO DOS GUARARAPES', 'PE', -8.166000, -35.007000, '0'),
(571, 16, 'ETA', 'CPP', 'MURIBEQUINHA - ETA', 'JABOATAO DOS GUARARAPES', 'PE', -8.172000, -34.999001, '0'),
(572, 16, 'ETA', 'CPP', 'PIRAPAMA - CABO', 'CABO DE SANTO AGOSTINHO', 'PE', -8.267000, -35.049999, '0'),
(573, 16, 'ETA', 'CPP', 'GURJAU / MATAPAGIPE', 'CABO DE SANTO AGOSTINHO', 'PE', -8.267000, -35.048000, '0'),
(574, 16, 'ETA', 'MATA SUL', 'TAMANDARE - VELHA', 'TAMANDARE', 'PE', 0.000000, 0.000000, '0'),
(575, 16, 'ETA', 'MATA SUL', 'TAMANDARE - NOVA - RIO FORMOSO', 'TAMANDARE', 'PE', 0.000000, 0.000000, '0'),
(576, 16, 'ETA', 'MATA SUL', 'RIO FORMOSO', 'RIO FORMOSO', 'PE', 0.000000, 0.000000, '0'),
(577, 16, 'ETA', 'MATA SUL', 'SIRINHAEM - Captacao', 'SIRINHAEM', 'PE', 0.000000, 0.000000, '0'),
(578, 16, 'ETA', 'MATA SUL', 'SIRINHAEM - ETA', 'SIRINHAEM', 'PE', 0.000000, 0.000000, '0'),
(579, 16, 'ETA', 'MATA SUL', 'VITORIA DE SANTO ANTAO', 'VITORIA DE SANTO ANTAO', 'PE', -8.116000, -35.300999, '0'),
(580, 16, 'ETA', 'MATA SUL', 'BARREIROS', 'BARREIROS', 'PE', 0.000000, 0.000000, '0'),
(581, 16, 'ETA', 'MATA SUL', 'SAO JOSE DA COROA GRANDE', 'SAO JOSE DA COROA GRANDE', 'PE', 0.000000, 0.000000, '0'),
(582, 16, 'ETA', 'MATA SUL', 'CUCAU', 'RIO FORMOSO', 'PE', -8.631000, -35.265999, '0'),
(583, 16, 'ETA', 'MATA SUL', 'GLORIA DO GOITA', 'GLORIA DO GOITA', 'PE', -8.005000, -35.291000, '0'),
(584, 16, 'ETA', 'MATA SUL', 'JOAQUIM NABUCO', 'JOAQUIM NABUCO', 'PE', -8.630000, -35.532001, '0'),
(585, 16, 'ETA', 'MATA SUL', 'PRIMAVERA', 'PRIMAVERA', 'PE', 0.000000, 0.000000, '0'),
(586, 16, 'ETA', 'MATA SUL', 'SANTO AMARO', 'RECIFE', 'PE', 0.000000, 0.000000, '0'),
(587, 16, 'ETA', 'MATA SUL', 'RIBEIRAO', 'RIBEIRAO', 'PE', -8.507000, -35.384998, '0'),
(588, 16, 'ETA', 'MATA SUL', 'ESCADA', 'ESCADA', 'PE', 0.000000, 0.000000, '0'),
(589, 16, 'ETA', 'MATA SUL', 'FREXEIRAS', 'ESCADA', 'PE', 0.000000, 0.000000, '0');
INSERT INTO `tb_locais` (`id`, `loja`, `tipo`, `regional`, `name`, `municipio`, `uf`, `latitude`, `longitude`, `ativo`) VALUES
(590, 16, 'ETA', 'MATA SUL', 'SAUE', 'TAMANDARE', 'PE', -8.768000, -35.318001, '0'),
(591, 16, 'ETA', 'MATA NORTE', 'PAUDALHO', 'PAUDALHO', 'PE', -7.882000, -35.179001, '0'),
(592, 16, 'ETA', 'MATA NORTE', 'BIZARRA', 'BOM JARDIM', 'PE', -7.756000, -35.484001, '0'),
(593, 16, 'ETA', 'MATA NORTE', 'BUENOS AIRES', 'BUENOS AIRES', 'PE', 0.000000, 0.000000, '0'),
(594, 1, 'ETA', '', 'TESTE', 'ITAPISSUMA', 'PE', -1.111111, -22.111111, '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_local_categoria`
--

CREATE TABLE `tb_local_categoria` (
  `id` int(11) NOT NULL,
  `local` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_local_categoria`
--

INSERT INTO `tb_local_categoria` (`id`, `local`, `categoria`, `ativo`) VALUES
(1, 2, 1, '0'),
(2, 2, 3, '0'),
(3, 3, 1, '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_loja`
--

CREATE TABLE `tb_loja` (
  `id` int(11) NOT NULL,
  `nick` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `proprietario` int(11) NOT NULL,
  `grupoLoja` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `seguimento` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL DEFAULT '0000-00-00',
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_loja`
--

INSERT INTO `tb_loja` (`id`, `nick`, `name`, `proprietario`, `grupoLoja`, `seguimento`, `data`, `ativo`) VALUES
(1, 'AGESPISA', 'AGESPISA', 1, 'C', 'SAN', '2017-08-18', '0'),
(2, 'ALUBAR', 'ALUBAR', 1, 'C', 'IND', '2017-08-18', '0'),
(3, 'AMBEV', 'AMBEV', 1, 'C', 'BEB', '2017-08-18', '0'),
(4, 'APERAM', 'APERAM', 1, 'C', 'IND', '2017-08-18', '0'),
(5, 'BATERIAS MOURA', 'BATERIAS MOURA', 1, 'C', 'IND', '2017-08-18', '0'),
(6, 'BIOSEV - GIASA', 'BIOSEV - GIASA', 1, 'C', 'USI', '2017-08-18', '0'),
(7, 'CAB AGRESTE', 'CAB AGRESTE', 1, 'C', 'SAN', '2017-08-18', '0'),
(8, 'CAB CUIABA', 'CAB CUIABA', 1, 'C', 'SAN', '2017-08-18', '0'),
(9, 'CAEMA', 'CAEMA', 1, 'C', 'SAN', '2017-08-18', '0'),
(10, 'CAER', 'CAER', 1, 'C', 'SAN', '2017-08-18', '0'),
(11, 'CAERN', 'CAERN', 1, 'C', 'SAN', '2017-08-18', '0'),
(12, 'CAGECE', 'CAGECE', 1, 'C', 'SAN', '2017-08-18', '0'),
(13, 'CAGEPA', 'CAGEPA', 1, 'C', 'SAN', '2017-08-18', '0'),
(14, 'CASAL', 'CASAL', 1, 'C', 'SAN', '2017-08-18', '0'),
(15, 'CESAN', 'CESAN', 1, 'C', 'SAN', '2017-08-18', '0'),
(16, 'COMPESA', 'COMPESA', 1, 'C', 'SAN', '2017-08-18', '0'),
(17, 'COSANPA', 'COSANPA', 1, 'C', 'SAN', '2017-08-18', '0'),
(18, 'DAE-VARZEA GRANDE', 'DAE-VARZEA GRANDE', 1, 'C', 'SAN', '2017-08-18', '0'),
(19, 'DEPASA', 'DEPASA', 1, 'C', 'SAN', '2017-08-18', '0'),
(20, 'DESO', 'DESO', 1, 'C', 'SAN', '2017-08-18', '0'),
(21, 'NIAGRO NICHIREI-PE', 'NIAGRO NICHIREI-PE', 1, 'C', 'IND', '2017-08-18', '0'),
(22, 'SAAE - BACABAL', 'SAAE - BACABAL', 1, 'C', 'SAN', '2017-08-18', '0'),
(23, 'SAAE - CAXIAS', 'SAAE - CAXIAS', 1, 'C', 'SAN', '2017-08-18', '0'),
(24, 'SABARA', 'SABARA', 1, 'P', 'IND', '2017-08-18', '0'),
(25, 'SERRA NEGRA DO NORTE', 'SERRA NEGRA DO NORTE', 1, 'C', 'SAN', '2017-08-18', '0'),
(26, 'SOLAR', 'SOLAR', 1, 'C', 'BEB', '2017-08-18', '0'),
(27, 'UFRN', 'UFRN', 1, 'C', 'OUT', '2017-08-18', '0'),
(28, 'BRASIL KIRIN', 'BRASIL KIRIN', 1, 'C', 'BEB', '2017-08-18', '0'),
(29, 'GERDAU', 'GERDAU', 1, 'C', 'IND', '2017-08-18', '0'),
(30, 'HEINEKEN', 'HEINEKEN', 1, 'C', 'BEB', '2017-08-18', '0'),
(31, 'SANEAR RONDONOPOLIS', 'SANEAR RONDONOPOLIS', 1, 'C', 'SAN', '2017-08-18', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_loja_categoria`
--

CREATE TABLE `tb_loja_categoria` (
  `id` int(11) NOT NULL,
  `loja` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_loja_categoria`
--

INSERT INTO `tb_loja_categoria` (`id`, `loja`, `categoria`, `ativo`) VALUES
(1, 1, 1, '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mod`
--

CREATE TABLE `tb_mod` (
  `id` int(11) NOT NULL,
  `data_inicial` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `data_final` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tb_tecnicos_id` int(11) NOT NULL,
  `tb_oat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_oat`
--

CREATE TABLE `tb_oat` (
  `id` int(11) NOT NULL,
  `nickuser` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `cliente` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `localidade` int(11) NOT NULL,
  `servico` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `sistema` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `data` date NOT NULL DEFAULT '0000-00-00',
  `dtUltimoAt` date NOT NULL DEFAULT '0000-00-00',
  `data_sol` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filial` int(2) DEFAULT NULL,
  `os` int(11) DEFAULT NULL,
  `data_os` datetime DEFAULT '0000-00-00 00:00:00',
  `data_fech` datetime DEFAULT '0000-00-00 00:00:00',
  `data_term` datetime DEFAULT '0000-00-00 00:00:00',
  `status` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ativo` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produtos`
--

CREATE TABLE `tb_produtos` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `tipo` varchar(4) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_produtos`
--

INSERT INTO `tb_produtos` (`id`, `name`, `tag`, `tipo`) VALUES
(1, 'MASCARA AUTONOMA', 'MSA', 'PROD'),
(2, 'SISTEMA CLORACAO', 'SCL', 'PROD'),
(3, 'CLORADOR', 'CLORADOR', 'PROD'),
(4, 'CILINDRO AR RESPIRAVEL', 'CILINDRO AR', 'PROD');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto_categoria`
--

CREATE TABLE `tb_produto_categoria` (
  `id` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto_tipo`
--

CREATE TABLE `tb_produto_tipo` (
  `id` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_produto_tipo`
--

INSERT INTO `tb_produto_tipo` (`id`, `name`) VALUES
('PROD', 'PRODUTO'),
('SERV', 'SERVICO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_proprietario`
--

CREATE TABLE `tb_proprietario` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `nick` varchar(30) CHARACTER SET latin1 NOT NULL,
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `cadastro` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_proprietario`
--

INSERT INTO `tb_proprietario` (`id`, `name`, `nick`, `ativo`, `cadastro`) VALUES
(1, 'Sabara Quimicos Ingredientes S/A', 'Sabará ã', '0', '2017-08-17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_seguimento`
--

CREATE TABLE `tb_seguimento` (
  `id` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_seguimento`
--

INSERT INTO `tb_seguimento` (`id`, `name`) VALUES
('BEB', 'BEBIDA'),
('IND', 'INDUSTRIA'),
('OUT', 'OUTRO'),
('SAN', 'SANEAMENTO'),
('USI', 'USINA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_servicos`
--

CREATE TABLE `tb_servicos` (
  `id` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(30) CHARACTER SET utf8 NOT NULL,
  `tipo` enum('0','1','2','3','4') CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_servicos`
--

INSERT INTO `tb_servicos` (`id`, `descricao`, `tipo`, `ativo`) VALUES
('INS001', 'NOVA INSTALACAO', '0', '0'),
('PRV001', 'PREVENTIVO', '1', '0'),
('OPE002', 'ACOPLAR CILINDRO', '2', '0'),
('OPE001', 'REABASTER PRODUTO', '2', '0'),
('COR001', 'CORRETIVO', '1', '0'),
('DES000', 'DESINTALACAO', '3', '0'),
('VIT001', 'VISITA TECNICA', '4', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_sistema`
--

CREATE TABLE `tb_sistema` (
  `id` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(30) CHARACTER SET utf8 NOT NULL,
  `ativo` enum('0','1') CHARACTER SET utf8 NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_sistema`
--

INSERT INTO `tb_sistema` (`id`, `descricao`, `ativo`) VALUES
('SBDPT-SPT', 'PASTILHA', '0'),
('SBDSD-SDS', 'DICLORO', '0'),
('SBDXC-SDX', 'DIOXIDO DE CLORO', '0'),
('SBGCL-SCL', 'CLORO', '0'),
('SBPAC-SPC', 'PAC', '0'),
('SBSEG-KITCL', 'KIT DE EMERGENCIA CLORO', '0'),
('SBSEG-MCA', 'MASCARA AUTONOMA', '0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_tipo`
--

CREATE TABLE `tb_tipo` (
  `id` varchar(11) CHARACTER SET latin1 NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `tb_tipo`
--

INSERT INTO `tb_tipo` (`id`, `name`) VALUES
('EEA', 'EEA'),
('ETA', 'ETA'),
('ETE', 'ETE'),
('IND', 'INDUSTRIA'),
('OUT', 'OUTROS'),
('POC', 'POCO');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(150) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `user` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(32) CHARACTER SET latin1 NOT NULL,
  `avatar` varchar(350) CHARACTER SET latin1 DEFAULT NULL,
  `proprietario` int(11) DEFAULT NULL,
  `grupoLoja` int(2) DEFAULT NULL,
  `loja` int(11) DEFAULT NULL,
  `nivel` enum('0','1','2','3','4') CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `ativo` enum('0','1') CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `data_cadastro` date NOT NULL DEFAULT '0000-00-00',
  `data_ultimo_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user`, `password`, `avatar`, `proprietario`, `grupoLoja`, `loja`, `nivel`, `ativo`, `data_cadastro`, `data_ultimo_login`) VALUES
(1, 'FABIO VITORINO BONINA MORAIS', 'fabiobonina@gmail.com', 'Fábio Boninã', 'a906449d5769fa7361d7ecc6aa3f6d28', 'http://www.gravatar.com/avatar/5f3781a40c3fde1b4ac568a97692aa70?d=identicon', NULL, NULL, NULL, '1', '0', '2017-11-08', '2017-11-08 20:18:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_bem`
--
ALTER TABLE `tb_bem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bem_componentes`
--
ALTER TABLE `tb_bem_componentes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bem_localizacao`
--
ALTER TABLE `tb_bem_localizacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bens_familia`
--
ALTER TABLE `tb_bens_familia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bens_frabricante`
--
ALTER TABLE `tb_bens_frabricante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bens_grupo`
--
ALTER TABLE `tb_bens_grupo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_bens_nivel`
--
ALTER TABLE `tb_bens_nivel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `segmento` (`segmento`);

--
-- Indexes for table `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `tb_equipamentos`
--
ALTER TABLE `tb_equipamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_eq_componentes`
--
ALTER TABLE `tb_eq_componentes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_eq_localizacao`
--
ALTER TABLE `tb_eq_localizacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_fabricante`
--
ALTER TABLE `tb_fabricante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`);

--
-- Indexes for table `tb_frabricante`
--
ALTER TABLE `tb_frabricante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`);

--
-- Indexes for table `tb_loja`
--
ALTER TABLE `tb_loja`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`);

--
-- Indexes for table `tb_produtos`
--
ALTER TABLE `tb_produtos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `tb_produto_categoria`
--
ALTER TABLE `tb_produto_categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_produto_tipo`
--
ALTER TABLE `tb_produto_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_proprietario`
--
ALTER TABLE `tb_proprietario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`);

--
-- Indexes for table `tb_seguimento`
--
ALTER TABLE `tb_seguimento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_sistema`
--
ALTER TABLE `tb_sistema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tipo`
--
ALTER TABLE `tb_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_bem`
--
ALTER TABLE `tb_bem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_bem_componentes`
--
ALTER TABLE `tb_bem_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_bem_localizacao`
--
ALTER TABLE `tb_bem_localizacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_loja`
--
ALTER TABLE `tb_loja`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `tb_produtos`
--
ALTER TABLE `tb_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tb_produto_categoria`
--
ALTER TABLE `tb_produto_categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_proprietario`
--
ALTER TABLE `tb_proprietario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
