-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 05-12-2013 a las 20:06:46
-- Versión del servidor: 5.5.16
-- Versión de PHP: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sys_contable_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_cheque`
--

CREATE TABLE IF NOT EXISTS `comp_cheque` (
  `id_mov_cheque` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `fecha_doc` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `monto` double NOT NULL,
  `acreditado` varchar(100) NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_proveedor` varchar(22) NOT NULL,
  `monto_letra` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `fecha_reg` date NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_comp` varchar(22) NOT NULL,
  `id_cuenta_prov` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_cheque`),
  KEY `glo_banco_comp_cheque_fk` (`id_banco`),
  KEY `comp_voucher_comp_cheque_fk` (`id_voucher`),
  KEY `comp_proveedor_comp_cheque_fk` (`id_proveedor`),
  KEY `comp_compras_registro_comp_cheque_fk` (`id_mov_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_compras_detalle`
--

CREATE TABLE IF NOT EXISTS `comp_compras_detalle` (
  `id_mov_det` varchar(22) NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `detalle` varchar(80) NOT NULL,
  `imp_ref` double NOT NULL,
  `cantidad` double NOT NULL,
  `pu` double NOT NULL,
  `igv` double NOT NULL,
  `importe` double NOT NULL,
  `tipo_bi` varchar(4) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_cta_igv` varchar(16) NOT NULL,
  `id_unidadmedida` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_comp` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_det`),
  KEY `glo_unidadmedida_comp_compras_detalle_fk` (`id_unidadmedida`),
  KEY `comp_compras_registro_comp_compras_detalle_fk` (`id_mov_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comp_compras_detalle`
--

INSERT INTO `comp_compras_detalle` (`id_mov_det`, `id_mov_compra`, `id_compra`, `detalle`, `imp_ref`, `cantidad`, `pu`, `igv`, `importe`, `tipo_bi`, `estado`, `id_cta_igv`, `id_unidadmedida`, `id_nivel`, `id_cuenta_comp`) VALUES
('2013112500000002', '2013112500000002', 'X', 'Compras varias', 100, 1, 100, 18, 118, 'b3', 'p', '40111', '2013101104000016', '101', '60111'),
('2013112500000003', '2013112500000002', 'X', 'Compras varias inafectas', 2, 1, 2, 0, 2, 'b4.0', 'p', '40111', '2013101104000016', '102', '60111'),
('2013112500000004', '2013112500000004', 'X', 'compras', 423.72881356, 1, 423.72881356, 76.27118644, 500, 'b1', 'p', '40111', '2013101104000016', '103', '11111'),
('2013112500000005', '2013112500000004', 'X', 'compras x', 76.27118644, 1, 76.27118644, 13.72881356, 90, '', 'p', '40111', '2013101104000016', '104', '11121');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_compras_detalle_carrito`
--

CREATE TABLE IF NOT EXISTS `comp_compras_detalle_carrito` (
  `id_mov_det` varchar(22) NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `detalle` varchar(80) NOT NULL,
  `imp_ref` double NOT NULL,
  `cantidad` double NOT NULL,
  `pu` double NOT NULL,
  `igv` double NOT NULL,
  `importe` double NOT NULL,
  `tipo_bi` varchar(4) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_cta_igv` varchar(16) NOT NULL,
  `id_unidadmedida` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_comp` varchar(22) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_det`),
  KEY `glo_persona_comp_compras_detalle_carrito_fk` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_compras_registro`
--

CREATE TABLE IF NOT EXISTS `comp_compras_registro` (
  `id_mov_compra` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `tipo_compra` varchar(10) NOT NULL,
  `fecha_prov` date NOT NULL,
  `fecha_doc` date NOT NULL,
  `fecha_vence` date NOT NULL,
  `serie` varchar(6) NOT NULL,
  `numdoc` varchar(20) NOT NULL,
  `guia` varchar(20) NOT NULL,
  `diascred` double NOT NULL,
  `importe` double NOT NULL,
  `imp_otro` double NOT NULL,
  `tipo_cambio` double NOT NULL,
  `igv_total` double NOT NULL,
  `igv1` double NOT NULL,
  `baseimp1` double NOT NULL,
  `igv2` double NOT NULL,
  `baseimp2` double NOT NULL,
  `igv3` double NOT NULL,
  `baseimp3` double NOT NULL,
  `baseimp4` double NOT NULL,
  `igv4` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `id_comprobante` varchar(22) NOT NULL,
  `id_proveedor` varchar(22) NOT NULL,
  `id_tipooperacion` varchar(22) NOT NULL,
  `id_tipomoneda` varchar(22) NOT NULL,
  `id_mediopago` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  `anhodua` varchar(10) NOT NULL,
  `isc` varchar(20) NOT NULL,
  `numdocexterior` varchar(40) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `retenido` varchar(1) DEFAULT NULL COMMENT 'si o no',
  `detraccion` varchar(1) DEFAULT NULL COMMENT 'si o no',
  `percepcion` varchar(1) DEFAULT NULL COMMENT 'si o no',
  `modo_pago` varchar(20) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_comp` varchar(22) NOT NULL,
  `id_cuenta_igv` varchar(22) NOT NULL,
  `num_rdp` varchar(100) NOT NULL,
  `cuenta_por_pagar` double NOT NULL DEFAULT '0',
  `otro_imp` double NOT NULL,
  `fecha_det` date NOT NULL,
  `doc_dua` varchar(22) DEFAULT NULL,
  `codigo_dua` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id_mov_compra`),
  KEY `comp_voucher_comp_compras_registro_fk` (`id_voucher`),
  KEY `glo_comprobante_comp_compras_registro_fk` (`id_comprobante`),
  KEY `glo_tipomoneda_comp_compras_registro_fk` (`id_tipomoneda`),
  KEY `glo_tipooperacion_comp_compras_registro_fk` (`id_tipooperacion`),
  KEY `glo_mediopago_comp_compras_registro_fk` (`id_mediopago`),
  KEY `comp_proveedor_comp_compras_registro_fk` (`id_proveedor`),
  KEY `glo_persona_comp_compras_registro_fk` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comp_compras_registro`
--

INSERT INTO `comp_compras_registro` (`id_mov_compra`, `id_compra`, `tipo_compra`, `fecha_prov`, `fecha_doc`, `fecha_vence`, `serie`, `numdoc`, `guia`, `diascred`, `importe`, `imp_otro`, `tipo_cambio`, `igv_total`, `igv1`, `baseimp1`, `igv2`, `baseimp2`, `igv3`, `baseimp3`, `baseimp4`, `igv4`, `estado`, `imagen`, `id_comprobante`, `id_proveedor`, `id_tipooperacion`, `id_tipomoneda`, `id_mediopago`, `ip`, `id_persona`, `anhodua`, `isc`, `numdocexterior`, `id_voucher`, `retenido`, `detraccion`, `percepcion`, `modo_pago`, `id_nivel`, `id_cuenta_comp`, `id_cuenta_igv`, `num_rdp`, `cuenta_por_pagar`, `otro_imp`, `fecha_det`, `doc_dua`, `codigo_dua`) VALUES
('2013112500000002', 'X', 'X', '2013-11-25', '2013-11-15', '2013-11-25', '1', '1', 'X', 0, 120, 0, 0, 18, 0, 0, 0, 0, 18, 100, 2, 0, 't', 'X', '2013110500000003', '2013112400000007', '2013101104000002', '2013110500000001', '2013110500000020', '0.0.0.0', '20041056400001', 'undefined', '0', 'X', '2013112500000001', 'X', '0', 'X', 'X', '102', '42121', 'X', '', 0, 0, '0002-11-30', 'undefined', 'undefined'),
('2013112500000003', 'X', 'X', '2013-11-25', '2013-11-20', '2013-11-25', '66', '88', 'X', 0, 600, 0, 0, 90, 0, 0, 0, 0, 0, 0, 0, 0, 'PR', 'X', '2013110500000002', '2013112400000007', '2013101104000002', '2013110500000001', '2013110500000020', '0.0.0.0', '20041056400001', 'undefined', '2', 'X', '2013112500000001', 'X', '0', 'X', 'X', '102', '42121', 'X', '', 600, 6, '0002-11-30', 'undefined', 'undefined'),
('2013112500000004', 'X', 'X', '2013-11-25', '2013-11-20', '2013-11-25', '66', '88', 'X', 0, 600, 0, 0, 90, 76.27118644, 423.72881356, 0, 0, 0, 0, 0, 0, 'PR', 'X', '2013110500000002', '2013112400000007', '2013101104000002', '2013110500000001', '2013110500000020', '0.0.0.0', '20041056400001', 'undefined', '2', 'X', '2013112500000001', 'X', '0', 'X', 'X', '102', '42121', 'X', '', 600, 6, '0002-11-30', 'undefined', 'undefined');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_depositos_banco`
--

CREATE TABLE IF NOT EXISTS `comp_depositos_banco` (
  `id_mov_dep` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `banco` varchar(80) NOT NULL,
  `serie` varchar(6) NOT NULL,
  `numdoc` varchar(12) NOT NULL,
  `fecha_doc` date NOT NULL,
  `importe` double NOT NULL,
  `glosa` varchar(80) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `personal_user` varchar(22) DEFAULT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_proveedor` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_prov` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_dep`),
  KEY `glo_voucher_repo_comp_depositos_banco_fk` (`id_voucher_repo`),
  KEY `comp_voucher_comp_depositos_banco_fk` (`id_voucher`),
  KEY `comp_proveedor_comp_depositos_banco_fk` (`id_proveedor`),
  KEY `comp_compras_registro_comp_depositos_banco_fk` (`id_mov_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_main`
--

CREATE TABLE IF NOT EXISTS `comp_main` (
  `id_mov_main` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `id_cuenta_igv` varchar(22) NOT NULL,
  `id_cuenta_isc` varchar(22) NOT NULL,
  `id_cuenta_otroimp` varchar(22) NOT NULL,
  `id_cuentax_pagar` varchar(22) NOT NULL,
  `id_cuenta_otros` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_main`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_notas`
--

CREATE TABLE IF NOT EXISTS `comp_notas` (
  `id_mov_not` varchar(22) NOT NULL,
  `fecha_prov` date NOT NULL,
  `fecha_doc` date NOT NULL,
  `serie` varchar(12) NOT NULL,
  `numnot` varchar(12) NOT NULL,
  `impore` double NOT NULL,
  `imp_otro` double NOT NULL,
  `tipo_cambio` double NOT NULL,
  `tipo_bi` varchar(4) NOT NULL,
  `igv` double NOT NULL,
  `baseimp` double NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `retenido` varchar(2) NOT NULL,
  `valor_igv` double NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_proveedor` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_tipomoneda` varchar(22) NOT NULL,
  `id_tipooperacion` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_igv` varchar(16) NOT NULL,
  `id_cuenta_comp` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_not`),
  KEY `glo_voucher_repo_comp_notas_fk` (`id_voucher_repo`),
  KEY `comp_voucher_comp_notas_fk` (`id_voucher`),
  KEY `glo_tipomoneda_comp_notas_fk` (`id_tipomoneda`),
  KEY `glo_tipooperacion_comp_notas_fk` (`id_tipooperacion`),
  KEY `comp_proveedor_comp_notas_fk` (`id_proveedor`),
  KEY `comp_compras_registro_comp_notas_fk` (`id_mov_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_pagos_efec`
--

CREATE TABLE IF NOT EXISTS `comp_pagos_efec` (
  `id_mov_pag` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `serie` varchar(6) NOT NULL,
  `numdoc` varchar(12) NOT NULL,
  `fecha_doc` date NOT NULL,
  `importe` double NOT NULL,
  `glosa` varchar(80) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `fecha` date NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `id_compra_1` varchar(12) NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_proveedor` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_prov` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_pag`),
  KEY `glo_voucher_repo_comp_pagos_efec_fk` (`id_voucher_repo`),
  KEY `comp_voucher_comp_pagos_efec_fk` (`id_voucher`),
  KEY `comp_proveedor_comp_pagos_efec_fk` (`id_proveedor`),
  KEY `comp_compras_registro_comp_pagos_efec_fk` (`id_mov_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comp_pagos_efec`
--

INSERT INTO `comp_pagos_efec` (`id_mov_pag`, `id_compra`, `serie`, `numdoc`, `fecha_doc`, `importe`, `glosa`, `estado`, `fecha`, `ip`, `id_personal_user`, `id_compra_1`, `id_mov_compra`, `id_voucher`, `id_proveedor`, `id_voucher_repo`, `id_nivel`, `id_cuenta`, `id_cuenta_prov`) VALUES
('2013120500000001', 'X', '66', '88', '2013-12-05', 600, 'compras', 'PR', '2013-12-05', '0:0:0:0:0:0:0:1', '20041056400001', 'X', '2013112500000004', '2013120500000002', '2013112400000007', '1', '102', '42121', 'X'),
('2013120500000002', 'X', '66', '88', '2013-12-05', 0, 'compras', 'PR', '2013-12-05', '0:0:0:0:0:0:0:1', '20041056400001', 'X', '2013112500000003', '2013120500000002', '2013112400000007', '1', '102', '42121', 'X'),
('2013120500000003', 'X', '66', '88', '2013-12-05', 600, 'compras', 'PR', '2013-12-05', '0:0:0:0:0:0:0:1', '20041056400001', 'X', '2013112500000003', '2013120500000002', '2013112400000007', '1', '102', '42121', 'X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_pagos_efec_otros`
--

CREATE TABLE IF NOT EXISTS `comp_pagos_efec_otros` (
  `id_mov_pag` varchar(22) NOT NULL,
  `serie` varchar(6) DEFAULT NULL,
  `numdoc` varchar(12) DEFAULT NULL,
  `fecha_doc` date NOT NULL,
  `importe` double NOT NULL,
  `glosa` varchar(80) DEFAULT NULL,
  `estado` varchar(2) NOT NULL,
  `fecha` date NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `id_mov_compra` varchar(22) DEFAULT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_prov` varchar(22) NOT NULL,
  `tipomov` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_mov_pag`),
  KEY `glo_voucher_repo_comp_pagos_efec_otros_fk` (`id_voucher_repo`),
  KEY `comp_voucher_comp_pagos_efec_otros_fk` (`id_voucher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_pagos_efec_otros_detalle`
--

CREATE TABLE IF NOT EXISTS `comp_pagos_efec_otros_detalle` (
  `id_pagos_efec_det` varchar(22) NOT NULL,
  `id_mov_pag` varchar(22) NOT NULL,
  `origen` varchar(60) NOT NULL,
  `destino` varchar(60) NOT NULL,
  `fecha_mov` date NOT NULL,
  `importe` double NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `glosa` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pagos_efec_det`),
  KEY `comp_pagos_efec_otros_comp_pagos_efec_detalle_fk` (`id_mov_pag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_proveedor`
--

CREATE TABLE IF NOT EXISTS `comp_proveedor` (
  `id_proveedor` varchar(22) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `paterno` varchar(60) NOT NULL,
  `materno` varchar(60) NOT NULL,
  `ruc` varchar(12) NOT NULL,
  `numdoc_ident` varchar(20) NOT NULL,
  `cod_nacionalidad` varchar(4) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `actividad` varchar(100) NOT NULL,
  `fecha_naci` date NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `email` varchar(60) NOT NULL,
  `seguro` varchar(1) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_tipoidentidad` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `glo_tipoidentidad_comp_proveedor_fk` (`id_tipoidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comp_proveedor`
--

INSERT INTO `comp_proveedor` (`id_proveedor`, `nombre`, `paterno`, `materno`, `ruc`, `numdoc_ident`, `cod_nacionalidad`, `direccion`, `telefono`, `celular`, `fax`, `actividad`, `fecha_naci`, `sexo`, `email`, `seguro`, `estado`, `id_tipoidentidad`, `ip`, `id_personal_user`) VALUES
('2013111300000001', 'SysCenterLife', 'SysCenterLife', 'SysCenterLife', '4521817244', '4521817244', 'X', 'xxxxxx', 'X', 'X', 'X', 'sssss', '2013-11-13', 'X', 'X', 'X', '1', '20131105004100005', 'X', '20041056400001'),
('2013111300000002', 'cata', 'cata', 'cata', '12345678', '12345678', 'X', 'xxxx', 'X', 'X', 'X', 'xxxxx', '2013-11-13', 'X', 'X', 'X', '1', '20131105004100005', 'X', '20041056400001'),
('2013111800000003', 'Jose Manuel', 'Limachi', 'Chavez', '10465340703', '10465340703', 'X', 'ok', 'X', 'X', 'X', 'ok', '2013-11-18', 'X', 'X', 'X', '1', '2013110500410002', 'X', '20041056400001'),
('2013112100000004', 'Juan', 'Perez', 'Perex', '10457645655', '10457645655', 'X', 'ok', 'X', 'X', 'X', 'ok', '2013-11-21', 'X', 'X', 'X', '1', '20131105004100005', 'X', '20041056400001'),
('2013112100000005', 'bonnier', 'mamani', 'larico', '1045436578', '1045436578', 'X', 'ok', 'X', 'X', 'X', 'ok', '2013-11-21', 'X', 'X', 'X', '1', '20131105004100005', 'X', '20041056400001'),
('2013112100000006', 'darwin ', 'zubieta', 'ramos', '10345476989', '10345476989', 'X', 'ok', 'X', 'X', 'X', 'ok', '2013-11-21', 'X', 'X', 'X', '1', '20131105004100005', 'X', '20041056400001'),
('2013112400000007', 'Universidad Peruana Unión', '', '', '20138122256', '20138122256', 'X', 'Carretera Arequipa Km 6', 'X', 'X', 'X', 'Enseñanza Superior', '2013-11-24', 'X', 'X', 'X', '1', '20131105004100005', 'X', '20041056400001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_saldo_inicial`
--

CREATE TABLE IF NOT EXISTS `comp_saldo_inicial` (
  `id_mov_sal_ini` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `id_apertura_periodo` varchar(22) NOT NULL,
  `id_personal` varchar(22) DEFAULT NULL COMMENT '--Proveedor',
  `glosa` varchar(80) NOT NULL,
  `importe` double NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `cuenta` varchar(22) NOT NULL,
  `nivel` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_mov_sal_ini`),
  KEY `glo_apertura_periodo_comp_saldo_inicial_fk` (`id_apertura_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_transferencia_banco`
--

CREATE TABLE IF NOT EXISTS `comp_transferencia_banco` (
  `id_mov_trans` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `banco_destino` varchar(80) NOT NULL,
  `serie` varchar(6) NOT NULL,
  `numdoc` varchar(12) NOT NULL,
  `fecha_doc` date NOT NULL,
  `importe` double NOT NULL,
  `glosa` varchar(80) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `id_mov_compra` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_proveedor` varchar(22) NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_prov` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_trans`),
  KEY `glo_banco_comp_transferencia_banco_fk` (`id_banco`),
  KEY `comp_voucher_comp_transferencia_banco_fk` (`id_voucher`),
  KEY `comp_proveedor_comp_transferencia_banco_fk` (`id_proveedor`),
  KEY `comp_compras_registro_comp_transferencia_banco_fk` (`id_mov_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_voucher`
--

CREATE TABLE IF NOT EXISTS `comp_voucher` (
  `id_voucher` varchar(22) NOT NULL,
  `id_compra` varchar(12) NOT NULL,
  `libro` varchar(4) DEFAULT NULL,
  `voucher` varchar(22) NOT NULL,
  `nivel` varchar(12) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `modulo` varchar(20) NOT NULL,
  `lote` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_voucher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comp_voucher`
--

INSERT INTO `comp_voucher` (`id_voucher`, `id_compra`, `libro`, `voucher`, `nivel`, `fecha`, `estado`, `modulo`, `lote`) VALUES
('2013112500000001', 'X', 'X', '2013112500000001', 'X', '2013-11-25', '1', 'compra', NULL),
('2013120500000002', 'X', 'X', '2013120500000002', 'X', '2013-12-05', '1', 'efectivo', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_cuenta`
--

CREATE TABLE IF NOT EXISTS `cont_cuenta` (
  `id_cuenta` varchar(22) NOT NULL,
  `cuenta` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_elemento` varchar(22) NOT NULL,
  PRIMARY KEY (`id_cuenta`),
  KEY `cont_elemento_cont_cuenta_fk` (`id_elemento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_cuenta`
--

INSERT INTO `cont_cuenta` (`id_cuenta`, `cuenta`, `descripcion`, `estado`, `id_elemento`) VALUES
('10', '10', 'EFECTIVO Y EQUIVALENTES DE EFECTIVO', '1', '1'),
('11', '11', 'INVERSIONES FINANCIERAS', '1', '1'),
('12', '12', 'CUENTAS POR COBRAR COMERCIALES ? TERCEROS', '1', '1'),
('13', '13', 'CUENTAS POR COBRAR COMERCIALES ? RELACIONADAS', '1', '1'),
('14', '14', 'CUENTAS POR COBRAR AL PERSONAL, A LOS ACCIONISTAS (SOCIOS), DIRECTORES Y GERENTES', '1', '1'),
('16', '16', 'CUENTAS POR COBRAR DIVERSAS - TERCEROS', '1', '1'),
('17', '17', 'CUENTAS POR COBRAR DIVERSAS - RELACIONADAS', '1', '1'),
('18', '18', 'SERVICIOS Y OTROS CONTRATADOS POR ANTICIPADO', '1', '1'),
('19', '19', 'ESTIMACIÓN DE CUENTAS DE COBRANZA DUDOSA', '1', '1'),
('20', '20', 'MERCADERÍAS', '1', '2'),
('21', '21', 'PRODUCTOS TERMINADOS', '1', '2'),
('22', '22', 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS', '1', '2'),
('23', '23', 'PRODUCTOS EN PROCESO', '1', '2'),
('24', '24', 'MATERIAS PRIMAS', '1', '2'),
('25', '25', 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS', '1', '2'),
('26', '26', 'ENVASES Y EMBALAJES', '1', '2'),
('27', '27', 'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA', '1', '2'),
('28', '28', 'EXISTENCIAS POR RECIBIR', '1', '2'),
('29', '29', 'DESVALORIZACIÓN DE EXISTENCIAS', '1', '2'),
('30', '30', 'INVERSIONES MOBILIARIAS', '1', '3'),
('31', '31', 'INVERSIONES INMOBILIARIAS', '1', '3'),
('32', '32', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '3'),
('33', '33', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '3'),
('34', '34', 'INTANGIBLES', '1', '3'),
('35', '35', 'ACTIVOS BIOLÓGICOS', '1', '3'),
('36', '36', 'DESVALORIZACIÓN DE ACTIVO INMOVILIZADO', '1', '3'),
('37', '37', 'ACTIVO DIFERIDO', '1', '3'),
('38', '38', 'OTROS ACTIVOS', '1', '3'),
('39', '39', 'DEPRECIACIÓN, AMORTIZACIÓN Y AGOTAMIENTO ACUMULADOS', '1', '3'),
('40', '40', 'TRIBUTOS Y APORTES AL SISTEMA DE PENSIONES Y DE SALUD POR PAGAR', '1', '4'),
('41', '41', 'REMUNERACIONES Y PARTICIPACIONES POR PAGAR', '1', '4'),
('42', '42', 'CUENTAS POR PAGAR COMERCIALES ? TERCEROS', '1', '4'),
('43', '43', 'CUENTAS POR PAGAR COMERCIALES ? RELACIONADAS', '1', '4'),
('44', '44', 'CUENTAS POR PAGAR A LOS ACCIONISTAS, DIRECTORES Y GERENTES', '1', '4'),
('45', '45', 'OBLIGACIONES FINANCIERAS', '1', '4'),
('46', '46', 'CUENTAS POR PAGAR DIVERSAS ? TERCEROS', '1', '4'),
('47', '47', 'CUENTAS POR PAGAR DIVERSAS ? RELACIONADAS', '1', '4'),
('48', '48', 'PROVISIONES', '1', '4'),
('49', '49', 'PASIVO DIFERIDO', '1', '4'),
('50', '50', 'CAPITAL', '1', '5'),
('51', '51', 'ACCIONES DE INVERSIÓN', '1', '5'),
('52', '52', 'CAPITAL ADICIONAL', '1', '5'),
('56', '56', 'RESULTADOS NO REALIZADOS', '1', '5'),
('57', '57', 'EXCEDENTE DE REVALUACIÓN', '1', '5'),
('58', '58', 'RESERVAS', '1', '5'),
('59', '59', 'RESULTADOS ACUMULADOS', '1', '5'),
('60', '60', 'COMPRAS', '1', '6'),
('61', '61', 'VARIACIÓN DE EXISTENCIAS', '1', '6'),
('62', '62', 'GASTOS DE PERSONAL, DIRECTORES Y GERENTES', '1', '6'),
('63', '63', 'GASTOS DE SERVICIOS PRESTADOS POR TERCEROS', '1', '6'),
('64', '64', 'GASTOS POR TRIBUTOS', '1', '6'),
('65', '65', 'OTROS GASTOS DE GESTIÓN', '1', '6'),
('66', '66', 'PÉRDIDA POR MEDICIÓN DE ACTIVOS NO FINANCIEROS AL VALOR RAZONABLE', '1', '6'),
('67', '67', 'GASTOS FINANCIEROS', '1', '6'),
('68', '68', 'VALUACIÓN Y DETERIORO DE ACTIVOS Y PROVISIONES', '1', '6'),
('69', '69', 'COSTO DE VENTAS', '1', '6'),
('70', '70', 'VENTAS', '1', '7'),
('71', '71', 'VARIACIÓN DE LA PRODUCCIÓN ALMACENADA', '1', '7'),
('72', '72', 'PRODUCCIÓN DE ACTIVO INMOVILIZADO', '1', '7'),
('73', '73', 'DESCUENTOS, REBAJAS Y BONIFICACIONES OBTENIDOS', '1', '7'),
('74', '74', 'DESCUENTOS, REBAJAS Y BONIFICACIONES CONCEDIDOS', '1', '7'),
('75', '75', 'OTROS INGRESOS DE GESTIÓN', '1', '7'),
('76', '76', 'GANANCIA POR MEDICIÓN DE ACTIVOS NO FINANCIEROS AL VALOR RAZONABLE', '1', '7'),
('77', '77', 'INGRESOS FINANCIEROS', '1', '7'),
('78', '78', 'CARGAS CUBIERTAS POR PROVISIONES', '1', '7'),
('79', '79', 'CARGAS IMPUTABLES A CUENTAS DE COSTOS Y GASTOS', '1', '7'),
('80', '80', 'MARGEN COMERCIAL', '1', '8'),
('81', '81', 'PRODUCCIÓN DEL EJERCICIO', '1', '8'),
('82', '82', 'VALOR AGREGADO', '1', '8'),
('83', '83', 'EXCEDENTE BRUTO (INSUFICIENCIA BRUTA) DE EXPLOTACIÓN', '1', '8'),
('84', '84', 'RESULTADO DE EXPLOTACIÓN', '1', '8'),
('85', '85', 'RESULTADO ANTES DE PARTICIPACIONES E IMPUESTOS', '1', '8'),
('87', '87', 'PARTICIPACIONES DE LOS TRABAJADORES', '1', '8'),
('88', '88', 'IMPUESTO A LA RENTA', '1', '8'),
('89', '89', 'DETERMINACIÓN DEL RESULTADO DEL EJERCICIO', '1', '8'),
('91', '91', 'COSTOS POR DISTRIBUIR.', '1', '9'),
('92', '92', 'COSTOS DE PRODUCCIÓN.', '1', '9'),
('93', '93', 'CENTROS DE COSTOS.', '1', '9'),
('94', '94', 'GASTOS ADMINISTRATIVOS.', '1', '9'),
('95', '95', 'GASTOS DE VENTAS.', '1', '9'),
('96', '96', 'GASTOS FINANCIEROS', '1', '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_division`
--

CREATE TABLE IF NOT EXISTS `cont_division` (
  `id_division` varchar(22) NOT NULL,
  `cuenta` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_sub_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_division`),
  KEY `cont_sub_cuenta_cont_division_fk` (`id_sub_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_division`
--

INSERT INTO `cont_division` (`id_division`, `cuenta`, `descripcion`, `estado`, `id_sub_cuenta`) VALUES
('1011', '1011', 'EFECTIVO', '1', '101'),
('1021', '1021', 'FONDOS FIJOS', '1', '102'),
('1041', '1041', 'CUENTAS CORRIENTES OPERATIVAS', '1', '104'),
('1042', '1042', 'CUENTAS CORRIENTES PARA FINES ESPECÍFICOS', '1', '104'),
('1051', '1051', 'OTROS EQUIVALENTES DE EFECTIVO', '1', '105'),
('1061', '1061', 'DEPÓSITOS DE AHORRO', '1', '106'),
('1062', '1062', 'DEPÓSITOS A PLAZO', '1', '106'),
('1071', '1071', 'FONDOS SUJETOS A RESTRICCIÓN', '1', '107'),
('1111', '1111', 'VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '111'),
('1112', '1112', 'VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '111'),
('1113', '1113', 'VALORES EMITIDOS POR EMPRESAS', '1', '111'),
('1114', '1114', 'OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '111'),
('1115', '1115', 'PARTICIPACIONES EN ENTIDADES', '1', '111'),
('1121', '1121', 'VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '112'),
('1122', '1122', 'VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '112'),
('1123', '1123', 'VALORES EMITIDOS POR EMPRESAS', '1', '112'),
('1124', '1124', 'OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '112'),
('1131', '1131', 'INVERSIONES MANTENIDAS PARA NEGOCIACION - ACUERDO DE COMPRA', '1', '113'),
('1132', '1132', 'INVERSIONES DISPONIBLES PARA LA VENTA - ACUERDO DE COMPRA', '1', '113'),
('1211', '1211', 'NO EMITIDAS', '1', '121'),
('1212', '1212', 'EMITIDAS EN CARTERA', '1', '121'),
('1213', '1213', 'EN COBRANZA', '1', '121'),
('1214', '1214', 'EN DESCUENTO', '1', '121'),
('1231', '1231', 'EN CARTERA', '1', '123'),
('1232', '1232', 'EN COBRANZA', '1', '123'),
('1233', '1233', 'EN DESCUENTO', '1', '123'),
('1311', '1311', 'NO EMITIDAS', '1', '131'),
('1312', '1312', 'EMITIDAS EN CARTERA', '1', '131'),
('1313', '1313', 'EN COBRANZA', '1', '131'),
('1314', '1314', 'EN DESCUENTO', '1', '131'),
('1321', '1321', 'ANTICIPOS RECIBIDOS', '1', '132'),
('1331', '1331', 'EN CARTERA', '1', '133'),
('1332', '1332', 'EN COBRANZA', '1', '133'),
('1333', '1333', 'EN DESCUENTO', '1', '133'),
('1411', '1411', 'PRÉSTAMOS', '1', '141'),
('1412', '1412', 'ADELANTO DE REMUNERACIONES', '1', '141'),
('1413', '1413', 'ENTREGAS A RENDIR CUENTA', '1', '141'),
('1419', '1419', 'OTRAS CUENTAS POR COBRAR AL PERSONAL', '1', '141'),
('1421', '1421', 'SUSCRIPCIONES POR COBRAR A SOCIOS O ACCIONISTAS', '1', '142'),
('1422', '1422', 'PRÉSTAMOS', '1', '142'),
('1431', '1431', 'PRÉSTAMOS', '1', '143'),
('1432', '1432', 'ADELANTO DE DIETAS', '1', '143'),
('1433', '1433', 'ENTREGAS A RENDIR CUENTA', '1', '143'),
('1441', '1441', 'PRÉSTAMOS', '1', '144'),
('1442', '1442', 'ADELANTO DE NUMERACIONES', '1', '144'),
('1443', '1443', 'ENTREGAS A RENDIR CUENTA', '1', '144'),
('1611', '1611', 'CON GARANTÍA', '1', '161'),
('1612', '1612', 'SIN GARANTÍA', '1', '161'),
('1621', '1621', 'COMPAÑÍAS ASEGURADORAS', '1', '162'),
('1622', '1622', 'TRANSPORTADORAS', '1', '162'),
('1623', '1623', 'SERVICIOS PÚBLICOS', '1', '162'),
('1624', '1624', 'TRIBUTOS', '1', '162'),
('1629', '1629', 'OTRAS', '1', '162'),
('1631', '1631', 'INTERESES', '1', '163'),
('1632', '1632', 'REGALÍAS', '1', '163'),
('1633', '1633', 'DIVIDENDOS', '1', '163'),
('1641', '1641', 'PRÉSTAMOS DE INSTITUCIONES NO FINANCIERAS', '1', '164'),
('1642', '1642', 'PRÉSTAMOS DE INSTITUCIONES FINANCIERAS', '1', '164'),
('1644', '1644', 'DEPÓSITO EN GARANTÍA POR ALQUILERES', '1', '164'),
('1649', '1649', 'OTROS DEPÓSITOS EN GARANTÍA', '1', '164'),
('1651', '1651', 'INVERSIÓN MOBILIARIA', '1', '165'),
('1652', '1652', 'INVERSIÓN INMOBILIARIA', '1', '165'),
('1653', '1653', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '165'),
('1654', '1654', 'INTANGIBLES', '1', '165'),
('1655', '1655', 'ACTIVOS BIOLÓGICOS', '1', '165'),
('1661', '1661', 'INSTRUMENTOS FINANCIEROS', '1', '166'),
('1662', '1662', 'INSTRUMENTOS FINANCIEROS DERIVADOS', '1', '166'),
('1681', '1681', 'ENTREGAS A RENDIR CUENTA A TERCEROS', '1', '168'),
('1682', '1682', 'OTRAS CUENTAS POR COBRAR DIVERSAS', '1', '168'),
('1711', '1711', 'CON GARANTÍA', '1', '171'),
('1712', '1712', 'SIN GARANTÍA', '1', '171'),
('1731', '1731', 'INTERESES', '1', '173'),
('1732', '1732', 'REGALÍAS', '1', '173'),
('1733', '1733', 'DIVIDENDOS', '1', '173'),
('1751', '1751', 'INVERSIÓN MOBILIARIA', '1', '175'),
('1752', '1752', 'INVERSIÓN INMOBILIARIA', '1', '175'),
('1753', '1753', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '175'),
('1754', '1754', 'INTANGIBLES', '1', '175'),
('1755', '1755', 'ACTIVOS BIOLÓGICOS', '1', '175'),
('1911', '1911', 'FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR', '1', '191'),
('1913', '1913', 'LETRAS POR COBRAR', '1', '191'),
('1921', '1921', 'FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR', '1', '192'),
('1922', '1922', 'LETRAS POR COBRAR', '1', '192'),
('1931', '1931', 'PERSONAL', '1', '193'),
('1932', '1932', 'ACCIONISTAS', '1', '193'),
('1933', '1933', 'DIRECTORES', '1', '193'),
('1934', '1934', 'GERENTES', '1', '193'),
('1938', '1938', 'DIVERSAS', '1', '193'),
('1941', '1941', 'PRESTAMOS', '1', '194'),
('1942', '1942', 'RECLAMACIONES A TERCEROS', '1', '194'),
('1943', '1943', 'INTERESES REGALIAS Y DIVIDENDOS ', '1', '194'),
('1944', '1944', 'DEPOSITOS OTORGADOS EN GARANTIA', '1', '194'),
('1945', '1945', 'VENTA DE ACTIVO INMOVILIZADO', '1', '194'),
('1946', '1946', 'ACTIVOS POR INSTRUMENTOS FINANCIEROS ', '1', '194'),
('1949', '1949', 'OTRAS CUENTAS POR COBRAR DIVERSAS', '1', '194'),
('1951', '1951', 'PRESTAMOS', '1', '195'),
('1953', '1953', 'INTERESES REGALIAS Y DIVIDENDOS ', '1', '195'),
('1954', '1954', 'DEPOSITOS OTORGADOS EN GARANTIA', '1', '195'),
('1955', '1955', 'VENTA DE ACTIVO INMOVILIZADO', '1', '195'),
('1956', '1956', 'ACTIVOS POR INSTRUMENTOS FINANCIEROS ', '1', '195'),
('1958', '1958', 'OTRAS CUENTAS POR COBRAR DIVERSAS', '1', '195'),
('2011', '2011', 'MERCADERÍAS MANUFACTURADAS', '1', '201'),
('2031', '2031', 'DE ORIGEN ANIMAL', '1', '203'),
('2032', '2032', 'DE ORIGEN VEGETAL', '1', '203'),
('2131', '2131', 'DE ORIGEN ANIMAL', '1', '213'),
('2132', '2132', 'DE ORIGEN VEGETAL', '1', '213'),
('2331', '2331', 'DE ORIGEN ANIMAL', '1', '233'),
('2332', '2332', 'DE ORIGEN VEGETAL', '1', '233'),
('2521', '2521', 'COMBUSTIBLES', '1', '252'),
('2522', '2522', 'LUBRICANTES', '1', '252'),
('2523', '2523', 'ENERGÍA', '1', '252'),
('2524', '2524', 'OTROS SUMINISTROS', '1', '252'),
('2711', '2711', 'TERRENOS', '1', '271'),
('2712', '2712', 'EDIFICACIONES', '1', '271'),
('2721', '2721', 'TERRENOS', '1', '272'),
('2722', '2722', 'EDIFICACIONES', '1', '272'),
('2723', '2723', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '272'),
('2724', '2724', 'EQUIPO DE TRANSPORTE', '1', '272'),
('2725', '2725', 'MUEBLES Y ENSERES', '1', '272'),
('2726', '2726', 'EQUIPOS DIVERSOS', '1', '272'),
('2727', '2727', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '272'),
('2731', '2731', 'CONCESIONES, LICENCIAS Y DERECHOS', '1', '273'),
('2732', '2732', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '273'),
('2733', '2733', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '273'),
('2734', '2734', 'COSTO DE EXPLORACION Y DESARROLLO', '1', '273'),
('2735', '2735', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '273'),
('2736', '2736', 'RESERVAS DE RECURSOS EXTRAÍBLES', '1', '273'),
('2739', '2739', 'OTROS ACTIVOS INTANGIBLES', '1', '273'),
('2741', '2741', 'ACTIVOS BIOLÓGICOS EN PRODUCCIÓN', '1', '274'),
('2742', '2742', 'ACTIVOS BIOLÓGICOS EN DESARROLLO', '1', '274'),
('2752', '2752', 'EDIFICACIONES ', '1', '275'),
('2762', '2762', 'EDIFICACIONES ', '1', '276'),
('2763', '2763', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '276'),
('2764', '2764', 'EQUIPOS E TRANSPORTE ', '1', '276'),
('2765', '2765', 'MUEBLES Y ENSERES', '1', '276'),
('2766', '2766', 'EQUIPOS DIVERSOS ', '1', '276'),
('2767', '2767', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '276'),
('2771', '2771', 'CONCESIONES, LICENCIAS Y DERECHOS', '1', '277'),
('2772', '2772', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '277'),
('2773', '2773', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '277'),
('2774', '2774', 'COSTO DE EXPLORACION Y DESARROLLO', '1', '277'),
('2775', '2775', 'FORMULAS DISEÑOS Y PROTOTIPOS', '1', '277'),
('2776', '2776', 'RESERVAS DE RECURSOS EXTRAIBLES ', '1', '277'),
('2779', '2779', 'OTROS ACTIVOS ', '1', '277'),
('2781', '2781', 'ACTIVOS BIOLOGICOS EN PRODUCCION ', '1', '278'),
('2782', '2782', 'ACTIVOS BIOLOGICOS EN DESARROLLO', '1', '278'),
('2791', '2791', 'INVERSION INMOBILIARIA', '1', '279'),
('2793', '2793', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '279'),
('2794', '2794', 'INTANGIBLES ', '1', '279'),
('2795', '2795', 'ACTIVOS BIOLOGICOS ', '1', '279'),
('2911', '2911', 'MERCADERÍAS MANUFACTURADAS', '1', '291'),
('2912', '2912', 'MERCADERÍAS DE EXTRACCIÓN', '1', '291'),
('2913', '2913', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '291'),
('2914', '2914', 'MERCADERÍAS INMUEBLES', '1', '291'),
('2918', '2918', 'OTRAS MERCADERÍAS', '1', '291'),
('2921', '2921', 'PRODUCTOS MANUFACTURADOS', '1', '292'),
('2922', '2922', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '292'),
('2923', '2923', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '292'),
('2924', '2924', 'PRODUCTOS INMUEBLES', '1', '292'),
('2925', '2925', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '292'),
('2927', '2927', 'OTROS PRODUCTOS TERMINADOS', '1', '292'),
('2928', '2928', 'COSTOS DE FINANCIACIÓN ? PRODUCTOS TERMINADOS', '1', '292'),
('2931', '2931', 'SUBPRODUCTOS', '1', '293'),
('2932', '2932', 'DESECHOS Y DESPERDICIOS', '1', '293'),
('2941', '2941', 'PRODUCTOS EN PROCESO DE MANUFACTURA', '1', '294'),
('2942', '2942', 'PRODUCTOS EXTRAÍDOS EN PROCESO DE TRANSFORMACIÓN ', '1', '294'),
('2943', '2943', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS EN PROCESO', '1', '294'),
('2944', '2944', 'PRODUCTOS INMUEBLES EN PROCESO', '1', '294'),
('2945', '2945', 'EXISTENCIAS DE SERVICIOS EN PROCESO', '1', '294'),
('2947', '2947', 'OTROS PRODUCTOS EN PROCESO', '1', '294'),
('2948', '2948', 'COSTOS DE FINANCIACIÓN ? PRODUCTOS EN PROCESO', '1', '294'),
('2951', '2951', 'MATERIAS PRIMAS PARA PRODUCTOS MANUFACTURADOS', '1', '295'),
('2952', '2952', 'MATERIAS PRIMAS PARA PRODUCTOS DE EXTRACCIÓN', '1', '295'),
('2953', '2953', 'MATERIAS PRIMAS PARA PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS', '1', '295'),
('2954', '2954', 'MATERIAS PRIMAS PARA PRODUCTOS INMUEBLES', '1', '295'),
('2961', '2961', 'MATERIALES AUXILIARES', '1', '296'),
('2962', '2962', 'SUMINISTROS', '1', '296'),
('2963', '2963', 'REPUESTOS', '1', '296'),
('2971', '2971', 'ENVASES', '1', '297'),
('2972', '2972', 'EMBALAJES', '1', '297'),
('2981', '2981', 'MERCADERÍAS', '1', '298'),
('2982', '2982', 'MATERIAS PRIMAS', '1', '298'),
('2983', '2983', 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS', '1', '298'),
('2984', '2984', 'ENVASES Y EMBALAJES', '1', '298'),
('3011', '3011', 'INSTRUMENTOS FINANCIEROS REPRESENTATIVOS DE DEUDA', '1', '301'),
('3021', '3021', 'CERTIFICADOS DE SUSCRIPCIÓN PREFERENTE', '1', '302'),
('3022', '3022', 'ACCIONES REPRESENTATIVAS DE CAPITAL SOCIAL - COMUNES', '1', '302'),
('3023', '3023', 'ACCIONES REPRESENTATIVAS DE CAPITAL SOCIAL - PREFERENTES', '1', '302'),
('3024', '3024', 'ACCIONES DE INVERSION', '1', '302'),
('3025', '3025', 'CERTIFICADOS DE PARTICIPACIÓN DE FONDOS DE INVERSION ', '1', '302'),
('3026', '3026', 'CERTIFICADO DE PARTICIPACION EN FONDOS MUTUOS ', '1', '302'),
('3027', '3027', 'PARTICIPACIONES EN ASOCIACIONES EN PARTICIPACION Y CONSORCIOS ', '1', '302'),
('3028', '3028', 'OTROS TÍTULOS REPRESENTATIVOS DE PATRIMONIO', '1', '302'),
('3081', '3081', 'INVERSIONES A SER MANTENIDAS HASTA EL VENCIMIENTO - ACUERDO DE COMPRA ', '1', '308'),
('3082', '3082', 'INSTRUMENTOS FINANCIEROS REPRESENTATIVOS DE DERECHO PATRIMONIAL - ACUERDO DE COMPRA ', '1', '308'),
('3111', '3111', 'URBANOS', '1', '311'),
('3112', '3112', 'RURALES', '1', '311'),
('3121', '3121', 'EDIFICACIONES', '1', '312'),
('3211', '3211', 'TERRENOS', '1', '321'),
('3212', '3212', 'EDIFICACIONES', '1', '321'),
('3221', '3221', 'TERRENOS', '1', '322'),
('3222', '3222', 'EDIFICACIONES', '1', '322'),
('3223', '3223', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '322'),
('3224', '3224', 'EQUIPO DE TRANSPORTE', '1', '322'),
('3225', '3225', 'MUEBLES Y ENSERES', '1', '322'),
('3226', '3226', 'EQUIPOS DIVERSOS', '1', '322'),
('3227', '3227', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '322'),
('3311', '3311', 'TERRENOS', '1', '331'),
('3321', '3321', 'EDIFICACIONES ADMINISTRATIVAS', '1', '332'),
('3322', '3322', 'ALMACENES', '1', '332'),
('3323', '3323', 'EDIFICACIONES PARA PRODUCCIÓN', '1', '332'),
('3324', '3324', 'INSTALACIONES', '1', '332'),
('3331', '3331', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '333'),
('3341', '3341', 'VEHÍCULOS MOTORIZADOS', '1', '334'),
('3342', '3342', 'VEHÍCULOS NO MOTORIZADOS', '1', '334'),
('3351', '3351', 'MUEBLES', '1', '335'),
('3352', '3352', 'ENSERES', '1', '335'),
('3361', '3361', 'EQUIPO PARA PROCESAMIENTO DE INFORMACIÓN (DE CÓMPUTO)', '1', '336'),
('3362', '3362', 'EQUIPO DE COMUNICACIÓN', '1', '336'),
('3363', '3363', 'EQUIPO DE SEGURIDAD', '1', '336'),
('3369', '3369', 'OTROS EQUIPOS', '1', '336'),
('3371', '3371', 'HERRAMIENTAS', '1', '337'),
('3372', '3372', 'UNIDADES DE REEMPLAZO', '1', '337'),
('3381', '3381', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '338'),
('3382', '3382', 'EQUIPO DE TRANSPORTE', '1', '338'),
('3383', '3383', 'MUEBLES Y ENSERES', '1', '338'),
('3386', '3386', 'EQUIPOS DIVERSOS', '1', '338'),
('3387', '3387', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '338'),
('3391', '3391', 'ADAPTACIÓN DE TERRENOS', '1', '339'),
('3392', '3392', 'CONSTRUCCIONES EN CURSO', '1', '339'),
('3393', '3393', 'MAQUINARIA EN MONTAJE', '1', '339'),
('3394', '3394', 'INVERSIÓN INMOBILIARIA EN CURSO', '1', '339'),
('3397', '3397', 'COSTO DE FINANCIACIÓN ? INVERSIONES INMOBILIARIAS', '1', '339'),
('3398', '3398', 'COSTO DE FINANCIACIÓN ? INMUEBLES, MAQUINARIA Y EQUIPO', '1', '339'),
('3399', '3399', 'OTROS ACTIVOS EN CURSO', '1', '339'),
('3411', '3411', 'CONCESIONES', '1', '341'),
('3412', '3412', 'LICENCIAS', '1', '341'),
('3419', '3419', 'OTROS DERECHOS', '1', '341'),
('3421', '3421', 'PATENTES', '1', '342'),
('3422', '3422', 'MARCAS', '1', '342'),
('3431', '3431', 'APLICACIONES INFORMÁTICAS', '1', '343'),
('3441', '3441', 'COSTOS DE EXPLORACIÓN', '1', '344'),
('3442', '3442', 'COSTOS DE DESARROLLO', '1', '344'),
('3451', '3451', 'FÓRMULAS', '1', '345'),
('3452', '3452', 'DISEÑOS Y PROTOTIPOS', '1', '345'),
('3461', '3461', 'MINERALES', '1', '346'),
('3462', '3462', 'PETRÓLEO Y GAS', '1', '346'),
('3463', '3463', 'MADERA', '1', '346'),
('3469', '3469', 'OTROS RECURSOS EXTRAÍBLES', '1', '346'),
('3471', '3471', 'PLUSVALÍA MERCANTIL', '1', '347'),
('3491', '3491', 'OTROS ACTIVOS INTANGIBLES', '1', '349'),
('3511', '3511', 'DE ORIGEN ANIMAL', '1', '351'),
('3512', '3512', 'DE ORIGEN VEGETAL', '1', '351'),
('3521', '3521', 'DE ORIGEN ANIMAL', '1', '352'),
('3522', '3522', 'DE ORIGEN VEGETAL', '1', '352'),
('3611', '3611', 'TERRENOS', '1', '361'),
('3612', '3612', 'EDIFICACIONES', '1', '361'),
('3631', '3631', 'TERRENOS', '1', '363'),
('3632', '3632', 'EDIFICACIONES', '1', '363'),
('3633', '3633', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '363'),
('3634', '3634', 'EQUIPO DE TRANSPORTE', '1', '363'),
('3635', '3635', 'MUEBLES Y ENSERES', '1', '363'),
('3636', '3636', 'EQUIPOS DIVERSOS', '1', '363'),
('3637', '3637', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '363'),
('3641', '3641', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '364'),
('3642', '3642', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '364'),
('3643', '3643', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '364'),
('3644', '3644', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '364'),
('3645', '3645', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '364'),
('3647', '3647', 'PLUSVALÍA MERCANTIL', '1', '364'),
('3649', '3649', 'OTROS ACTIVOS INTANGIBLES', '1', '364'),
('3651', '3651', 'ACTIVOS BIOLÓGICOS EN PRODUCCIÓN', '1', '365'),
('3652', '3652', 'ACTIVOS BIOLÓGICOS EN DESARROLLO', '1', '365'),
('3661', '3661', 'INVERSIONES A SER MANTENIDAS HASTA EL VENCIMIENTO ', '1', '366'),
('3662', '3662', 'INVERSIONES FINANCERAS REPRESENTATIVAS DE DERECHO PATRIMONIAL', '1', '366'),
('3711', '3711', 'IMPUESTO A LA RENTA DIFERIDO - PATRIMONIO', '1', '371'),
('3712', '3712', 'IMPUESTO A LA RENTA DIFERIDO - RESUSLTADOS ', '1', '371'),
('3721', '3721', 'PARTICIPACIONES DE LOS TRABAJADORES DIFERIDAS - PATRIMONIO', '1', '372'),
('3722', '3722', 'PARTICIPACIONES DE LOS TRABAJADORES DIFERIDAS - RESULTADOS', '1', '372'),
('3731', '3731', 'INTERESES NO DEVENGADOS EN TRANSACCIONES CON TERCEROS', '1', '373'),
('3732', '3732', 'INTERESES NO DEVENGADOS EN MEDICIÓN A VALOR DESCONTADO', '1', '373'),
('3811', '3811', 'OBRAS DE ARTE', '1', '381'),
('3812', '3812', 'BIBLIOTECA', '1', '381'),
('3813', '3813', 'OTROS', '1', '381'),
('3821', '3821', 'MONEDAS Y JOYAS', '1', '382'),
('3822', '3822', 'BIENES ENTREGADOS EN COMODATO', '1', '382'),
('3823', '3823', 'BIENES RECIBIDOS EN PAGO (ADJUDICADOS Y REALIZABLES)', '1', '382'),
('3829', '3829', 'OTROS', '1', '382'),
('3911', '3911', 'INVERSIONES INMOBILIARIAS', '1', '391'),
('3912', '3912', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '391'),
('3913', '3913', 'INMUEBLES, MAQUINARIA Y EQUIPO - COSTO', '1', '391'),
('3914', '3914', 'INMUEBLES, MAQUINARIA Y EQUIPO - REVALUACIÓN', '1', '391'),
('3915', '3915', 'INMUEBLES, MAQUINARIA Y EQUIPO ? COSTO DE FINANCIACIÓN', '1', '391'),
('3916', '3916', 'ACTIVOS BIOLÓGICOS EN PRODUCCIÓN ? COSTO', '1', '391'),
('3917', '3917', 'ACTIVOS BIOLÓGICOS EN PRODUCCIÓN ? COSTO DE FINANCIACIÓN', '1', '391'),
('3921', '3921', 'INTANGIBLES - COSTO', '1', '392'),
('3922', '3922', 'INTANGIBLES - REVALUACIÓN', '1', '392'),
('3923', '3923', 'INTAGIBLES - COSTO DE FINANCIACION ', '1', '392'),
('3931', '3931', 'AGOTAMIENTO DE RESERVAS DE RECURSOS EXTRAÍBLES', '1', '393'),
('4011', '4011', 'IMPUESTO GENERAL A LAS VENTAS', '1', '401'),
('4012', '4012', 'IMPUESTO SELECTIVO AL CONSUMO', '1', '401'),
('4015', '4015', 'DERECHOS ADUANEROS', '1', '401'),
('4017', '4017', 'IMPUESTO A LA RENTA', '1', '401'),
('4018', '4018', 'OTROS IMPUESTOS Y CONTARPRESTACIONE ', '1', '401'),
('4031', '4031', 'ESSALUD', '1', '403'),
('4032', '4032', 'ONP', '1', '403'),
('4033', '4033', 'CONTRIBUCIÓN AL SENATI', '1', '403'),
('4034', '4034', 'CONTRIBUCIÓN AL SENCICO', '1', '403'),
('4039', '4039', 'OTRAS INSTITUCIONES', '1', '403'),
('4061', '4061', 'IMPUESTOS', '1', '406'),
('4062', '4062', 'CONTRIBUCIONES', '1', '406'),
('4063', '4063', 'TASAS', '1', '406'),
('4081', '4081', 'CUENTA PROPIA', '1', '408'),
('4082', '4082', 'CUENTA DE TERCEROS', '1', '408'),
('4111', '4111', 'SUELDOS Y SALARIOS POR PAGAR', '1', '411'),
('4112', '4112', 'COMISIONES POR PAGAR', '1', '411'),
('4113', '4113', 'REMUNERACIONES EN ESPECIE POR PAGAR', '1', '411'),
('4114', '4114', 'GRATIFICACIONES POR PAGAR', '1', '411'),
('4115', '4115', 'VACACIONES POR PAGAR', '1', '411'),
('4151', '4151', 'COMPENSACIÓN POR TIEMPO DE SERVICIOS', '1', '415'),
('4152', '4152', 'ADELANTO DE COMPENSACIÓN POR TIEMPO DE SERVICIOS', '1', '415'),
('4153', '4153', 'PENSIONES Y JUBILACIONES', '1', '415'),
('4211', '4211', 'NO EMITIDAS', '1', '421'),
('4212', '4212', 'EMITIDAS', '1', '421'),
('4311', '4311', 'NO EMITIDAS', '1', '431'),
('4312', '4312', 'EMITIDAS', '1', '431'),
('4321', '4321', 'ANTCIPOS OTORGADOS', '1', '432'),
('4331', '4331', 'LETRAS POR PAGAR', '1', '433'),
('4341', '4341', 'HONORARIOS POR PAGAR', '1', '434'),
('4411', '4411', 'PRÉSTAMOS', '1', '441'),
('4412', '4412', 'DIVIDENDOS', '1', '441'),
('4419', '4419', 'OTRAS CUENTAS POR PAGAR', '1', '441'),
('4421', '4421', 'DIETAS', '1', '442'),
('4429', '4429', 'OTRAS CUENTAS POR PAGAR', '1', '442'),
('4511', '4511', 'INSTITUCIONES FINANCIERAS', '1', '451'),
('4512', '4512', 'OTRAS ENTIDADES', '1', '451'),
('4531', '4531', 'BONOS EMITIDOS ', '1', '453'),
('4532', '4532', 'BONOS TITULIZADOS', '1', '453'),
('4533', '4533', 'PAPELES COMERCIALES', '1', '453'),
('4539', '4539', 'OTRAS OBLIGACIONES   ', '1', '453'),
('4541', '4541', 'LETRAS', '1', '454'),
('4542', '4542', 'PAPELES COMERCIALES', '1', '454'),
('4543', '4543', 'BONOS', '1', '454'),
('4544', '4544', 'PAGARÉS', '1', '454'),
('4545', '4545', 'FACTURAS CONFORMADAS', '1', '454'),
('4549', '4549', 'OTRAS OBLIGACIONES FINANCIERAS', '1', '454'),
('4551', '4551', 'PRÉSTAMOS DE INSTITUCIONES FINANCIERAS Y OTRAS ENTIDADES', '1', '455'),
('4552', '4552', 'CONTRATOS DE ARRENDAMIENTO FINANCIERO', '1', '455'),
('4553', '4553', 'OBLIGACIONES EMITIDAS', '1', '455'),
('4554', '4554', 'OTROS INSTRUMENTOS FINANCIEROS POR PAGAR', '1', '455'),
('4641', '4641', 'INSTRUMENTOS FINANCEROS PRIMARIOS', '1', '464'),
('4642', '4642', 'INSTRUMENTOS FIANNCIEROS DERIVADOS ', '1', '464'),
('4651', '4651', 'INVESIONES MOVILIARIAS', '1', '465'),
('4652', '4652', 'INVERSIONES INMOBILIARIAS', '1', '465'),
('4653', '4653', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '465'),
('4654', '4654', 'INMUEBLE MAQUINARIAS Y EQUIPOS ', '1', '465'),
('4655', '4655', 'INTANGIBLES', '1', '465'),
('4656', '4656', 'ACTIVOS BIOLOGICOS', '1', '465'),
('4691', '4691', 'SUBSIDIOS GUBERNAMENTALES', '1', '469'),
('4692', '4692', 'DONACIONES CONDICIONADAS', '1', '469'),
('4699', '4699', 'OTRAS CUENTAS POR PAGAR ', '1', '469'),
('4711', '4711', 'MATRIZ', '1', '471'),
('4712', '4712', 'SUBSIDIARIAS', '1', '471'),
('4713', '4713', 'ASOCIADAS', '1', '471'),
('4714', '4714', 'SUCURSALES', '1', '471'),
('4715', '4715', 'OTRAS', '1', '471'),
('4721', '4721', 'MATRIZ', '1', '472'),
('4722', '4722', 'SUBSIDIARIAS', '1', '472'),
('4723', '4723', 'ASOCIADAS', '1', '472'),
('4724', '4724', 'SUCURSALES', '1', '472'),
('4725', '4725', 'OTRAS', '1', '472'),
('4731', '4731', 'MATRIZ', '1', '473'),
('4732', '4732', 'SUBSIDIARIAS', '1', '473'),
('4733', '4733', 'ASOCIADAS', '1', '473'),
('4734', '4734', 'SUCURSALES', '1', '473'),
('4741', '4741', 'MATRIZ', '1', '474'),
('4742', '4742', 'SUBSIDIARIAS', '1', '474'),
('4743', '4743', 'ASOCIADAS', '1', '474'),
('4744', '4744', 'SUCURSALES', '1', '474'),
('4745', '4745', 'OTRAS', '1', '474'),
('4751', '4751', 'MATRIZ', '1', '475'),
('4752', '4752', 'SUBSIDIARIAS', '1', '475'),
('4753', '4753', 'ASOCIADAS', '1', '475'),
('4754', '4754', 'SUCURSALES', '1', '475'),
('4755', '4755', 'OTRAS', '1', '475'),
('4771', '4771', 'INVERSIONES MOBILIARIAS   ', '1', '477'),
('4772', '4772', 'INVERSIONES INMOBILIARIAS', '1', '477'),
('4773', '4773', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '477'),
('4774', '4774', 'INMUEBLE MAQUINARIAS Y EQUIPOS ', '1', '477'),
('4775', '4775', 'INTANGIBLES', '1', '477'),
('4776', '4776', 'ACTIVOS BIOLOGICOS', '1', '477'),
('4791', '4791', 'OTRAS CUENTAS POR PAGAR DIVERSAS', '1', '479'),
('4911', '4911', 'IMPUESTO A LA RENTA DIFERIDO - PATRIMONIO', '1', '491'),
('4912', '4912', 'IMPUESTO A LA RENTA DIFERIDO - RESULTADOS', '1', '491'),
('4921', '4921', 'PARTICIPACIONES DE LOS TRABAJADORES DIFERIDAS - PATRIMONIO', '1', '492'),
('4922', '4922', 'PARTICIPACIONES DE LOS TRABAJADORES DIFERIDAS - RESULTADOS', '1', '492'),
('4931', '4931', 'INTERESES NO DEVENGADOS EN TRANSACCIONES CON TERCEROS', '1', '493'),
('4932', '4932', 'INTERESES NO DEVENGADOS EN MEDICIÓN A VALOR DESCONTADO', '1', '493'),
('5011', '5011', 'ACCIONES', '1', '501'),
('5012', '5012', 'PARTICIPACIONES', '1', '501'),
('5221', '5221', 'APORTES', '1', '522'),
('5222', '5222', 'RESERVAS', '1', '522'),
('5223', '5223', 'ACREENCIAS', '1', '522'),
('5224', '5224', 'UTILIDADES', '1', '522'),
('5631', '5631', 'GANANCIA', '1', '563'),
('5632', '5632', 'PÉRDIDA', '1', '563'),
('5641', '5641', 'GANANCIA', '1', '564'),
('5642', '5642', 'PÉRDIDA', '1', '564'),
('5711', '5711', 'INVERSIONES INMOBILIARIAS', '1', '571'),
('5712', '5712', 'INMUEBLES, MAQUINARIA Y EQUIPOS', '1', '571'),
('5713', '5713', 'INTANGIBLES', '1', '571'),
('5911', '5911', 'UTILIDADES ACUMULADAS', '1', '591'),
('5912', '5912', 'INGRESOS DE AÑOS ANTERIORES', '1', '591'),
('5921', '5921', 'PÉRDIDAS ACUMULADAS', '1', '592'),
('5922', '5922', 'GASTOS DE AÑOS ANTERIORES', '1', '592'),
('6011', '6011', 'MERCADERÍAS MANUFACTURADAS', '1', '601'),
('6012', '6012', 'MERCADERÍAS DE EXTRACCIÓN', '1', '601'),
('6013', '6013', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '601'),
('6014', '6014', 'MERCADERÍAS INMUEBLES', '1', '601'),
('6018', '6018', 'OTRAS MERCADERÍAS', '1', '601'),
('6021', '6021', 'MATERIAS PRIMAS PARA PRODUCTOS MANUFACTURADOS', '1', '602'),
('6022', '6022', 'MATERIAS PRIMAS PARA PRODUCTOS DE EXTRACCIÓN', '1', '602'),
('6023', '6023', 'MATERIAS PRIMAS PARA PRODUCTOS PARA PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS', '1', '602'),
('6024', '6024', 'MATERIAS PRIMAS PARA PRODUCTOS INMUEBLES', '1', '602'),
('6031', '6031', 'MATERIALES AUXILIARES', '1', '603'),
('6032', '6032', 'SUMINISTROS', '1', '603'),
('6033', '6033', 'REPUESTOS', '1', '603'),
('6041', '6041', 'ENVASES', '1', '604'),
('6042', '6042', 'EMBALAJES', '1', '604'),
('6091', '6091', 'COSTOS VINCULADOS CON LAS COMPRAS DE MERCADERÍAS', '1', '609'),
('6092', '6092', 'COSTOS VINCULADOS CON LAS COMPRAS DE MATERIAS PRIMAS', '1', '609'),
('6093', '6093', 'COSTOS VINCULADOS CON LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '609'),
('6094', '6094', 'COSTOS VINCULADOS CON LAS COMPRAS DE ENVASES Y EMBALAJES', '1', '609'),
('6111', '6111', 'MERCADERÍAS MANUFACTURADAS', '1', '611'),
('6112', '6112', 'MERCADERÍAS DE EXTRACCIÓN', '1', '611'),
('6113', '6113', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '611'),
('6114', '6114', 'MERCADERÍAS INMUEBLES', '1', '611'),
('6115', '6115', 'OTRAS MERCADERÍAS', '1', '611'),
('6121', '6121', 'MATERIAS PRIMAS PARA PRODUCTOS MANUFACTURADOS', '1', '612'),
('6122', '6122', 'MATERIAS PRIMAS PARA PRODUCTOS DE EXTRACCIÓN', '1', '612'),
('6123', '6123', 'MATERIAS PRIMAS PARA PRODUCTOS PARA PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS', '1', '612'),
('6124', '6124', 'MATERIAS PRIMAS PARA PRODUCTOS INMUEBLES', '1', '612'),
('6131', '6131', 'MATERIALES AUXILIARES', '1', '613'),
('6132', '6132', 'SUMINISTROS', '1', '613'),
('6133', '6133', 'REPUESTOS', '1', '613'),
('6141', '6141', 'ENVASES', '1', '614'),
('6142', '6142', 'EMBALAJES', '1', '614'),
('6211', '6211', 'SUELDOS Y SALARIOS', '1', '621'),
('6212', '6212', 'COMISIONES', '1', '621'),
('6213', '6213', 'REMUNERACIONES EN ESPECIE', '1', '621'),
('6214', '6214', 'GRATIFICACIONES', '1', '621'),
('6215', '6215', 'VACACIONES', '1', '621'),
('6221', '6221', 'OTRAS REMUNERACIONES', '1', '622'),
('6231', '6231', 'INDEMNIZACIONES AL PERSONAL', '1', '623'),
('6241', '6241', 'CAPACITACIÓN', '1', '624'),
('6251', '6251', 'ATENCIÓN AL PERSONAL', '1', '625'),
('6261', '6261', 'DIRECTOR', '1', '626'),
('6262', '6262', 'TESORERO', '1', '626'),
('6271', '6271', 'RÉGIMEN DE PRESTACIONES DE SALUD', '1', '627'),
('6272', '6272', 'RÉGIMEN DE PENSIONES', '1', '627'),
('6273', '6273', 'SEGURO COMPLEMENTARIO DE TRABAJO DE RIESGO, ACCIDENTES DE TRABAJO Y ENFERMEDADES PROFESIONALES', '1', '627'),
('6274', '6274', 'SEGURO DE VIDA', '1', '627'),
('6275', '6275', 'SEGUROS PARTICULARES DE PRESTACIONES DE SALUD - EPS Y OTROS PARTICULARES', '1', '627'),
('6276', '6276', 'CAJA DE BENEFICIOS DE SEGURIDAD SOCIAL DEL PESCADOR', '1', '627'),
('6277', '6277', 'CONTRIBUCIONES A SENCICO Y SENATI', '1', '627'),
('6291', '6291', 'COMPENSACIÓN POR TIEMPO DE SERVICIO', '1', '629'),
('6292', '6292', 'PENSIONES Y JUBILACIONES', '1', '629'),
('6293', '6293', 'OTROS BENEFICIOS POST-EMPLEO', '1', '629'),
('6311', '6311', 'TRANSPORTE', '1', '631'),
('6312', '6312', 'CORREOS', '1', '631'),
('6313', '6313', 'ALOJAMIENTO', '1', '631'),
('6314', '6314', 'ALIMENTACIÓN', '1', '631'),
('6315', '6315', 'OTROS GASTOS DE VIAJE ', '1', '631'),
('6321', '6321', 'ADMINISTRATIVA ', '1', '632'),
('6322', '6322', 'LEGAL Y TRIBUTARIA', '1', '632'),
('6323', '6323', 'AUDITORIA Y CONTABLE ', '1', '632'),
('6324', '6324', 'MERCADOTECNIA', '1', '632'),
('6325', '6325', 'MEDIOAMBIENTAL', '1', '632'),
('6326', '6326', 'INVESTIGACIOON Y DESARROLLLO', '1', '632'),
('6327', '6327', 'PRODUCCION', '1', '632'),
('6329', '6329', 'OTROS ', '1', '632'),
('6341', '6341', 'INVERSIONES INMOBILIARIAS', '1', '634'),
('6342', '6342', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '634'),
('6343', '6343', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '634'),
('6344', '6344', 'INTANGIBLES', '1', '634'),
('6345', '6345', 'ACTIVOS BIOLOGICOS', '1', '634'),
('6351', '6351', 'TERRENOS', '1', '635'),
('6352', '6352', 'EDIFICACIONES', '1', '635'),
('6353', '6353', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '635'),
('6354', '6354', 'EQUIPO DE TRANSPORTE', '1', '635'),
('6356', '6356', 'EQUIPOS DIVERSOS', '1', '635'),
('6361', '6361', 'ENERGÍA ELÉCTRICA', '1', '636'),
('6362', '6362', 'GAS', '1', '636'),
('6363', '6363', 'AGUA', '1', '636'),
('6364', '6364', 'TELÉFONO', '1', '636'),
('6365', '6365', 'INTERNET', '1', '636'),
('6366', '6366', 'RADIO', '1', '636'),
('6367', '6367', 'CABLE', '1', '636'),
('6371', '6371', 'PUBLICIDAD  ', '1', '637'),
('6372', '6372', 'PUBLICACIONES ', '1', '637'),
('6373', '6373', 'RELACIONES PUBLICAS ', '1', '637'),
('6391', '6391', 'GASTOS BANCARIOS', '1', '639'),
('6392', '6392', 'GASTOS DE LABORATORIO', '1', '639'),
('6411', '6411', 'IMPUESTO GENERAL A LAS VENTAS', '1', '641'),
('6412', '6412', 'CÁNONES Y DERECHOS', '1', '641'),
('6413', '6413', 'IMPUESTO TEMPORAL A LOS ACTIVOS NETOS ', '1', '641'),
('6414', '6414', 'IMPUESTO A LOS JUEGOS DE CASINO Y MAQUINAS TRAGAMONEDAS ', '1', '641'),
('6415', '6415', 'REGALIAS MINERAS ', '1', '641'),
('6416', '6416', 'CANONES ', '1', '641'),
('6419', '6419', 'OTROS ', '1', '641'),
('6431', '6431', 'IMPUESTO PREDIAL', '1', '643'),
('6432', '6432', 'ARBITRIOS MUNICIPALES Y SEGURIDAD CIUDADANA', '1', '643'),
('6433', '6433', 'IMPUESTO AL PATRIMONIO VEHICULAR', '1', '643'),
('6434', '6434', 'LICENCIA DE FUNCIONAMIENTO ', '1', '643'),
('6439', '6439', 'OTROS ', '1', '643'),
('6441', '6441', 'CONTRIBUCION A SENATI', '1', '644'),
('6442', '6442', 'CONTRIBUCION A SENCICO', '1', '644'),
('6443', '6443', 'OTRO ', '1', '644'),
('6551', '6551', 'COSTO NETO DE ENAJENACIÓN DE ACTIVOS INMOVILIZADOS', '1', '655'),
('6552', '6552', 'OPERACIONES DISCONTINUADAS - ABANDONO E ACTIVOS ', '1', '655'),
('6591', '6591', 'DONACIONES', '1', '659'),
('6592', '6592', 'SANCIONES ADMINISTRATIVAS', '1', '659'),
('6611', '6611', 'MERCADERÍAS', '1', '661'),
('6612', '6612', 'PRODUCTOS TERMINADOS ', '1', '661'),
('6613', '6613', 'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA', '1', '661'),
('6621', '6621', 'INVERSIONES INMOBILIARIAS', '1', '662'),
('6622', '6622', 'ACTIVOS BIOLÓGICOS', '1', '662'),
('6711', '6711', 'PRÉSTAMOS DE INSTITUCIONES FINANCIERAS Y OTRAS ENTIDADES', '1', '671'),
('6712', '6712', 'CONTRATOS DE ARRENDAMIENTO FINANCIERO', '1', '671'),
('6713', '6713', 'EMISIÓN Y COLOCACIÓN DE INSTRUMENTOS REPRESENTATIVOS DE DEUDA Y PATRIMONIO', '1', '671'),
('6714', '6714', 'DOCUMENTOS VENDIDOS O DESCONTADOS', '1', '671'),
('6731', '6731', 'PRÉSTAMOS DE INSTITUCIONES FINANCIERAS Y OTRAS ENTIDADES', '1', '673'),
('6732', '6732', 'CONTRATOS DE ARRENDAMIENTO FINANCIERO', '1', '673'),
('6733', '6733', 'OTROS INSTRUMENTOS FINANCIEROS POR PAGAR', '1', '673'),
('6734', '6734', 'DOCUMENTOS VENDIDOS O DESCONTADOS', '1', '673'),
('6735', '6735', 'OBLIGACIONES EMITIDAS', '1', '673'),
('6736', '6736', 'OBLIGACIONES COMERCIALES', '1', '673'),
('6737', '6737', 'OBLIGACIONES TRIBUTARIAS', '1', '673'),
('6791', '6791', 'PRIMAS POR OPCIONES', '1', '679'),
('6792', '6792', 'GASTOS FINANCIEROS EN MEDICIÓN A VALOR DESCONTADO', '1', '679'),
('6811', '6811', 'DEPRECIACIÓN DE INVERSIONES INMOBILIARIAS', '1', '681'),
('6812', '6812', 'DEPRECIACIÓN DE ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO ? INVERSIONES INMOBILIARIAS', '1', '681'),
('6813', '6813', 'DEPRECIACIÓN DE ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '681'),
('6814', '6814', 'DEPRECIACIÓN DE INMUEBLES, MAQUINARIA Y EQUIPO ? COSTO', '1', '681'),
('6815', '6815', 'DEPRECIACIÓN DE INMUEBLES, MAQUINARIA Y EQUIPO ? REVALUACIÓN', '1', '681'),
('6816', '6816', 'DEPRECIACIÓN DE INMUEBLES, MAQUINARIA Y EQUIPO ? COSTOS DE FINANCIACIÓN', '1', '681'),
('6817', '6817', 'DEPRECIACIÓN DE ACTIVOS BIOLÓGICOS EN PRODUCCIÓN ? COSTO', '1', '681'),
('6818', '6818', 'DEPRECIACIÓN DE ACTIVOS BIOLÓGICOS EN PRODUCCIÓN ? COSTO DE FINANCIACIÓN', '1', '681'),
('6821', '6821', 'AMORTIZACIÓN DE INTANGIBLES ADQUIRIDOS ? COSTO', '1', '682'),
('6822', '6822', 'AMORTIZACIÓN DE INTANGIBLES ADQUIRIDOS ? REVALUACIÓN', '1', '682'),
('6823', '6823', 'AMORTIZACIÓN DE INTANGIBLES GENERADOS INTERNAMENTE ? COSTO', '1', '682'),
('6824', '6824', 'AMORTIZACIÓN DE INTANGIBLES GENERADOS INTERNAMENTE ? REVALUACIÓN', '1', '682'),
('6831', '6831', 'AGOTAMIENTO DE RECURSOS NATURALES ADQUIRIDOS', '1', '683'),
('6841', '6841', 'ESTIMACIÓN DE CUENTAS DE COBRANZA DUDOSA', '1', '684'),
('6842', '6842', 'DESVALORIZACIÓN DE EXISTENCIAS', '1', '684'),
('6843', '6843', 'DESVALORIZACIÓN DE INVERSIONES MOBILIARIAS', '1', '684'),
('6851', '6851', 'DESVALORIZACIÓN DE INVERSIONES INMOBILIARIAS', '1', '685'),
('6852', '6852', 'DESVALORIZACIÓN DE INMUEBLES MAQUINARIA Y EQUIPO', '1', '685'),
('6853', '6853', 'DESVALORIZACIÓN DE INTANGIBLES', '1', '685'),
('6854', '6854', 'DESVALORIZACIÓN DE ACTIVOS BIOLÓGICOS EN PRODUCCIÓN', '1', '685'),
('6861', '6861', 'PROVISIÓN PARA LITIGIOS', '1', '686'),
('6862', '6862', 'PROVISIÓN POR DESMANTELAMIENTO, RETIRO O REHABILITACIÓN DEL INMOVILIZADO', '1', '686'),
('6863', '6863', 'PROVISIÓN PARA REESTRUCTURACIONES', '1', '686'),
('6864', '6864', 'PROVISIÓN PARA PROTECCIÓN Y REMEDIACIÓN DEL MEDIO AMBIENTE', '1', '686'),
('6865', '6865', 'PROVISIÓN PARA GASTOS DE RESPONSABILIDAD SOCIAL', '1', '686'),
('6869', '6869', 'OTRAS PROVISIONES', '1', '686'),
('6911', '6911', 'MERCADERÍAS MANUFACTURADAS', '1', '691'),
('6912', '6912', 'MERCADERÍAS DE EXTRACCIÓN', '1', '691'),
('6913', '6913', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '691'),
('6914', '6914', 'MERCADERÍAS INMUEBLES', '1', '691'),
('6915', '6915', 'OTRAS MERCADERÍAS', '1', '691'),
('6921', '6921', 'PRODUCTOS MANUFACTURADOS', '1', '692'),
('6922', '6922', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '692'),
('6923', '6923', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '692'),
('6924', '6924', 'PRODUCTOS INMUEBLES TERMINADOS', '1', '692'),
('6925', '6925', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '692'),
('6926', '6926', 'COSTOS DE FINANCIACIÓN ? PRODUCTOS TERMINADOS', '1', '692'),
('6931', '6931', 'SUBPRODUCTOS', '1', '693'),
('6932', '6932', 'DESECHOS Y DESPERDICIOS', '1', '693'),
('6941', '6941', 'TERCEROS', '1', '694'),
('6942', '6942', 'RELACIONADAS', '1', '694'),
('7011', '7011', 'MERCADERÍAS MANUFACTURADAS', '1', '701'),
('7012', '7012', 'MERCADERÍAS DE EXTRACCIÓN', '1', '701'),
('7013', '7013', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '701'),
('7014', '7014', 'MERCADERÍAS INMUEBLES', '1', '701'),
('7015', '7015', 'MERCADERÍAS ? OTRAS', '1', '701'),
('7021', '7021', 'PRODUCTOS MANUFACTURADOS', '1', '702'),
('7022', '7022', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '702'),
('7023', '7023', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '702'),
('7024', '7024', 'PRODUCTOS INMUEBLES TERMINADOS', '1', '702'),
('7025', '7025', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '702'),
('7031', '7031', 'SUBPRODUCTOS', '1', '703'),
('7032', '7032', 'DESECHOS Y DESPERDICIOS', '1', '703'),
('7041', '7041', 'TERCEROS', '1', '704'),
('7042', '7042', 'RELACIONADAS', '1', '704'),
('7091', '7091', 'MERCADERÍAS ? TERCEROS', '1', '709'),
('7092', '7092', 'MERCADERÍAS ? RELACIONADAS', '1', '709'),
('7093', '7093', 'PRODUCTOS TERMINADOS ? TERCEROS', '1', '709'),
('7094', '7094', 'PRODUCTOS TERMINADOS ? RELACIONADAS', '1', '709'),
('7095', '7095', 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS ? TERCEROS', '1', '709'),
('7096', '7096', 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS ? RELACIONADAS', '1', '709'),
('7097', '7097', 'PRESTACIÓN DE SERVICIOS', '1', '709'),
('7111', '7111', 'PRODUCTOS MANUFACTURADOS', '1', '711'),
('7112', '7112', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '711'),
('7113', '7113', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '711'),
('7114', '7114', 'PRODUCTOS INMUEBLES TERMINADOS', '1', '711'),
('7115', '7115', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '711'),
('7121', '7121', 'SUBPRODUCTOS', '1', '712'),
('7122', '7122', 'DESECHOS Y DESPERDICIOS', '1', '712'),
('7131', '7131', 'PRODUCTOS EN PROCESO DE MANUFACTURA', '1', '713'),
('7132', '7132', 'PRODUCTOS EXTRAÍDOS EN PROCESO DE TRANSFORMACIÓN', '1', '713'),
('7133', '7133', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS EN PROCESO', '1', '713'),
('7134', '7134', 'PRODUCTOS INMUEBLES EN PROCESO', '1', '713'),
('7135', '7135', 'EXISTENCIAS DE SERVICIOS EN PROCESO', '1', '713'),
('7138', '7138', 'OTROS PRODUCTOS EN PROCESO', '1', '713'),
('7141', '7141', 'ENVASES', '1', '714'),
('7142', '7142', 'EMBALAJES', '1', '714'),
('7211', '7211', 'EDIFICACIONES', '1', '721'),
('7221', '7221', 'EDIFICACIONES', '1', '722'),
('7222', '7222', 'MAQUINARIAS Y OTROS EQUIPOS DE EXPLOTACIÓN', '1', '722'),
('7223', '7223', 'EQUIPO DE TRANSPORTE', '1', '722'),
('7224', '7224', 'MUEBLES Y ENSERES', '1', '722'),
('7225', '7225', 'EQUIPOS DIVERSOS', '1', '722'),
('7226', '7226', 'EQUIPO DE COMUNICACIÓN', '1', '722'),
('7227', '7227', 'EQUIPO DE SEGURIDAD', '1', '722'),
('7228', '7228', 'OTROS EQUIPOS', '1', '722'),
('7231', '7231', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '723'),
('7232', '7232', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '723'),
('7233', '7233', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '723'),
('7241', '7241', 'ACTIVOS BIOLÓGICOS EN DESARROLLO DE ORIGEN ANIMAL', '1', '724'),
('7242', '7242', 'ACTIVOS BIOLÓGICOS EN DESARROLLO DE ORIGEN VEGETAL', '1', '724'),
('7251', '7251', 'COSTOS DE FINANCIACIÓN ? INVERSIONES INMOBILIARIAS', '1', '725'),
('7252', '7252', 'COSTOS DE FINANCIACIÓN ? INMUEBLES, MAQUINARIA Y EQUIPO', '1', '725'),
('7253', '7253', 'COSTOS DE FINANCIACIÓN ? INTANGIBLES', '1', '725'),
('7254', '7254', 'COSTOS DE FINANCIACIÓN ? ACTIVOS BIOLÓGICOS EN DESARROLLO', '1', '725'),
('7311', '7311', 'TERCEROS', '1', '731'),
('7312', '7312', 'RELACIONADAS', '1', '731'),
('7411', '7411', 'TERCEROS', '1', '741'),
('7412', '7412', 'RELACIONADAS', '1', '741'),
('7541', '7541', 'TERRENOS', '1', '754'),
('7542', '7542', 'EDIFICACIONES', '1', '754'),
('7543', '7543', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '754'),
('7544', '7544', 'EQUIPO DE TRANSPORTE', '1', '754'),
('7545', '7545', 'EQUIPOS DIVERSOS', '1', '754'),
('7551', '7551', 'RECUPERACIÓN - CUENTAS DE COBRANZA DUDOSA', '1', '755'),
('7552', '7552', 'RECUPERACIÓN - DESVALORIZACIÓN DE EXISTENCIAS', '1', '755'),
('7553', '7553', 'RECUPERACIÓN ? DESVALORIZACIÓN DE INVERSIONES MOBILIARIAS', '1', '755'),
('7561', '7561', 'INVERSIONES INMOBILIARIAS', '1', '756'),
('7562', '7562', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '756'),
('7563', '7563', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '756'),
('7564', '7564', 'INTANGIBLES', '1', '756'),
('7565', '7565', 'ACTIVOS BIOLÓGICOS', '1', '756'),
('7591', '7591', 'SUBSIDIOS GUBERNAMENTALES', '1', '759'),
('7611', '7611', 'MERCADERÍAS', '1', '761'),
('7612', '7612', 'PRODUCTOS EN PROCESO', '1', '761'),
('7613', '7613', 'ACTIVOS NO CORRIENTES MANTENIDOS PARA LA VENTA', '1', '761'),
('7621', '7621', 'INVERSIONES INMOBILIARIAS', '1', '762'),
('7622', '7622', 'ACTIVOS BIOLÓGICOS', '1', '762'),
('7721', '7721', 'DEPÓSITOS EN INSTITUCIONES FINANCIERAS', '1', '772'),
('7722', '7722', 'CUENTAS POR COBRAR COMERCIALES', '1', '772'),
('7723', '7723', 'PRÉSTAMOS OTORGADOS', '1', '772'),
('7724', '7724', 'INVERSIONES A SER MANTENIDAS HASTA EL VENCIMIENTO', '1', '772'),
('7725', '7725', 'INSTRUMENTOS FINANCIEROS REPRESENTATIVOS DE DERECHO PATRIMONIAL', '1', '772'),
('7792', '7792', 'INGRESOS FINANCIEROS EN MEDICIÓN A VALOR DESCONTADO', '1', '779');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_div_nivel`
--

CREATE TABLE IF NOT EXISTS `cont_div_nivel` (
  `id_div_nivel` varchar(22) NOT NULL,
  `nivel` varchar(14) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_sub_nivel` varchar(22) NOT NULL,
  PRIMARY KEY (`id_div_nivel`),
  KEY `cont_sub_nivel_cont_div_nivel_fk` (`id_sub_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_div_nivel`
--

INSERT INTO `cont_div_nivel` (`id_div_nivel`, `nivel`, `descripcion`, `estado`, `id_sub_nivel`) VALUES
('101', '101', 'Consejo Directivo', '1', '10'),
('102', '102', 'Administración', '1', '10'),
('103', '103', 'Inicial', '1', '10'),
('104', '104', 'Primaria', '1', '10'),
('105', '105', 'Secundaria', '1', '10'),
('106', '106', 'Servicios', '1', '10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_elemento`
--

CREATE TABLE IF NOT EXISTS `cont_elemento` (
  `id_elemento` varchar(22) NOT NULL,
  `cuenta` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_elemento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_elemento`
--

INSERT INTO `cont_elemento` (`id_elemento`, `cuenta`, `descripcion`, `estado`) VALUES
('0', '0', 'CUENTAS DE ORDEN', '1'),
('1', '1', 'ACTIVO DISPONIBLE Y EXIGIBLE', '1'),
('2', '2', 'ACTIVO REALIZABLE', '1'),
('3', '3', 'ACTIVO INMOVILIZADO', '1'),
('4', '4', 'PASIVO', '1'),
('5', '5', 'PATRIMONIO NETO', '1'),
('6', '6', 'GASTOS POR NATURALEZA', '1'),
('7', '7', 'INGRESOS POR NATURALEZA', '1'),
('8', '8', 'SALDOS INTERMEDIARIOS DE GESTION Y DETERMINACION DE RESULTADOS DEL EJERCICIO', '1'),
('9', '9', 'COSTOS DE PRODUCCION Y GASTOS POR FUNCION', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_general_diario`
--

CREATE TABLE IF NOT EXISTS `cont_general_diario` (
  `id_mov_gendiario` varchar(22) NOT NULL,
  `titulo_asiento` varchar(60) NOT NULL,
  `lote` varchar(30) NOT NULL,
  `user_registro` varchar(22) NOT NULL,
  `user_edit` varchar(22) NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT '--0 Abierto ---1 Cerrado',
  `fecha_reg` date NOT NULL,
  `fecha_edit` date NOT NULL,
  PRIMARY KEY (`id_mov_gendiario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_general_diario`
--

INSERT INTO `cont_general_diario` (`id_mov_gendiario`, `titulo_asiento`, `lote`, `user_registro`, `user_edit`, `estado`, `fecha_reg`, `fecha_edit`) VALUES
('2013120500000001', 'Correcto', '1', '20041056400001', 'X', '1', '2013-12-05', '0002-11-30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_libro_diario`
--

CREATE TABLE IF NOT EXISTS `cont_libro_diario` (
  `id_mov_diario` varchar(44) NOT NULL,
  `hora` time NOT NULL,
  `dia` varchar(2) NOT NULL,
  `mes` varchar(12) NOT NULL,
  `glosa_oper` varchar(100) NOT NULL,
  `cuenta` varchar(16) NOT NULL,
  `nivel` varchar(22) NOT NULL,
  `importe` double NOT NULL,
  `tipo_moneda` varchar(10) NOT NULL,
  `debe` double NOT NULL,
  `haber` double NOT NULL,
  `tipo` varchar(6) DEFAULT NULL COMMENT '--debito ---credito',
  `fecha_oper` date NOT NULL,
  `user_registro` varchar(22) NOT NULL,
  `user_edit` varchar(22) NOT NULL,
  `fecha_edit` date NOT NULL,
  `estado` varchar(2) DEFAULT NULL COMMENT '--1 Activo --0 Desactivo',
  `id_mov_gendiario` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_diario`),
  KEY `cont_general_diario_cont_libro_diario_fk` (`id_mov_gendiario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_libro_diario`
--

INSERT INTO `cont_libro_diario` (`id_mov_diario`, `hora`, `dia`, `mes`, `glosa_oper`, `cuenta`, `nivel`, `importe`, `tipo_moneda`, `debe`, `haber`, `tipo`, `fecha_oper`, `user_registro`, `user_edit`, `fecha_edit`, `estado`, `id_mov_gendiario`) VALUES
('2013120500000001', '00:00:00', '4', '11', 'RUC:20138122256DOC:066-0000088/compras', '42121', '102', 600, 'S', 0, 0, 'debe', '2013-12-05', '20041056400001', 'X', '0002-11-30', '0', '2013120500000001'),
('2013120500000002', '00:00:00', '4', '11', 'RUC:20138122256DOC:066-0000088/compras', '42121', '102', 0, 'S', 0, 0, 'debe', '2013-12-05', '20041056400001', 'X', '0002-11-30', '0', '2013120500000001'),
('2013120500000003', '00:00:00', '4', '11', 'RUC:20138122256DOC:066-0000088/compras', '42121', '102', 600, 'S', 0, 0, 'debe', '2013-12-05', '20041056400001', 'X', '0002-11-30', '0', '2013120500000001'),
('2013120500000004', '00:00:00', '4', '11', 'Por la salida del dinero del voucher:002', '10111', '102', 1200, 'S', 0, 0, 'haber', '2013-12-05', '20041056400001', 'X', '0002-11-30', '0', '2013120500000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_nivel`
--

CREATE TABLE IF NOT EXISTS `cont_nivel` (
  `id_nivel` varchar(22) NOT NULL,
  `nivel` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_nivel`
--

INSERT INTO `cont_nivel` (`id_nivel`, `nivel`, `descripcion`, `estado`) VALUES
('1', '1', 'Colegio Adventista Tupac Amaru', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_subdiv_cuenta`
--

CREATE TABLE IF NOT EXISTS `cont_subdiv_cuenta` (
  `id_subdiv_cuenta` varchar(22) NOT NULL,
  `cuenta` varchar(14) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_division` varchar(22) NOT NULL,
  PRIMARY KEY (`id_subdiv_cuenta`),
  KEY `cont_division_cont_subdiv_cuenta_fk` (`id_division`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_subdiv_cuenta`
--

INSERT INTO `cont_subdiv_cuenta` (`id_subdiv_cuenta`, `cuenta`, `descripcion`, `estado`, `id_division`) VALUES
('10111', '10111', 'EFECTIVO EN CAJA', '0', '1011'),
('10211', '10211', 'FONDOS FIJOS DE CAJA', '1', '1021'),
('10411', '10411', 'CMA - XXXXXXXX', '0', '1041'),
('10421', '10421', 'BCP - XXXXXXXX', '1', '1042'),
('11111', '11111', 'COSTO DE VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '1111'),
('11112', '11112', 'VALOR RAZONABLE DE VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '1111'),
('11121', '11121', 'COSTO DE VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '1112'),
('11122', '11122', 'VALOR RAZONABLE DE VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '1112'),
('11131', '11131', 'COSTO DE VALORES EMITIDOS POR EMPRESAS', '1', '1113'),
('11132', '11132', 'VALOR RAZONABLE DE VALORES EMITIDOS POR EMPRESAS', '1', '1113'),
('11141', '11141', 'COSTO DE OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '1114'),
('11142', '11142', 'VALOR RAZONABLE DE OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '1114'),
('11151', '11151', 'COSTO DE PARTICIPACIONES EN ENTIDADES', '1', '1115'),
('11152', '11152', 'VALOR RAZONABLE DE PARTICIPACIONES EN ENTIDADES', '1', '1115'),
('11211', '11211', 'COSTO DE VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '1121'),
('11212', '11212', 'VALOR RAZONABLE DE VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '1121'),
('11221', '11221', 'COSTO DE VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '1122'),
('11222', '11222', 'VALOR RAZONABLE DE VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '1122'),
('11231', '11231', 'COSTO DE VALORES EMITIDOS POR EMPRESAS', '1', '1123'),
('11232', '11232', 'VALOR RAZONABLE DE VALORES EMITIDOS POR EMPRESAS', '1', '1123'),
('11241', '11241', 'COSTO DE OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '1124'),
('11242', '11242', 'VALOR RAZONABLE DE OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '1124'),
('11311', '11311', 'COSTO DE INVERSIONES MANTENIDAS PARA NEGOCIACION - ACUERDO DE COMPRA', '1', '1131'),
('11312', '11312', 'VALOR RAZONABLE DE INVERSIONES MANTENIDAS PARA NEGOCIACION - ACUERDO DE COMPRA', '1', '1131'),
('11321', '11321', 'COSTO DE INVERSIONES DISPONIBLES PARA LA VENTA - ACUERDO DE COMPRA', '1', '1132'),
('11322', '11322', 'VALOR RAZONABLE DE INVERSIONES DISPONIBLES PARA LA VENTA - ACUERDO DE COMPRA', '1', '1132'),
('12121', '12121', 'CLIENTES DE COMPROBANTES EMITIDOS', '1', '1212'),
('13111', '13111', 'MATRIZ DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR NO EMITIDAS', '1', '1311'),
('13112', '13112', 'SUBSIDIARIAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR NO EMITIDAS', '1', '1311'),
('13113', '13113', 'ASOCIADAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR NO EMITIDAS', '1', '1311'),
('13114', '13114', 'SUCURSALES DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR NO EMITIDAS', '1', '1311'),
('13115', '13115', 'OTROS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR NO EMITIDAS', '1', '1311'),
('13121', '13121', 'MATRIZ DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EMITIDAS EN CARTERA', '1', '1312'),
('13122', '13122', 'SUBSIDIARIAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EMITIDAS EN CARTERA', '1', '1312'),
('13123', '13123', 'ASOCIADAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EMITIDAS EN CARTERA', '1', '1312'),
('13124', '13124', 'SUCURSALES DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EMITIDAS EN CARTERA', '1', '1312'),
('13131', '13131', 'MATRIZ DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN COBRANZA', '1', '1313'),
('13132', '13132', 'SUBSIDIARIAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN COBRANZA', '1', '1313'),
('13133', '13133', 'ASOCIADAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN COBRANZA', '1', '1313'),
('13134', '13134', 'SUCURSALES DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN COBRANZA', '1', '1313'),
('13135', '13135', 'OTROS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN COBRANZA', '1', '1313'),
('13141', '13141', 'MATRIZ DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN DESCUENTO', '1', '1314'),
('13142', '13142', 'SUBSIDIARIAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN DESCUENTO', '1', '1314'),
('13143', '13143', 'ASOCIADAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN DESCUENTO', '1', '1314'),
('13144', '13144', 'SUCURSALES DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN DESCUENTO', '1', '1314'),
('13145', '13145', 'OTROS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR EN DESCUENTO', '1', '1314'),
('13211', '13211', 'MATRIZ DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR DE ANTICIPOS RECIBIDOS', '1', '1321'),
('13212', '13212', 'SUBSIDIARIAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR DE ANTICIPOS RECIBIDOS', '1', '1321'),
('13213', '13213', 'ASOCIADAS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR DE ANTICIPOS RECIBIDOS', '1', '1321'),
('13214', '13214', 'SUCURSALES DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR DE ANTICIPOS RECIBIDOS', '1', '1321'),
('13215', '13215', 'OTROS DE FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR DE ANTICIPOS RECIBIDOS', '1', '1321'),
('13311', '13311', 'MATRIZ DE LETRAS POR COBRAR EN CARTERA', '1', '1331'),
('13312', '13312', 'SUBSIDIARIAS DE LETRAS POR COBRAR EN CARTERA', '1', '1331'),
('13313', '13313', 'ASOCIADAS DE LETRAS POR COBRAR EN CARTERA', '1', '1331'),
('13314', '13314', 'SUCURSALES DE LETRAS POR COBRAR EN CARTERA', '1', '1331'),
('13315', '13315', 'OTROS DE LETRAS POR COBRAR EN CARTERA', '1', '1331'),
('13321', '13321', 'MATRIZ DE LETRAS POR COBRAR EN COBRANZA', '1', '1332'),
('13322', '13322', 'SUBSIDIARIAS DE LETRAS POR COBRAR EN COBRANZA', '1', '1332'),
('13323', '13323', 'ASOCIADAS DE LETRAS POR COBRAR EN COBRANZA', '1', '1332'),
('13324', '13324', 'SUCURSALES DE LETRAS POR COBRAR EN COBRANZA', '1', '1332'),
('13325', '13325', 'OTROS DE LETRAS POR COBRAR EN COBRANZA', '1', '1332'),
('13331', '13331', 'MATRIZ DE LETRAS POR COBRAR EN DESCUENTO', '1', '1333'),
('13332', '13332', 'SUBSIDIARIAS DE LETRAS POR COBRAR EN DESCUENTO', '1', '1333'),
('13333', '13333', 'ASOCIADAS DE LETRAS POR COBRAR EN DESCUENTO', '1', '1333'),
('13334', '13334', 'SUCURSALES DE LETRAS POR COBRAR EN DESCUENTO', '1', '1333'),
('13335', '13335', 'OTROS DE LETRAS POR COBRAR EN DESCUENTO', '1', '1333'),
('14111', '14111', 'PRÉSTAMOS', '1', '1411'),
('14121', '14121', 'ADELANTO DE REMUNERACIONES', '1', '1412'),
('14131', '14131', 'ENTREGAS A RENDIR CUENTA', '1', '1413'),
('14191', '14191', 'OTRAS CUENTAS POR COBRAR AL PERSONAL', '1', '1419'),
('14211', '14211', 'SUSCRIPCIONES POR COBRAR A SOCIOS O ACCIONISTAS', '1', '1421'),
('14221', '14221', 'PRÉSTAMOS', '1', '1422'),
('16621', '16621', 'CARTERA DE NEGOCIACIÓN', '1', '1662'),
('16622', '16622', 'INSTRUMENTOS DE COBERTURA', '1', '1662'),
('17111', '17111', 'MATRIZ', '1', '1711'),
('17112', '17112', 'SUBSIDIARIAS', '1', '1711'),
('17113', '17113', 'ASOCIADAS', '1', '1711'),
('17114', '17114', 'SUCURSALES', '1', '1711'),
('17115', '17115', 'OTROS', '1', '1711'),
('17121', '17121', 'MATRIZ', '1', '1712'),
('17122', '17122', 'SUBSIDIARIAS', '1', '1712'),
('17123', '17123', 'ASOCIADAS', '1', '1712'),
('17124', '17124', 'SUCURSALES', '1', '1712'),
('17125', '17125', 'OTROS', '1', '1712'),
('17311', '17311', 'MATRIZ', '1', '1731'),
('17312', '17312', 'SUBSIDIARIAS', '1', '1731'),
('17313', '17313', 'ASOCIADAS', '1', '1731'),
('17314', '17314', 'SUCURSALES', '1', '1731'),
('17315', '17315', 'OTROS', '1', '1731'),
('17321', '17321', 'MATRIZ', '1', '1732'),
('17322', '17322', 'SUBSIDIARIAS', '1', '1732'),
('17323', '17323', 'ASOCIADAS', '1', '1732'),
('17324', '17324', 'SUCURSALES', '1', '1732'),
('17325', '17325', 'OTROS', '1', '1732'),
('17331', '17331', 'MATRIZ', '1', '1733'),
('17332', '17332', 'SUBSIDIARIAS', '1', '1733'),
('17333', '17333', 'ASOCIADAS', '1', '1733'),
('17334', '17334', 'OTROS', '1', '1733'),
('20111', '20111', 'COSTO DE MERCADERÍAS MANUFACTURADAS', '1', '2011'),
('20112', '20112', 'VALOR RAZONABLE DE MERCADERÍAS MANUFACTURADAS', '1', '2011'),
('21311', '21311', 'COSTO DE PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS DE ORIGEN ANIMAL', '1', '2131'),
('21312', '21312', 'VALOR RAZONABLE DE PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS DE ORIGEN ANIMAL', '1', '2131'),
('21321', '21321', 'COSTO DE PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS DE ORIGEN VEGETAL', '1', '2132'),
('21322', '21322', 'VALOR RAZONABLE DE PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS DE ORIGEN VEGETAL', '1', '2132'),
('23311', '23311', 'COSTO', '1', '2331'),
('23312', '23312', 'VALOR RAZONABLE', '1', '2331'),
('23321', '23321', 'COSTO', '1', '2332'),
('23322', '23322', 'VALOR RAZONABLE', '1', '2332'),
('27111', '27111', 'VOLOR RAZONABLE', '1', '2711'),
('27112', '27112', 'COSTO', '1', '2711'),
('27113', '27113', 'REVALUACIÓN', '1', '2711'),
('27121', '27121', 'VALOR RAZONABLE', '1', '2712'),
('27122', '27122', 'COSTO', '1', '2712'),
('27123', '27123', 'REVALUACIÓN', '1', '2712'),
('27124', '27124', 'COSTO DE FINANCIACION', '1', '2712'),
('27211', '27211', 'VALOR RAZONABLE', '1', '2721'),
('27212', '27212', 'COSTO', '1', '2721'),
('27213', '27213', 'REVALUACIÓN', '1', '2721'),
('27221', '27221', 'COSTO DE ADQUISICION O CONSTRUCCION', '1', '2722'),
('27222', '27222', 'REVALUACIÓN', '1', '2722'),
('27223', '27223', 'COSTO DE FINANCIACION', '1', '2722'),
('27231', '27231', 'COSTO DE ADQUISICION O CONSTRUCCION', '1', '2723'),
('27232', '27232', 'REVALUACIÓN', '1', '2723'),
('27233', '27233', 'COSTO DE FINANCIACION', '1', '2723'),
('27241', '27241', 'COSTO', '1', '2724'),
('27242', '27242', 'REVALUACIÓN', '1', '2724'),
('27251', '27251', 'COSTO', '1', '2725'),
('27252', '27252', 'REVALUACIÓN', '1', '2725'),
('27261', '27261', 'COSTO', '1', '2726'),
('27262', '27262', 'REVALUACIÓN', '1', '2726'),
('27271', '27271', 'COSTO', '1', '2727'),
('27272', '27272', 'REVALUACIÓN', '1', '2727'),
('27311', '27311', 'COSTO', '1', '2731'),
('27312', '27312', 'REVALUACIÓN', '1', '2731'),
('27321', '27321', 'COSTO', '1', '2732'),
('27322', '27322', 'REVALUACIÓN', '1', '2732'),
('27331', '27331', 'COSTO', '1', '2733'),
('27332', '27332', 'REVALUACIÓN', '1', '2733'),
('27341', '27341', 'COSTO', '1', '2734'),
('27342', '27342', 'REVALUACIÓN', '1', '2734'),
('27351', '27351', 'COSTO', '1', '2735'),
('27352', '27352', 'REVALUACIÓN', '1', '2735'),
('27361', '27361', 'COSTO', '1', '2736'),
('27362', '27362', 'REVALUACIÓN', '1', '2736'),
('27391', '27391', 'COSTO', '1', '2739'),
('27392', '27392', 'REVALUACIÓN', '1', '2739'),
('27411', '27411', 'VALOR RAZONABLE', '1', '2741'),
('27412', '27412', 'COSTO', '1', '2741'),
('27413', '27413', 'COSTO DE FINANCIACION', '1', '2741'),
('27421', '27421', 'VALOR RAZONABLE', '1', '2742'),
('27422', '27422', 'COSTO', '1', '2742'),
('27423', '27423', 'COSTO DE FINANCIACION', '1', '2742'),
('27521', '27521', 'VALOR RAZONABLE', '1', '2752'),
('27522', '27522', 'COSTO', '1', '2752'),
('27523', '27523', 'REVALUACIÓN', '1', '2752'),
('27621', '27621', 'COSTO DE ADQUISICION O CONSTRUCCION', '1', '2762'),
('27622', '27622', 'REVALUACIÓN', '1', '2762'),
('27623', '27623', 'COSTO DE FINANCIACION', '1', '2762'),
('27631', '27631', 'COSTO DE ADQUISICION O CONSTRUCCION', '1', '2763'),
('27632', '27632', 'REVALUACIÓN', '1', '2763'),
('27633', '27633', 'COSTO DE FINANCIACION', '1', '2763'),
('27641', '27641', 'COSTO ', '1', '2764'),
('27642', '27642', 'REVALUACIÓN', '1', '2764'),
('27651', '27651', 'COSTO ', '1', '2765'),
('27652', '27652', 'REVALUACIÓN', '1', '2765'),
('27661', '27661', 'COSTO ', '1', '2766'),
('27662', '27662', 'REVALUACIÓN', '1', '2766'),
('27671', '27671', 'COSTO ', '1', '2767'),
('27672', '27672', 'REVALUACIÓN', '1', '2767'),
('27711', '27711', 'COSTO ', '1', '2771'),
('27712', '27712', 'REVALUACIÓN', '1', '2771'),
('27721', '27721', 'COSTO ', '1', '2772'),
('27722', '27722', 'REVALUACIÓN', '1', '2772'),
('27741', '27741', 'COSTO ', '1', '2774'),
('27742', '27742', 'REVALUACIÓN', '1', '2774'),
('27751', '27751', 'COSTO ', '1', '2775'),
('27752', '27752', 'REVALUACIÓN', '1', '2775'),
('27761', '27761', 'COSTO ', '1', '2776'),
('27791', '27791', 'COSTO ', '1', '2779'),
('27792', '27792', 'REVALUACIÓN', '1', '2779'),
('27812', '27812', 'COSTO ', '1', '2781'),
('27822', '27822', 'COSTO ', '1', '2782'),
('27911', '27911', 'TERRENOS', '1', '2791'),
('27912', '27912', 'EDIFICACIONES ', '1', '2791'),
('27931', '27931', 'TERRENOS', '1', '2793'),
('27932', '27932', 'EDIFICACIONES', '1', '2793'),
('27933', '27933', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '2793'),
('27934', '27934', 'EQUIPOS DE TRANSPORTE', '1', '2793'),
('27935', '27935', 'MUEBLES Y ENSERES', '1', '2793'),
('27936', '27936', 'EQUIPOS DIVERSOS ', '1', '2793'),
('27937', '27937', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '2793'),
('27941', '27941', 'CONCESIONES, LICENCIAS Y DERECHOS', '1', '2794'),
('27942', '27942', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '2794'),
('27943', '27943', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '2794'),
('27944', '27944', 'COSTO DE EXPLORACION Y DESARROLLO', '1', '2794'),
('27945', '27945', 'FORMULAS DISEÑOS Y PROTOTIPOS', '1', '2794'),
('27946', '27946', 'RESERVAS DE RECURSOS EXTRAIBLES ', '1', '2794'),
('27951', '27951', 'ACTIVOS BIOLOGICOS EN PRODUCCION ', '1', '2795'),
('27952', '27952', 'ACTIVOS BIOLOGICOS ES DESARROLLO', '1', '2795'),
('30111', '30111', 'VALORES EMITIDOS O GARANTIZADOS POR EL ESTADO', '1', '3011'),
('30112', '30112', 'VALORES EMITIDOS POR EL SISTEMA FINANCIERO', '1', '3011'),
('30113', '30113', 'VALORES EMITIDOS POR LAS EMPRESAS', '1', '3011'),
('30114', '30114', 'OTROS TÍTULOS REPRESENTATIVOS DE DEUDA', '1', '3011'),
('30221', '30221', 'COSTO', '1', '3022'),
('30222', '30222', 'VALOR RAZONABLE', '1', '3022'),
('30223', '30223', 'PARTICIPACION PATRIMONIAL', '1', '3022'),
('30231', '30231', 'COSTO', '1', '3023'),
('30232', '30232', 'VALOR RAZONABLE', '1', '3023'),
('30233', '30233', 'PARTICIPACION PATRIMONIAL', '1', '3023'),
('30241', '30241', 'COSTO', '1', '3024'),
('30242', '30242', 'VALOR RAZONABLE', '1', '3024'),
('30243', '30243', 'PARTICIPACION PATRIMONIAL', '1', '3024'),
('30251', '30251', 'COSTO ', '1', '3025'),
('30261', '30261', 'COSTO ', '1', '3026'),
('30262', '30262', 'VALOR RAZONABLE', '1', '3026'),
('30271', '30271', 'COSTO', '1', '3027'),
('30272', '30272', 'VALOR RAZONABLE', '1', '3027'),
('30273', '30273', 'PARTICIPACION PATRIMONIAL', '1', '3027'),
('30281', '30281', 'COSTO ', '1', '3028'),
('30282', '30282', 'VALOR RAZONABLE', '1', '3028'),
('31111', '31111', 'VALOR RAZONABLE', '1', '3111'),
('31112', '31112', 'COSTO', '1', '3111'),
('31113', '31113', 'REVALUACIÓN', '1', '3111'),
('31121', '31121', 'VALOR RAZONABLE', '1', '3112'),
('31122', '31122', 'COSTO', '1', '3112'),
('31123', '31123', 'REVALUACIÓN', '1', '3112'),
('31211', '31211', 'VALOR RAZONABLE', '1', '3121'),
('31212', '31212', 'COSTO', '1', '3121'),
('31213', '31213', 'REVALUACIÓN', '1', '3121'),
('31214', '31214', 'COSTOS DE FINANCIACIÓN ? INVERSIONES INMOBILIARIAS', '1', '3121'),
('33111', '33111', 'COSTO DE TERRENOS', '1', '3311'),
('33112', '33112', 'REVALUACIÓN DE TERRENOS', '1', '3311'),
('33211', '33211', 'COSTO DE ADQUISICIÓN O CONSTRUCCION DE EDIFICACIONES ADMINISTRATIVAS', '1', '3321'),
('33212', '33212', 'REVALUACIÓN DE EDIFICACIONES ADMINISTRATIVAS', '1', '3321'),
('33213', '33213', 'COSTO DE FINANCIACIÓN - EDIFICACIONES DE EDIFICACIONES ADMINISTRATIVAS', '1', '3321'),
('33221', '33221', 'COSTO DE ADQUISICIÓN O CONSTRUCCION DE ALMACENES', '1', '3322'),
('33222', '33222', 'REVALUACIÓN DE ALMACENES', '1', '3322'),
('33223', '33223', 'COSTO DE FINANCIACIÓN - ALMACENES', '1', '3322'),
('33231', '33231', 'COSTO DE ADQUISICIÓN O CONTRUCCION DE EDIFICACIONES PARA PRODUCCIÓN', '1', '3323'),
('33232', '33232', 'REVALUACIÓN DE EDIFICACIONES PARA PRODUCCIÓN', '1', '3323'),
('33233', '33233', 'COSTO DE FINANCIACIÓN ? EDIFICACIONES PARA PRODUCCIÓN', '1', '3323'),
('33241', '33241', 'COSTO DE ADQUISICIÓN O CONTRUCCION DE INSTALACIONES', '1', '3324'),
('33242', '33242', 'REVALUACIÓN DE INSTALACIONES', '1', '3324'),
('33243', '33243', 'COSTO DE FINANCIACIÓN ? INSTALACIONES', '1', '3324'),
('33311', '33311', 'COSTO DE ADQUISICIÓN O CONSTRUCCION DE MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '3331'),
('33312', '33312', 'REVALUACIÓN DE MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '3331'),
('33313', '33313', 'COSTO DE FINANCIACIÓN ? MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '3331'),
('33411', '33411', 'COSTO DE VEHÍCULOS MOTORIZADOS', '1', '3341'),
('33412', '33412', 'REVALUACIÓN DE VEHÍCULOS MOTORIZADOS', '1', '3341'),
('33421', '33421', 'COSTO DE VEHÍCULOS NO MOTORIZADOS', '1', '3342'),
('33422', '33422', 'REVALUACIÓN DE VEHÍCULOS NO MOTORIZADOS', '1', '3342'),
('33511', '33511', 'COSTO DE MUEBLES', '1', '3351'),
('33512', '33512', 'REVALUACIÓN DE MUEBLES', '1', '3351'),
('33521', '33521', 'COSTO DE ENSERES', '1', '3352'),
('33522', '33522', 'REVALUACIÓN DE ENSERES', '1', '3352'),
('33611', '33611', 'COSTO DE EQUIPO PARA PROCESAMIENTO DE INFORMACIÓN (DE CÓMPUTO)', '1', '3361'),
('33612', '33612', 'REVALUACIÓN DE EQUIPO PARA PROCESAMIENTO DE INFORMACIÓN (DE CÓMPUTO)', '1', '3361'),
('33621', '33621', 'COSTO DE EQUIPOS DE COMUNICACIÓN', '1', '3362'),
('33622', '33622', 'REVALUACIÓN DE EQUIPOS DE COMUNICACIÓN', '1', '3362'),
('33631', '33631', 'COSTO DE EQUIPOS DE SEGURIDAD', '1', '3363'),
('33632', '33632', 'REVALUACIÓN DE EQUIPOS DE SEGURIDAD', '1', '3363'),
('33691', '33691', 'COSTO DE OTROS EQUIPOS', '1', '3369'),
('33692', '33692', 'REVALUACIÓN DE OTROS EQUIPOS', '1', '3369'),
('33711', '33711', 'COSTO DE HERRAMIENTAS', '1', '3371'),
('33712', '33712', 'REVALUACIÓN DE HERRAMIENTAS', '1', '3371'),
('33721', '33721', 'COSTO DE UNIDADES DE REEMPLAZO', '1', '3372'),
('33722', '33722', 'REVALUACIÓN DE UNIDADES DE REEMPLAZO', '1', '3372'),
('33971', '33971', 'COSTO DE FINANCIACIÓN - EDIFICACIONES', '1', '3397'),
('33981', '33981', 'COSTO DE FINANCIACIÓN ? EDIFICACIONES', '1', '3398'),
('33982', '33982', 'COSTO DE FINANCIACIÓN ? MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '3398'),
('34111', '34111', 'COSTO', '1', '3411'),
('34112', '34112', 'REVALUACIÓN', '1', '3411'),
('34121', '34121', 'COSTO', '1', '3412'),
('34122', '34122', 'REVALUACIÓN', '1', '3412'),
('34191', '34191', 'COSTO', '1', '3419'),
('34192', '34192', 'REVALUACIÓN', '1', '3419'),
('34211', '34211', 'COSTO', '1', '3421'),
('34212', '34212', 'REVALUACIÓN', '1', '3421'),
('34221', '34221', 'COSTO', '1', '3422'),
('34222', '34222', 'REVALUACIÓN', '1', '3422'),
('34311', '34311', 'COSTO', '1', '3431'),
('34312', '34312', 'REVALUACIÓN', '1', '3431'),
('34411', '34411', 'COSTO', '1', '3441'),
('34412', '34412', 'REVALUACION', '1', '3441'),
('34413', '34413', 'COSTO DE FINANCIACION', '1', '3441'),
('34421', '34421', 'COSTO', '1', '3442'),
('34422', '34422', 'REVALUACIÓN', '1', '3442'),
('34423', '34423', 'COSTO DE FINANCIACION', '1', '3442'),
('34511', '34511', 'COSTO', '1', '3451'),
('34512', '34512', 'REVALUACIÓN', '1', '3451'),
('34521', '34521', 'COSTO', '1', '3452'),
('34522', '34522', 'REVALUACIÓN', '1', '3452'),
('34611', '34611', 'COSTO ', '1', '3461'),
('34612', '34612', 'REVALUACION', '1', '3461'),
('34621', '34621', 'COSTO ', '1', '3462'),
('34622', '34622', 'REVALUACION', '1', '3462'),
('34631', '34631', 'COSTO ', '1', '3463'),
('34632', '34632', 'REVALUACION', '1', '3463'),
('34691', '34691', 'COSTO ', '1', '3469'),
('34692', '34692', 'REVALUACION', '1', '3469'),
('34911', '34911', 'COSTO ', '1', '3491'),
('34912', '34912', 'REVALUACION', '1', '3491'),
('35111', '35111', 'VALOR RAZONABLE', '1', '3511'),
('35112', '35112', 'COSTO', '1', '3511'),
('35113', '35113', 'COSTO DE FINANCIACION', '1', '3511'),
('35121', '35121', 'VALOR RAZONABLE', '1', '3512'),
('35122', '35122', 'COSTO', '1', '3512'),
('35123', '35123', 'COSTO DE FINANCIACION', '1', '3512'),
('35211', '35211', 'VALOR RAZONABLE', '1', '3521'),
('35212', '35212', 'COSTO', '1', '3521'),
('35213', '35213', 'COSTO DE FINANCIACIÓN ', '1', '3521'),
('35221', '35221', 'VALOR RAZONABLE', '1', '3522'),
('35222', '35222', 'COSTO', '1', '3522'),
('35223', '35223', 'COSTO DE FINANCIACIÓN ', '1', '3522'),
('36121', '36121', 'EDIFICACIONES - COSTO DE DE ADQUISICION O CONSTRUCCIÓN', '1', '3612'),
('36122', '36122', 'EDIFICACIONES - COSTO DE FINANCIACIÓN', '1', '3612'),
('36321', '36321', 'EDIFICACIONES - COSTO DE ADQUISICION O CONSTRUCCIÓN', '1', '3632'),
('36322', '36322', 'EDIFICACIONES - COSTO DE FINANCIACIÓN', '1', '3632'),
('36331', '36331', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN - COSTO DE ADQUISICION O CONSTRUCCIÓN', '1', '3633'),
('36332', '36332', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN - COSTO DE FINANCIACIÓN', '1', '3633'),
('36441', '36441', 'COSTO ', '1', '3644'),
('36442', '36442', 'COSTO DE FINANCIACION', '1', '3644'),
('36521', '36521', 'COSTO', '1', '3652'),
('36522', '36522', 'COSTO DE FINANCIACIÓN', '1', '3652'),
('39111', '39111', 'DEPRECIACIÓN ACUMULADA DE EDIFICACIONES - COSTO DE ADQUISICIÓN O CONSTRUCCIÓN', '1', '3911'),
('39112', '39112', 'DEPRECIACIÓN ACUMULADA DE EDIFICACIONES - REVALUACIÓN', '1', '3911'),
('39113', '39113', 'DEPRECIACIÓN ACUMULADA DE EDIFICACIONES - COSTO DE FINANCIACIÓN', '1', '3911'),
('39121', '39121', 'DEPRECIACIÓN ACUMULADA DE INVERSIONES INMOBILIARIAS - EDIFICACIONES DE ACTIVOS ADQUIRIDOS EN ARRENDA', '1', '3912'),
('39122', '39122', 'DEPRECIACIÓN ACUMULADA DE INMUEBLES, MAQUINARIA Y EQUIPO - EDIFICACIONES DE ACTIVOS ADQUIRIDOS EN AR', '1', '3912'),
('39123', '39123', 'DEPRECIACIÓN ACUMULADA DE INMUEBLES, MAQUINARIA Y EQUIPO - MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN DE A', '1', '3912'),
('39124', '39124', 'DEPRECIACIÓN ACUMULADA DE INMUEBLES, MAQUINARIA Y EQUIPO - EQUIPOS DE TRANSPORTE DE ACTIVOS ADQUIRID', '1', '3912'),
('39126', '39126', 'DEPRECIACIÓN ACUMULADA DE INMUEBLES, MAQUINARIA Y EQUIPO - EQUIPOS DIVERSOS DE ACTIVOS ADQUIRIDOS EN', '1', '3912'),
('39131', '39131', 'COSTO DE EDIFICACIONES', '1', '3913'),
('39132', '39132', 'COSTO DE MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '3913'),
('39133', '39133', 'COSTO DE EQUIPO DE TRANSPORTE', '1', '3913'),
('39134', '39134', 'COSTO DE MUEBLES Y ENSERES', '1', '3913'),
('39135', '39135', 'COSTO DE EQUIPOS DIVERSOS', '1', '3913'),
('39136', '39136', 'COSTO DE HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '3913'),
('39141', '39141', 'DEPRECIACIÓN ACUMULADA DE EDIFICACIONES DE REVALUACIÓN', '1', '3914'),
('39142', '39142', 'DEPRECIACIÓN ACUMULADA DE MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN DE REVALUACIÓN', '1', '3914'),
('39143', '39143', 'DEPRECIACIÓN ACUMULADA DE EQUIPO DE TRANSPORTE DE REVALUACIÓN', '1', '3914'),
('39144', '39144', 'DEPRECIACIÓN ACUMULADA DE MUEBLES Y ENSERES DE REVALUACIÓN', '1', '3914'),
('39145', '39145', 'DEPRECIACIÓN ACUMULADA DE EQUIPOS DIVERSOS DE REVALUACIÓN', '1', '3914'),
('39146', '39146', 'DEPRECIACIÓN ACUMULADA DE HERRAMIENTAS Y UNIDADES DE REEMPLAZO DE REVALUACIÓN', '1', '3914'),
('39151', '39151', 'EDIFICACIONES', '1', '3915'),
('39152', '39152', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '3915'),
('39161', '39161', 'ACTIVOS BIOLÓGICOS DE ORIGEN ANIMAL', '1', '3916'),
('39162', '39162', 'ACTIVOS BIOLÓGICOS DE ORIGEN VEGETAL', '1', '3916'),
('39171', '39171', 'ACTIVOS BIOLÓGICOS DE ORIGEN ANIMAL', '1', '3917'),
('39172', '39172', 'ACTIVOS BIOLÓGICOS DE ORIGEN VEGETAL', '1', '3917'),
('39211', '39211', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '3921'),
('39212', '39212', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '3921'),
('39213', '39213', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '3921'),
('39214', '39214', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '3921'),
('39215', '39215', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '3921'),
('39219', '39219', 'OTROS ACTIVOS INTANGIBLES', '1', '3921'),
('39221', '39221', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '3922'),
('39222', '39222', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '3922'),
('39223', '39223', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '3922'),
('39224', '39224', 'COSTO DE EXPLORACION Y DESARROLLO', '1', '3922'),
('39225', '39225', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '3922'),
('39229', '39229', 'OTROS ACTIVOS INTANGIBLES', '1', '3922'),
('39234', '39234', 'COSTO DE EXPLORACION Y DESARROLLO', '1', '3923'),
('40111', '40111', 'IGV - CUENTA PROPIA', '1', '4011'),
('40112', '40112', 'IGV - SERVICIOS PRESTADOS POR NO DOMICILIADOS', '1', '4011'),
('40113', '40113', 'IGV - RÉGIMEN DE PERCEPCIONES', '1', '4011'),
('40114', '40114', 'IGV - RÉGIMEN DE RETENCIONES', '1', '4011'),
('40151', '40151', 'DERECHOS ARANCELARIOS', '1', '4015'),
('40152', '40152', 'DERECHOS ADUANEROS POR VENTAS', '1', '4015'),
('40171', '40171', 'RENTA DE TERCERA CATEGORÍA', '1', '4017'),
('40172', '40172', 'RENTA DE CUARTA CATEGORÍA', '1', '4017'),
('40173', '40173', 'RENTA DE QUINTA CATEGORÍA', '1', '4017'),
('40174', '40174', 'RENTA DE NO DOMICILIADOS', '1', '4017'),
('40175', '40175', 'OTRAS RETENCIONES', '1', '4017'),
('40181', '40181', 'IMPUESTO A LAS TRANSACCIONES FINANCIERAS', '1', '4018'),
('40182', '40182', 'IMPUESTO A LOS JUEGOS DE CASINO Y TRAGAMONEDAS', '1', '4018'),
('40183', '40183', 'TASAS POR LA PRESTACIÓN DE SERVICIOS PÚBLICOS', '1', '4018'),
('40184', '40184', 'REGALÍAS', '1', '4018'),
('40185', '40185', 'IMPUESTO A LOS DIVIDENDOS', '1', '4018'),
('40186', '40186', 'IMPUESTO TEMPORAL A LOS ACTIVOS NETOS ', '1', '4018'),
('40189', '40189', 'OTROS IMPUESTOS    ', '1', '4018'),
('40611', '40611', 'IMPUESTO AL PATRIMONIO VEHICULAR', '1', '4061'),
('40612', '40612', 'IMPUESTO A LAS APUESTAS', '1', '4061'),
('40613', '40613', 'IMPUESTO A LOS JUEGOS', '1', '4061'),
('40614', '40614', 'IMPUESTO DE ALCABALA', '1', '4061'),
('40615', '40615', 'IMPUESTO PREDIAL', '1', '4061'),
('40616', '40616', 'IMPUESTO A LOS ESPECTÁCULOS PÚBLICOS NO DEPORTIVOS', '1', '4061'),
('40631', '40631', 'LICENCIA DE APERTURA DE ESTABLECIMIENTOS', '1', '4063'),
('40632', '40632', 'TRANSPORTE PÚBLICO', '1', '4063'),
('40633', '40633', 'ESTACIONAMIENTO DE VEHÍCULOS', '1', '4063'),
('40634', '40634', 'SERVICIOS PÚBLICOS O ARBITRIOS', '1', '4063'),
('40635', '40635', 'SERVICIOS ADMINISTRATIVOS O DERECHOS', '1', '4063'),
('41111', '41111', 'SUELDOS Y SALARIOS POR PAGAR', '1', '4111'),
('41121', '41121', 'BONIFICACIONES POR PAGAR', '1', '4112'),
('42121', '42121', 'PROVEEDORES DE COMPROBANTES RECIBIDOS', '1', '4212'),
('43111', '43111', 'MATRIZ', '1', '4311'),
('43112', '43112', 'SUBSIDIARIAS', '1', '4311'),
('43113', '43113', 'ASOCIADAS', '1', '4311'),
('43114', '43114', 'SUCURSALES', '1', '4311'),
('43115', '43115', 'OTROS', '1', '4311'),
('43121', '43121', 'MATRIZ', '1', '4312'),
('43122', '43122', 'SUBSIDIARIAS', '1', '4312'),
('43123', '43123', 'ASOCIADAS', '1', '4312'),
('43124', '43124', 'SUCURSALES', '1', '4312'),
('43125', '43125', 'OTROS', '1', '4312'),
('43211', '43211', 'MATRIZ', '1', '4321'),
('43212', '43212', 'SUBSIDIARIAS', '1', '4321'),
('43213', '43213', 'ASOCIADAS', '1', '4321'),
('43214', '43214', 'SUCURSALES', '1', '4321'),
('43215', '43215', 'OTROS', '1', '4321'),
('43311', '43311', 'MATRIZ', '1', '4331'),
('43312', '43312', 'SUBSIDIARIAS', '1', '4331'),
('43313', '43313', 'ASOCIADAS', '1', '4331'),
('43314', '43314', 'SUCURSALES', '1', '4331'),
('43315', '43315', 'OTROS', '1', '4331'),
('43411', '43411', 'MATRIZ', '1', '4341'),
('43412', '43412', 'SUBSIDIARIAS', '1', '4341'),
('43413', '43413', 'ASOCIADAS', '1', '4341'),
('43414', '43414', 'SUCURSALES', '1', '4341'),
('43415', '43415', 'OTROS', '1', '4341'),
('45511', '45511', 'INSTITUCIONES FINANCIERAS', '1', '4551'),
('45512', '45512', 'OTRAS ENTIDADES', '1', '4551'),
('45531', '45531', 'BONOS EMITIDOS ', '1', '4553'),
('45532', '45532', 'BONOS TITULIZADOS', '1', '4553'),
('45533', '45533', 'PAPELES COMERCIALES', '1', '4553'),
('45539', '45539', 'OTRAS OBLIGACIONES   ', '1', '4553'),
('45541', '45541', 'LETRAS', '1', '4554'),
('45542', '45542', 'PAPELES COMERCIALES', '1', '4554'),
('45543', '45543', 'BONOS', '1', '4554'),
('45544', '45544', 'PAGARÉS', '1', '4554'),
('45545', '45545', 'FACTURAS CONFORMADAS', '1', '4554'),
('45549', '45549', 'OTRAS OBLIGACIONES FINANCIERAS', '1', '4554'),
('46421', '46421', 'CARTERA DE NEGOCIACION  ', '1', '4642'),
('46422', '46422', 'INSTRUMENTOS DE COERTURA ', '1', '4642'),
('47711', '47711', 'MATRIZ', '1', '4771'),
('47712', '47712', 'SUBSIDIARIAS', '1', '4771'),
('47713', '47713', 'ASOCIADAS', '1', '4771'),
('47714', '47714', 'SUCURSALES', '1', '4771'),
('47715', '47715', 'OTRAS', '1', '4771'),
('47721', '47721', 'MATRIZ', '1', '4772'),
('47722', '47722', 'SUBSIDIARIAS', '1', '4772'),
('47723', '47723', 'ASOCIADAS', '1', '4772'),
('47724', '47724', 'SUCURSALES', '1', '4772'),
('47725', '47725', 'OTRAS', '1', '4772'),
('47731', '47731', 'MATRIZ', '1', '4773'),
('47732', '47732', 'SUBSIDIARIAS', '1', '4773'),
('47733', '47733', 'ASOCIADAS', '1', '4773'),
('47734', '47734', 'SUCURSALES', '1', '4773'),
('47735', '47735', 'OTRAS', '1', '4773'),
('47741', '47741', 'MATRIZ', '1', '4774'),
('47742', '47742', 'SUBSIDIARIAS', '1', '4774'),
('47743', '47743', 'ASOCIADAS', '1', '4774'),
('47744', '47744', 'SUCURSALES', '1', '4774'),
('47745', '47745', 'OTRAS', '1', '4774'),
('47751', '47751', 'MATRIZ', '1', '4775'),
('47752', '47752', 'SUBSIDIARIAS', '1', '4775'),
('47753', '47753', 'ASOCIADAS', '1', '4775'),
('47754', '47754', 'SUCURSALES', '1', '4775'),
('47755', '47755', 'OTRAS', '1', '4775'),
('47761', '47761', 'MATRIZ', '1', '4776'),
('47762', '47762', 'SUBSIDIARIAS', '1', '4776'),
('47763', '47763', 'ASOCIADAS', '1', '4776'),
('47764', '47764', 'SUCURSALES', '1', '4776'),
('47765', '47765', 'OTRAS', '1', '4776'),
('47911', '47911', 'MATRIZ', '1', '4791'),
('47912', '47912', 'SUBSIDIARIAS', '1', '4791'),
('47913', '47913', 'ASOCIADAS', '1', '4791'),
('47914', '47914', 'SUCURSALES', '1', '4791'),
('47915', '47915', 'OTRAS', '1', '4791'),
('50111', '50111', 'Acciones Sociales', '1', '5011'),
('60111', '60111', 'MERCADERÍAS MANUFACTURADAS', '1', '6011'),
('60121', '60121', 'MERCADERÍAS DE EXTRACCIÓN', '1', '6012'),
('60131', '60131', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '6013'),
('60141', '60141', 'MERCADERÍAS INMUEBLES', '1', '6014'),
('60181', '60181', 'OTRAS MERCADERÍAS', '1', '6018'),
('60211', '60211', 'MATERIAS PRIMAS PARA PRODUCTOS MANUFACTURADOS', '1', '6021'),
('60221', '60221', 'MATERIAS PRIMAS PARA PRODUCTOS DE EXTRACCIÓN', '1', '6022'),
('60231', '60231', 'MATERIAS PRIMAS PARA PRODUCTOS PARA PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS', '1', '6023'),
('60241', '60241', 'MATERIAS PRIMAS PARA PRODUCTOS INMUEBLES', '1', '6024'),
('60311', '60311', 'MATERIALES AUXILIARES', '1', '6031'),
('60321', '60321', 'SUMINISTROS', '1', '6032'),
('60911', '60911', 'TRANSPORTE DE LA COMPRA DE MERCADERÍAS', '1', '6091'),
('60912', '60912', 'SEGUROS DE LA COMPRA DE MERCADERÍAS', '1', '6091'),
('60913', '60913', 'DERECHOS ADUANEROS DE LA COMPRA DE MERCADERÍAS', '1', '6091'),
('60914', '60914', 'COMISIONES DE LA COMPRA DE MERCADERÍAS', '1', '6091'),
('60919', '60919', 'OTROS COSTOS VINCULADOS CON LAS COMPRAS DE MERCADERÍAS', '1', '6091'),
('60921', '60921', 'TRANSPORTE DE LAS COMPRAS DE MATERIAS PRIMAS', '1', '6092'),
('60922', '60922', 'SEGUROS DE LAS COMPRAS DE MATERIAS PRIMAS', '1', '6092'),
('60923', '60923', 'DERECHOS ADUANEROS DE LAS COMPRAS DE MATERIAS PRIMAS', '1', '6092'),
('60924', '60924', 'COMISIONES DE LAS COMPRAS DE MATERIAS PRIMAS', '1', '6092'),
('60925', '60925', 'OTROS COSTOS VINCULADOS CON LAS COMPRAS DE MATERIALES', '1', '6092'),
('60931', '60931', 'TRANSPORTE DE LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '6093'),
('60932', '60932', 'SEGUROS DE LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '6093'),
('60933', '60933', 'DRECHOS ADUANEROS DE LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '6093'),
('60934', '60934', 'COMISIONES DE LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '6093'),
('60935', '60935', 'OTROS COSTOS VINCULADOS CON LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '6093'),
('60941', '60941', 'TRANSPORTE DE LAS COMPRAS DE ENVASES Y EMBALAJES', '1', '6094'),
('60942', '60942', 'SEGUROS DE LAS COMPRAS DE ENVASES Y EMBALAJES', '1', '6094'),
('60943', '60943', 'DRECHOS ADUANEROS DE LAS COMPRAS DE ENVASES Y EMBALAJES', '1', '6094'),
('60944', '60944', 'COMISIONES DE LAS COMPRAS DE ENVASES Y EMBALAJES', '1', '6094'),
('60945', '60945', 'OTROS COSTOS VINCULADOS CON LAS COMPRAS DE MATERIALES, SUMINISTROS Y REPUESTOS', '1', '6094'),
('61111', '61111', 'VARIACIÓN DE EXISTENCIAS DE MERCADERÍAS MANUFACTURADAS', '1', '6111'),
('62111', '62111', 'SUELDOS Y SALARIOS', '1', '6211'),
('62141', '62141', 'GRATIFICACIONES', '1', '6214'),
('62151', '62151', 'VACACIONES', '1', '6215'),
('62211', '62211', 'OTRAS REMUNERACIONES', '1', '6221'),
('62311', '62311', 'INDEMNIZACIONES AL PERSONAL', '1', '6231'),
('62411', '62411', 'CAPACITACIONES AL PERSONAL', '1', '6241'),
('62511', '62511', 'ATENCIÓN AL PERSONAL', '1', '6251'),
('62611', '62611', 'ATENCIÓN AL DIRECTOR', '1', '6261'),
('62612', '62612', 'CAPACITACIÓN AL DIRECTOR', '1', '6261'),
('62621', '62621', 'ATENCIÓN AL TESORERO', '1', '6262'),
('62622', '62622', 'CAPACITACIÓN AL TESORERO', '1', '6262'),
('63111', '63111', 'TRANSPORTE DE CARGA', '1', '6311'),
('63112', '63112', 'TRANSPORTE DE PASAJEROS', '1', '6311'),
('63121', '63121', 'CORREOS, COURIER Y ENVÍOS', '1', '6312'),
('63130', '63130', 'HOSPEDAJE', '1', '6313'),
('63131', '63131', 'ALIMENTACIÓN AL PERSONAL', '1', '6313'),
('63132', '63132', 'ALIMENTACIÓN AL CONSEJO DIRECTIVO', '1', '6313'),
('63151', '63151', 'GASTOS DE VIAJE DEL PERSONAL', '1', '6315'),
('63152', '63152', 'GASTOS DE VIAJE DEL CONSEJO DIRECTIVO', '1', '6315'),
('63211', '63211', 'ASESORÍA Y CONSULTORÍA ADMINISTRATIVA', '1', '6321'),
('63221', '63221', 'ASESORÍA Y CONSULTORÍA  LEGAL Y TRIBUTARIA', '1', '6322'),
('63231', '63231', 'ASESORÍA Y CONSULTORÍA EN AUDITORÍA Y CONTABLE', '1', '6323'),
('63241', '63241', 'ASESORÍA Y CONSULTORÍA EN MERCADOTECNIA', '1', '6324'),
('63251', '63251', 'ASESORÍA Y CONSULTORÍA EN MEDIOAMBIENTE', '1', '6325'),
('63261', '63261', 'ASESORÍA Y CONSULTORÍA EN INVESTIGACIÓN Y DESARROLLO', '1', '6326'),
('63271', '63271', 'ASESORÍA Y CONSULTORÍA EN PRODUCCIÓN', '1', '6327'),
('63291', '63291', 'ASESORÍAS Y CONSULTORÍAS VARIAS', '1', '6329'),
('63411', '63411', 'MANTENIMIENTO Y REPARACIONES EN INVERSIONES INMOBILIARIAS', '1', '6341'),
('63421', '63421', 'MANTENIMIENTO Y REPARACIONES EN ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '6342'),
('63431', '63431', 'MANTENIMIENTO Y REPARACIONES DE INMUEBLES, MAQUINARIA Y EQUIPO', '1', '6343'),
('63441', '63441', 'MANTENIMIENTO Y REPARACIONES DE INTANGIBLES', '1', '6344'),
('63451', '63451', 'MANTENIMIENTO Y REPARACIONES DE ACTIVOS BIOLÓGICOS', '1', '6345'),
('63511', '63511', 'ALQUILERES DE TERRENOS', '1', '6351'),
('63521', '63521', 'ALQUILERES DE EDIFICACIONES', '1', '6352'),
('63531', '63531', 'ALQUILERES DE MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '6353'),
('63541', '63541', 'ALQUILERES DE EQUIPO DE TRANSPORTE', '1', '6354'),
('63561', '63561', 'ALQUILERES DE EQUIPOS DIVERSOS', '1', '6356'),
('63611', '63611', 'ENERGÍA ELÉCTRICA', '1', '6361'),
('63621', '63621', 'GAS', '1', '6362'),
('63631', '63631', 'AGUA', '1', '6363'),
('63641', '63641', 'TELÉFONO', '1', '6364'),
('63651', '63651', 'INTERNET', '1', '6365'),
('63661', '63661', 'RADIO', '1', '6366'),
('63671', '63671', 'CABLE', '1', '6367'),
('63711', '63711', 'PUBLICIDAD  ', '1', '6371'),
('63721', '63721', 'PUBLICACIONES ', '1', '6372'),
('63731', '63731', 'GASTOS DE REPRESENTACIÓN', '1', '6373'),
('63732', '63732', 'ATENCIÓN A INVITADOS', '1', '6373'),
('65511', '65511', 'INVERSIONES INMOBILIARIAS', '1', '6551'),
('65512', '65512', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '6551'),
('65513', '65513', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '6551'),
('65514', '65514', 'INTANGIBLES', '1', '6551'),
('65515', '65515', 'ACTIVOS BIOLÓGICOS', '1', '6551'),
('65521', '65521', 'INVERSIONES INMOBILIARIAS', '1', '6552'),
('65522', '65522', 'ACTIVOS ADQUIRIDOS EN ARRENDAMIENTO FINANCIERO', '1', '6552'),
('65523', '65523', 'INMUEBLE, MAQUINARIA Y EQUIPOS ', '1', '6552'),
('65524', '65524', 'INTANGIBLES', '1', '6552'),
('65525', '65525', 'ACTIVOS BIOLOGICOS', '1', '6552'),
('66131', '66131', 'INVERSIONES INMOBILIARIAS', '1', '6613'),
('66132', '66132', 'INMUEBLE, MAQUINARIA Y EQUIPOS ', '1', '6613'),
('66133', '66133', 'INTANGIBLES', '1', '6613'),
('66134', '66134', 'ACTIVOS BIOLOGICOS', '1', '6613'),
('67111', '67111', 'PRÉSTAMOS DE INSTITUCIONES FINANCIERAS Y OTRAS ENTIDADES', '1', '6711'),
('67311', '67311', 'INTERESES POR PRÉSTAMOS Y OTRAS OBLIGACIONES A INSTITUCIONES FINANCIERAS', '1', '6731'),
('67312', '67312', 'INTERESES POR PRÉSTAMOS Y OTRAS OBLIGACIONES A OTRAS ENTIDADES', '1', '6731'),
('68111', '68111', 'EDIFICACIONES - COSTO', '1', '6811'),
('68112', '68112', 'EDIFICACIONES - REVALUACIÓN', '1', '6811'),
('68113', '68113', 'EDIFICACIONES ? COSTO DE FINANCIACIÓN', '1', '6811'),
('68121', '68121', 'EDIFICACIONES', '1', '6812'),
('68131', '68131', 'EDIFICACIONES', '1', '6813'),
('68132', '68132', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '6813'),
('68133', '68133', 'EQUIPO DE TRANSPORTE', '1', '6813'),
('68134', '68134', 'EQUIPOS DIVERSOS', '1', '6813'),
('68141', '68141', 'EDIFICACIONES', '1', '6814'),
('68142', '68142', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '6814'),
('68143', '68143', 'EQUIPO DE TRANSPORTE', '1', '6814'),
('68144', '68144', 'MUEBLES Y ENSERES', '1', '6814'),
('68145', '68145', 'EQUIPOS DIVERSOS', '1', '6814'),
('68146', '68146', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '6814'),
('68151', '68151', 'EDIFICACIONES', '1', '6815'),
('68152', '68152', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '6815'),
('68153', '68153', 'EQUIPO DE TRANSPORTE', '1', '6815'),
('68154', '68154', 'MUEBLES Y ENSERES', '1', '6815'),
('68155', '68155', 'EQUIPOS DIVERSOS', '1', '6815'),
('68156', '68156', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '6815'),
('68161', '68161', 'EDIFICACIONES', '1', '6816'),
('68162', '68162', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '6816'),
('68171', '68171', 'ACTIVOS BIOLÓGICOS DE ORIGEN ANIMAL', '1', '6817'),
('68172', '68172', 'ACTIVOS BIOLÓGICOS DE ORIGEN VEGETAL', '1', '6817'),
('68181', '68181', 'ACTIVOS BIOLÓGICOS DE ORIGEN ANIMAL', '1', '6818'),
('68182', '68182', 'ACTIVOS BIOLÓGICOS DE ORIGEN VEGETAL', '1', '6818'),
('68211', '68211', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '6821'),
('68212', '68212', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '6821'),
('68213', '68213', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '6821'),
('68214', '68214', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '6821'),
('68215', '68215', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '6821'),
('68219', '68219', 'OTROS ACTIVOS INTANGIBLES', '1', '6821'),
('68221', '68221', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '6822'),
('68222', '68222', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '6822'),
('68223', '68223', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '6822'),
('68224', '68224', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '6822'),
('68225', '68225', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '6822'),
('68229', '68229', 'OTROS ACTIVOS INTANGIBLES', '1', '6822'),
('68231', '68231', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '6823'),
('68232', '68232', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '6823'),
('68233', '68233', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '6823'),
('68234', '68234', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '6823'),
('68235', '68235', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '6823'),
('68239', '68239', 'OTROS ACTIVOS INTANGIBLES', '1', '6823'),
('68241', '68241', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '6824'),
('68242', '68242', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '6824'),
('68243', '68243', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '6824'),
('68244', '68244', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '6824'),
('68245', '68245', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '6824'),
('68511', '68511', 'EDIFICACIONES', '1', '6851'),
('68521', '68521', 'EDIFICACIONES', '1', '6852'),
('68522', '68522', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '6852'),
('68523', '68523', 'EQUIPO DE TRANSPORTE', '1', '6852'),
('68524', '68524', 'MUEBLES Y ENSERES', '1', '6852'),
('68525', '68525', 'EQUIPOS DIVERSOS', '1', '6852'),
('68526', '68526', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '6852'),
('68531', '68531', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '6853'),
('68532', '68532', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '6853'),
('68533', '68533', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '6853'),
('68534', '68534', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '6853'),
('68535', '68535', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '6853'),
('68536', '68536', 'OTROS ACTIVOS INTANGIBLES', '1', '6853'),
('68541', '68541', 'ACTIVOS BIOLÓGICOS DE ORIGEN ANIMAL', '1', '6854'),
('68542', '68542', 'ACTIVOS BIOLÓGICOS DE ORIGEN VEGETAL', '1', '6854'),
('68611', '68611', 'PROVISIÓN PARA LITIGIOS ? COSTO', '1', '6861'),
('68612', '68612', 'PROVISIÓN PARA LITIGIOS ? ACTUALIZACIÓN FINANCIERA', '1', '6861'),
('68621', '68621', 'PROVISIÓN POR DESMANTELAMIENTO, RETIRO O REHABILITACIÓN DEL INMOVILIZADO ? COSTO', '1', '6862'),
('68622', '68622', 'PROVISIÓN POR DESMANTELAMIENTO, RETIRO O REHABILITACIÓN DEL INMOVILIZADO ? ACTUALIZACIÓN FINANCIERA', '1', '6862'),
('69111', '69111', 'COSTO DE VENTAS DE MERCADERÍAS MANUFACTURADAS ADQUIRIDAS A TERCEROS', '1', '6911'),
('69112', '69112', 'RELACIONADAS', '1', '6911'),
('69121', '69121', 'TERCEROS', '1', '6912'),
('69122', '69122', 'RELACIONADAS', '1', '6912'),
('69131', '69131', 'TERCEROS', '1', '6913'),
('69132', '69132', 'RELACIONADAS', '1', '6913'),
('69141', '69141', 'TERCEROS', '1', '6914'),
('69142', '69142', 'RELACIONADAS', '1', '6914'),
('69151', '69151', 'TERCEROS', '1', '6915'),
('69152', '69152', 'RELACIONADAS', '1', '6915'),
('69211', '69211', 'TERCEROS', '1', '6921'),
('69212', '69212', 'RELACIONADAS', '1', '6921'),
('69221', '69221', 'TERCEROS', '1', '6922'),
('69222', '69222', 'RELACIONADAS', '1', '6922'),
('69231', '69231', 'TERCEROS', '1', '6923'),
('69232', '69232', 'RELACIONADAS', '1', '6923'),
('69241', '69241', 'TERCEROS', '1', '6924'),
('69242', '69242', 'RELACIONADAS', '1', '6924'),
('69251', '69251', 'TERCEROS', '1', '6925'),
('69252', '69252', 'RELACIONADAS', '1', '6925'),
('69261', '69261', 'TERCEROS', '1', '6926'),
('69262', '69262', 'RELACIONADAS', '1', '6926'),
('69311', '69311', 'TERCEROS', '1', '6931'),
('69312', '69312', 'RELACIONADAS', '1', '6931'),
('69321', '69321', 'TERCEROS', '1', '6932'),
('69322', '69322', 'RELACIONADAS', '1', '6932'),
('70111', '70111', 'VENTAS DE MERCADERÍAS MANUFACTURADAS VARIAS', '1', '7011'),
('70112', '70112', 'RELACIONADAS', '1', '7011'),
('70113', '70113', 'VENTA DE MOCHILAS', '1', '7011'),
('70121', '70121', 'TERCEROS', '1', '7012'),
('70122', '70122', 'RELACIONADAS', '1', '7012'),
('70131', '70131', 'TERCEROS', '1', '7013'),
('70132', '70132', 'RELACIONADAS', '1', '7013'),
('70141', '70141', 'TERCEROS', '1', '7014'),
('70142', '70142', 'RELACIONADAS', '1', '7014'),
('70151', '70151', 'TERCEROS', '1', '7015'),
('70152', '70152', 'RELACIONADAS', '1', '7015'),
('70153', '70153', 'VENTA DE CONSTANCIAS, CERTIFICADOS Y FUT''S', '1', '7015'),
('70211', '70211', 'TERCEROS', '1', '7021'),
('70212', '70212', 'RELACIONADAS', '1', '7021'),
('70221', '70221', 'TERCEROS', '1', '7022'),
('70222', '70222', 'RELACIONADAS', '1', '7022'),
('70231', '70231', 'TERCEROS', '1', '7023'),
('70232', '70232', 'RELACIONADAS', '1', '7023'),
('70241', '70241', 'TERCEROS', '1', '7024'),
('70242', '70242', 'RELACIONADAS', '1', '7024'),
('70251', '70251', 'TERCEROS', '1', '7025'),
('70252', '70252', 'RELACIONADAS', '1', '7025'),
('70311', '70311', 'TERCEROS', '1', '7031'),
('70312', '70312', 'RELACIONADAS', '1', '7031'),
('70321', '70321', 'TERCEROS', '1', '7032'),
('70322', '70322', 'RELACIONADAS', '1', '7032'),
('70911', '70911', 'MERCADERÍAS MANUFACTURADAS', '1', '7091'),
('70912', '70912', 'MERCADERÍAS DE EXTRACCIÓN', '1', '7091'),
('70913', '70913', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '7091'),
('70914', '70914', 'MERCADERÍAS INMUEBLES', '1', '7091'),
('70915', '70915', 'MERCADERÍAS ? OTRAS', '1', '7091'),
('70921', '70921', 'MERCADERÍAS MANUFACTURADAS', '1', '7092'),
('70922', '70922', 'MERCADERÍAS DE EXTRACCIÓN', '1', '7092'),
('70923', '70923', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '7092'),
('70924', '70924', 'MERCADERÍAS INMUEBLES', '1', '7092'),
('70925', '70925', 'MERCADERÍAS ? OTRAS', '1', '7092'),
('70931', '70931', 'PRODUCTOS MANUFACTURADOS', '1', '7093'),
('70932', '70932', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '7093'),
('70933', '70933', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '7093'),
('70934', '70934', 'PRODUCTOS INMUEBLES TERMINADOS', '1', '7093'),
('70935', '70935', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '7093'),
('70941', '70941', 'PRODUCTOS MANUFACTURADOS', '1', '7094'),
('70942', '70942', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '7094'),
('70943', '70943', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '7094'),
('70944', '70944', 'PRODUCTOS INMUEBLES TERMINADOS', '1', '7094'),
('70945', '70945', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '7094'),
('70971', '70971', 'TERCEROS', '1', '7097'),
('70972', '70972', 'RELACIONADAS', '1', '7097'),
('72511', '72511', 'COSTOS DE FINANCIACIÓN ? INVERSIONES INMOBILIARIAS ? EDIFICACIONES', '1', '7251'),
('72521', '72521', 'EDIFICACIONES', '1', '7252'),
('72522', '72522', 'MAQUINARIAS Y OTROS EQUIPOS DE EXPLOTACIÓN', '1', '7252'),
('72541', '72541', 'ACTIVOS BIOLÓGICOS DE ORIGEN ANIMAL', '1', '7254'),
('72542', '72542', 'ACTIVOS BIOLÓGICOS DE ORIGEN VEGETAL', '1', '7254');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_sub_cuenta`
--

CREATE TABLE IF NOT EXISTS `cont_sub_cuenta` (
  `id_sub_cuenta` varchar(22) NOT NULL,
  `cuenta` varchar(12) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_sub_cuenta`),
  KEY `cont_cuenta_cont_sub_cuenta_fk` (`id_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_sub_cuenta`
--

INSERT INTO `cont_sub_cuenta` (`id_sub_cuenta`, `cuenta`, `descripcion`, `estado`, `id_cuenta`) VALUES
('101', '101', 'CAJA', '1', '10'),
('102', '102', 'FONDOS FIJOS', '1', '10'),
('103', '103', 'EFECTIVO EN TRÁNSITO', '1', '10'),
('104', '104', 'CUENTAS CORRIENTES EN INSTITUCIONES FINANCIERAS', '1', '10'),
('105', '105', 'OTROS EQUIVALENTES DE EFECTIVO', '1', '10'),
('106', '106', 'DEPÓSITOS EN INSTITUCIONES FINANCIERAS', '1', '10'),
('107', '107', 'FONDOS SUJETOS A RESTRICCIÓN', '1', '10'),
('111', '111', 'INVERSIONES MANTENIDAS PARA NEGOCIACION', '1', '11'),
('112', '112', 'INVERSIONES DISPONIBLES PARA LA VENTA', '1', '11'),
('113', '113', 'ACTIVOS FINANCIEROS ? ACUERDO DE COMPRA', '1', '11'),
('121', '121', 'FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR', '1', '12'),
('122', '122', 'ANTICIPOS DE CLIENTES', '1', '12'),
('123', '123', 'LETRAS POR COBRAR', '1', '12'),
('131', '131', 'FACTURAS, BOLETAS Y OTROS COMPROBANTES POR COBRAR', '1', '13'),
('132', '132', 'ANTICIPOS RECIBIDOS', '1', '13'),
('133', '133', 'LETRAS POR COBRAR', '1', '13'),
('141', '141', 'PERSONAL', '1', '14'),
('142', '142', 'ACCIONISTAS (O SOCIOS)', '1', '14'),
('143', '143', 'DIRECTORES', '1', '14'),
('144', '144', 'GERENTES', '1', '14'),
('148', '148', 'DIVERSAS', '1', '14'),
('161', '161', 'PRÉSTAMOS', '1', '16'),
('162', '162', 'RECLAMACIONES A TERCEROS', '1', '16'),
('163', '163', 'INTERESES, REGALÍAS Y DIVIDENDOS', '1', '16'),
('164', '164', 'DEPÓSITOS OTORGADOS EN GARANTÍA', '1', '16'),
('165', '165', 'VENTA DE ACTIVO INMOVILIZADO', '1', '16'),
('166', '166', 'ACTIVOS POR INSTRUMENTOS FINANCIEROS DERIVADOS', '1', '16'),
('168', '168', 'OTRAS CUENTAS POR COBRAR DIVERSAS', '1', '16'),
('171', '171', 'PRÉSTAMOS', '1', '17'),
('173', '173', 'INTERESES, REGALÍAS Y DIVIDENDOS', '1', '17'),
('174', '174', 'DEPÓSITOS OTORGADOS EN GARANTÍA', '1', '17'),
('175', '175', 'VENTA DE ACTIVO INMOVILIZADO', '1', '17'),
('176', '176', 'ACTIVOS POR INSTRUMENTOS FINANCIEROS DERIVADOS', '1', '17'),
('178', '178', 'OTRAS CUENTAS POR COBRAR DIVERSAS', '1', '17'),
('181', '181', 'COSTOS FINANCIEROS', '1', '18'),
('182', '182', 'SEGUROS', '1', '18'),
('183', '183', 'ALQUILERES', '1', '18'),
('184', '184', 'PRIMAS PAGADAS POR OPCIONES', '1', '18'),
('185', '185', 'MANTENIMIENTO DE ACTIVOS INMOVILIZADOS', '1', '18'),
('189', '189', 'OTROS GASTOS CONTRATADOS POR ANTICIPADO', '1', '18'),
('191', '191', 'CUENTAS POR COBRAR COMERCIALES - TERCEROS', '1', '19'),
('192', '192', 'CUENTAS POR COBRAR COMERCIALES - RELACIONADAS', '1', '19'),
('193', '193', 'CUENTAS POR COBRAR AL PERSONAL, A LOS ACCIONISTAS (SOCIOS), DIRECTORES Y GERENTES', '1', '19'),
('194', '194', 'CUENTAS POR COBRAR DIVERSAS- TERCEROS', '1', '19'),
('195', '195', 'CUENTAS POR COBRAR DIVERSAS - RELACIONADAS', '1', '19'),
('201', '201', 'MERCADERÍAS MANUFACTURADAS', '1', '20'),
('202', '202', 'MERCADERÍAS DE EXTRACCIÓN', '1', '20'),
('203', '203', 'MERCADERÍAS AGROPECUARIAS Y PISCÍCOLAS', '1', '20'),
('204', '204', 'MERCADERÍAS INMUEBLES', '1', '20'),
('208', '208', 'OTRAS MERCADERÍAS', '1', '20'),
('211', '211', 'PRODUCTOS MANUFACTURADOS', '1', '21'),
('212', '212', 'PRODUCTOS DE EXTRACCIÓN TERMINADOS', '1', '21'),
('213', '213', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS TERMINADOS', '1', '21'),
('214', '214', 'PRODUCTOS INMUEBLES', '1', '21'),
('215', '215', 'EXISTENCIAS DE SERVICIOS TERMINADOS', '1', '21'),
('217', '217', 'OTROS PRODUCTOS TERMINADOS', '1', '21'),
('218', '218', 'COSTOS DE FINANCIACIÓN ? PRODUCTOS TERMINADOS', '1', '21'),
('221', '221', 'SUBPRODUCTOS', '1', '22'),
('222', '222', 'DESECHOS Y DESPERDICIOS', '1', '22'),
('231', '231', 'PRODUCTOS EN PROCESO DE MANUFACTURA', '1', '23'),
('232', '232', 'PRODUCTOS EXTRAÍDOS EN PROCESO DE TRANSFORMACIÓN', '1', '23'),
('233', '233', 'PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS EN PROCESO', '1', '23'),
('234', '234', 'PRODUCTOS INMUEBLES EN PROCESO', '1', '23'),
('235', '235', 'EXISTENCIAS DE SERVICIOS EN PROCESO', '1', '23'),
('237', '237', 'OTROS PRODUCTOS EN PROCESO', '1', '23'),
('238', '238', 'COSTOS DE FINANCIACIÓN ? PRODUCTOS EN PROCESO', '1', '23'),
('241', '241', 'MATERIAS PRIMAS PARA PRODUCTOS MANUFACTURADOS', '1', '24'),
('242', '242', 'MATERIAS PRIMAS PARA PRODUCTOS DE EXTRACCIÓN', '1', '24'),
('243', '243', 'MATERIAS PRIMAS PARA PRODUCTOS AGROPECUARIOS Y PISCÍCOLAS', '1', '24'),
('244', '244', 'MATERIAS PRIMAS PARA PRODUCTOS INMUEBLES', '1', '24'),
('251', '251', 'MATERIALES AUXILIARES', '1', '25'),
('252', '252', 'SUMINISTROS', '1', '25'),
('253', '253', 'REPUESTOS', '1', '25'),
('261', '261', 'ENVASES', '1', '26'),
('262', '262', 'EMBALAJES', '1', '26'),
('271', '271', 'INVERSIONES INMOBILIARIAS', '1', '27'),
('272', '272', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '27'),
('273', '273', 'INTANGIBLES', '1', '27'),
('274', '274', 'ACTIVOS BIOLÓGICOS', '1', '27'),
('275', '275', 'DEPRECIAION ACUMULADA - INVERSION INMOBILIARIA ', '1', '27'),
('276', '276', 'DEPRECIAION ACUMULADA - INMUEBLE  MAQUINARIA Y EQUIPO ', '1', '27'),
('277', '277', 'AMORTIZACION ACUMULADA - INTANGIBLES ', '1', '27'),
('278', '278', 'DEPRECIACION ACUMULADA - ACTIVOS BIOLOGICOS ', '1', '27'),
('279', '279', 'DESVALORIZACION ACUMULADA', '1', '27'),
('281', '281', 'MERCADERÍAS', '1', '28'),
('284', '284', 'MATERIAS PRIMAS', '1', '28'),
('285', '285', 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS', '1', '28'),
('286', '286', 'ENVASES Y EMBALAJES', '1', '28'),
('291', '291', 'MERCADERÍAS', '1', '29'),
('292', '292', 'PRODUCTOS TERMINADOS', '1', '29'),
('293', '293', 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS', '1', '29'),
('294', '294', 'PRODUCTOS EN PROCESO', '1', '29'),
('295', '295', 'MATERIAS PRIMAS', '1', '29'),
('296', '296', 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS', '1', '29'),
('297', '297', 'ENVASES Y EMBALAJES', '1', '29'),
('298', '298', 'EXISTENCIAS POR RECIBIR', '1', '29'),
('301', '301', 'INVERSIONES A SER MANTENIDAS HASTA EL VENCIMIENTO', '1', '30'),
('302', '302', 'INSTRUMENTOS FINANCIEROS REPRESENTATIVOS DE DERECHO PATRIMONIAL', '1', '30'),
('308', '308', 'INVERSIONES MOVILIARIAS - ACUERDO DE COMPRA', '1', '30'),
('311', '311', 'TERRENOS', '1', '31'),
('312', '312', 'EDIFICACIONES', '1', '31'),
('321', '321', 'INVERSIONES INMOBILIARIAS', '1', '32'),
('322', '322', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '32'),
('331', '331', 'TERRENOS', '1', '33'),
('332', '332', 'EDIFICACIONES', '1', '33'),
('333', '333', 'MAQUINARIAS Y EQUIPOS DE EXPLOTACIÓN', '1', '33'),
('334', '334', 'EQUIPO DE TRANSPORTE', '1', '33'),
('335', '335', 'MUEBLES Y ENSERES', '1', '33'),
('336', '336', 'EQUIPOS DIVERSOS', '1', '33'),
('337', '337', 'HERRAMIENTAS Y UNIDADES DE REEMPLAZO', '1', '33'),
('338', '338', 'UNIDADES POR RECIBIR', '1', '33'),
('339', '339', 'CONSTRUCCIONES Y OBRAS EN CURSO', '1', '33'),
('341', '341', 'CONCESIONES, LICENCIAS Y OTROS DERECHOS', '1', '34'),
('342', '342', 'PATENTES Y PROPIEDAD INDUSTRIAL', '1', '34'),
('343', '343', 'PROGRAMAS DE COMPUTADORA (SOFTWARE)', '1', '34'),
('344', '344', 'COSTOS DE EXPLORACIÓN Y DESARROLLO', '1', '34'),
('345', '345', 'FÓRMULAS, DISEÑOS Y PROTOTIPOS', '1', '34'),
('346', '346', 'RESERVAS DE RECURSOS EXTRAÍBLES', '1', '34'),
('347', '347', 'PLUSVALÍA MERCANTIL', '1', '34'),
('349', '349', 'OTROS ACTIVOS INTANGIBLES', '1', '34'),
('351', '351', 'ACTIVOS BIOLÓGICOS EN PRODUCCIÓN', '1', '35'),
('352', '352', 'ACTIVOS BIOLÓGICOS EN DESARROLLO', '1', '35'),
('361', '361', ' DESVALORIZACION DE INVERSIONES INMOBILIARIAS', '1', '36'),
('363', '363', 'DESVALORIZACION DE INMUEBLES, MAQUINARIA Y EQUIPO', '1', '36'),
('364', '364', 'DESVALORIZAACION DE INTANGIBLES', '1', '36'),
('365', '365', 'DESVALORIZACION DE ACTIVOS BIOLÓGICOS', '1', '36'),
('366', '366', 'DESVALORIZACION DE INVERSIONES INMOBOLIARIAS ', '1', '36'),
('371', '371', 'IMPUESTO A LA RENTA DIFERIDO', '1', '37'),
('372', '372', 'PARTICIPACIONES DE LOS TRABAJADORES DIFERIDAS ', '1', '37'),
('373', '373', 'INTERESES DIFERIDOS', '1', '37'),
('381', '381', 'BIENES DE ARTE Y CULTURA', '1', '38'),
('382', '382', 'DIVERSOS', '1', '38'),
('391', '391', 'DEPRECIACIÓN ACUMULADA', '1', '39'),
('392', '392', 'AMORTIZACIÓN ACUMULADA', '1', '39'),
('393', '393', 'AGOTAMIENTO ACUMULADO', '1', '39'),
('401', '401', 'GOBIERNO CENTRAL', '1', '40'),
('402', '402', 'CERTIFICADOS TRIBUTARIOS', '1', '40'),
('403', '403', 'INSTITUCIONES PÚBLICAS', '1', '40'),
('405', '405', 'GOBIERNOS REGIONALES', '1', '40'),
('406', '406', 'GOBIERNOS LOCALES', '1', '40'),
('407', '407', 'ADMINISTRADORAS DE FONDOS DE PENSIONES', '1', '40'),
('408', '408', 'EMPRESAS PRESTADORAS DE SERVICIOS DE SALUD', '1', '40'),
('409', '409', 'OTROS COSTOS ADMINISTRATIVOS E INTERESES', '1', '40'),
('411', '411', 'REMUNERACIONES POR PAGAR', '1', '41'),
('413', '413', 'PARTICIPACIÓN DE LOS TRABAJADORES POR PAGAR', '1', '41'),
('415', '415', 'BENEFICIOS SOCIALES DE LOS TRABAJADORES POR PAGAR', '1', '41'),
('419', '419', 'OTRAS REMUNERACIONES Y PARTICIPACIONES POR PAGAR', '1', '41'),
('421', '421', 'FACTURAS, BOLETAS Y OTROS COMPROBANTES POR PAGAR', '1', '42'),
('422', '422', 'ANTICIPOS A PROVEEDORES', '1', '42'),
('423', '423', 'LETRAS POR PAGAR', '1', '42'),
('424', '424', 'HONORARIOS POR PAGAR', '1', '42'),
('431', '431', 'FACTURAS, BOLETAS Y OTROS COMPROBANTES POR PAGAR', '1', '43'),
('432', '432', 'ANTICIPOS OTORGADOS', '1', '43'),
('433', '433', 'LETRAS POR PAGAR', '1', '43'),
('434', '434', 'HONORARIOS POR PAGAR', '1', '43'),
('441', '441', 'ACCIONISTAS (O SOCIOS)', '1', '44'),
('442', '442', 'DIRECTORES', '1', '44'),
('443', '443', 'GERENTES', '1', '44'),
('451', '451', 'PRÉSTAMOS DE INSTITUCIONES FINANCIERAS Y OTRAS ENTIDADES', '1', '45'),
('452', '452', 'CONTRATOS DE ARRENDAMIENTO FINANCIERO', '1', '45'),
('453', '453', 'OBLIGACIONES EMITIDAS', '1', '45'),
('454', '454', 'OTROS INSTRUMENTOS FINANCIEROS POR PAGAR', '1', '45'),
('455', '455', 'COSTOS DE FINANCIACIÓN POR PAGAR', '1', '45'),
('456', '456', 'PRÉSTAMOS CON COMPROMISOS DE RECOMPRA', '1', '45'),
('461', '461', 'RECLAMACIONES DE TERCEROS', '1', '46'),
('464', '464', 'PASIVOS POR INSTRUMENTOS FINANCIEROS DERIVADOS', '1', '46'),
('465', '465', 'PASIVOS POR COMPRA DE ACTIVO INMOVILIZADO', '1', '46'),
('467', '467', 'DEPÓSITOS RECIBIDOS EN GARANTÍA', '1', '46'),
('469', '469', 'OTRAS CUENTAS POR PAGAR DIVERSAS', '1', '46'),
('471', '471', 'PRÉSTAMOS', '1', '47'),
('472', '472', 'COSTOS DE FINANCIACIÓN', '1', '47'),
('473', '473', 'ANTICIPOS RECIBIDOS', '1', '47'),
('474', '474', 'REGALÍAS', '1', '47'),
('475', '475', 'DIVIDENDOS', '1', '47'),
('477', '477', 'PASIVO POR COMPRA DE ACTIVO INMOVILIZADO', '1', '47'),
('479', '479', 'OTRAS CUENTAS POR PAGAR DIVERSAS', '1', '47'),
('481', '481', 'PROVISIÓN PARA LITIGIOS', '1', '48'),
('482', '482', 'PROVISIÓN POR DESMANTELAMIENTO, RETIRO O REHABILITACIÓN DEL INMOVILIZADO', '1', '48'),
('483', '483', 'PROVISIÓN PARA REESTRUCTURACIONES', '1', '48'),
('484', '484', 'PROVISIÓN PARA PROTECCIÓN Y REMEDIACIÓN DEL MEDIO AMBIENTE', '1', '48'),
('485', '485', 'PROVISIÓN PARA GASTOS DE RESPONSABILIDAD SOCIAL', '1', '48'),
('489', '489', 'OTRAS PROVISIONES', '1', '48'),
('491', '491', 'IMPUESTO A LA RENTA DIFERIDO', '1', '49'),
('492', '492', 'PARTICIPACIONES DE LOS TRABAJADORES DIFERIDAS', '1', '49'),
('493', '493', 'INTERESES DIFERIDOS', '1', '49'),
('494', '494', 'GANANCIA EN VENTA CON ARRENDAMIENTO FINANCIERO PARALELO', '1', '49'),
('495', '495', 'SUBSIDIOS RECIBIDOS DIFERIDOS', '1', '49'),
('496', '496', 'INGRESOS DIFERIDOS', '1', '49'),
('497', '497', 'COSTOS DIFERIDOS', '1', '49'),
('501', '501', 'CAPITAL SOCIAL', '1', '50'),
('502', '502', 'ACCIONES EN TESORERÍA', '1', '50'),
('511', '511', 'ACCIONES DE INVERSIÓN', '1', '51'),
('512', '512', 'ACCIONES DE INVERSIÓN EN TESORERÍA', '1', '51'),
('521', '521', 'PRIMAS (DESCUENTO) DE ACCIONES', '1', '52'),
('522', '522', 'CAPITALIZACIONES EN TRÁMITE', '1', '52'),
('523', '523', 'REDUCCIONES DE CAPITAL PENDIENTES DE FORMALIZACIÓN', '1', '52'),
('561', '561', 'DIFERENCIA EN CAMBIO DE INVERSIONES PERMANENTES EN ENTIDADES EXTRANJERAS', '1', '56'),
('562', '562', 'INSTRUMENTOS FINANCIEROS ? COBERTURA DE FLUJO DE EFECTIVO', '1', '56'),
('563', '563', 'GANANCIA O PÉRDIDA EN ACTIVOS O PASIVOS FINANCIEROS DISPONIBLES PARA LA VENTA', '1', '56'),
('564', '564', 'GANANCIA O PÉRDIDA EN ACTIVOS O PASIVOS FINANCIEROS DISPONIBLES PARA LA VENTA - COMPRA O VENTA CONVE', '1', '56'),
('571', '571', 'EXCEDENTE DE REVALUACIÓN', '1', '57'),
('572', '572', 'EXCEDENTE DE REVALUACIÓN ? ACCIONES LIBERADAS RECIBIDAS', '1', '57'),
('573', '573', 'PARTICIPACIÓN EN EXCEDENTE DE REVALUACIÓN ? INVERSIONES EN ENTIDADES RELACIONADAS', '1', '57'),
('581', '581', 'REINVERSIÓN', '1', '58'),
('582', '582', 'LEGAL', '1', '58'),
('583', '583', 'CONTRACTUALES', '1', '58'),
('584', '584', 'ESTATUTARIAS', '1', '58'),
('585', '585', 'FACULTATIVAS', '1', '58'),
('589', '589', 'OTRAS RESERVAS', '1', '58'),
('591', '591', 'UTILIDADES NO DISTRIBUIDAS', '1', '59'),
('592', '592', 'PÉRDIDAS ACUMULADAS', '1', '59'),
('601', '601', 'MERCADERÍAS', '1', '60'),
('602', '602', 'MATERIAS PRIMAS', '1', '60'),
('603', '603', 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS', '1', '60'),
('604', '604', 'ENVASES Y EMBALAJES', '1', '60'),
('609', '609', 'COSTOS VINCULADOS CON LAS COMPRAS', '1', '60'),
('611', '611', 'MERCADERÍAS', '1', '61'),
('612', '612', 'MATERIAS PRIMAS', '1', '61'),
('613', '613', 'MATERIALES AUXILIARES, SUMINISTROS Y REPUESTOS', '1', '61'),
('614', '614', 'ENVASES Y EMBALAJES', '1', '61'),
('621', '621', 'REMUNERACIONES', '1', '62'),
('622', '622', 'OTRAS REMUNERACIONES', '1', '62'),
('623', '623', 'INDEMNIZACIONES AL PERSONAL', '1', '62'),
('624', '624', 'CAPACITACIÓN', '1', '62'),
('625', '625', 'ATENCIÓN AL PERSONAL', '1', '62'),
('626', '626', 'GERENTES', '1', '62'),
('627', '627', 'SEGURIDAD Y PREVISIÓN SOCIAL Y OTRAS CONTRIBUCIONES ', '1', '62'),
('628', '628', 'REMUNERACIONES AL DIRECTORIO', '1', '62'),
('629', '629', 'BENEFICIOS SOCIALES DE LOS TRABAJADORES', '1', '62'),
('631', '631', 'TRANSPORTE, CORREOS Y GASTOS DE VIAJE', '1', '63'),
('632', '632', 'ASESORIA Y CONSULTORIA', '1', '63'),
('633', '633', 'PRODUCCIÓN ENCARGADA A TERCEROS', '1', '63'),
('634', '634', 'MANTENIMIENTO Y REPARACIONES', '1', '63'),
('635', '635', 'ALQUILERES', '1', '63'),
('636', '636', 'SERVICIOS BÁSICOS', '1', '63'),
('637', '637', 'PUBLICIDAD, PUBLICACIONES, RELACIONES PÚBLICAS', '1', '63'),
('638', '638', 'SERVICIOS DE CONTRATISTAS', '1', '63'),
('639', '639', 'OTROS SERVICIOS PRESTADOS POR TERCEROS', '1', '63'),
('641', '641', 'GOBIERNO CENTRAL', '1', '64'),
('642', '642', 'GOBIERNO REGIONAL ', '1', '64'),
('643', '643', 'GOBIERNO LOCAL', '1', '64'),
('644', '644', 'OTROS GASTOS POR TRIBUTOS ', '1', '64'),
('651', '651', 'SEGUROS', '1', '65'),
('652', '652', 'REGALÍAS', '1', '65'),
('653', '653', 'SUSCRIPCIONES', '1', '65'),
('654', '654', 'LICENCIAS Y DERECHOS DE VIGENCIA', '1', '65'),
('655', '655', 'COSTO NETO DE ENAJENACIÓN DE ACTIVOS INMOVILIZADOS Y OPERACIONES DISCONTINUADAS', '1', '65'),
('656', '656', 'SUMINISTROS', '1', '65'),
('658', '658', 'GESTIÓN MEDIOAMBIENTAL', '1', '65'),
('659', '659', 'OTROS GASTOS DE GESTIÓN', '1', '65'),
('661', '661', 'ACTIVO REALIZABLE', '1', '66'),
('662', '662', 'ACTIVO INMOVILIZADO', '1', '66'),
('671', '671', 'GASTOS EN OPERACIONES DE ENDEUDAMIENTO Y OTROS', '1', '67'),
('672', '672', 'PÉRDIDA POR INSTRUMENTOS FINANCIEROS DERIVADOS', '1', '67'),
('673', '673', 'INTERESES POR PRÉSTAMOS Y OTRAS OBLIGACIONES', '1', '67'),
('675', '675', 'DESCUENTOS CONCEDIDOS POR PRONTO PAGO', '1', '67'),
('676', '676', 'DIFERENCIA DE CAMBIO', '1', '67'),
('677', '677', 'PÉRDIDA POR MEDICIÓN DE ACTIVOS Y PASIVOS FINANCIEROS AL VALOR RAZONABLE', '1', '67'),
('679', '679', 'OTROS GASTOS FINANCIEROS', '1', '67'),
('681', '681', 'DEPRECIACIÓN', '1', '68'),
('682', '682', 'AMORTIZACIÓN DE INTANGIBLES', '1', '68'),
('683', '683', 'AGOTAMIENTO', '1', '68'),
('684', '684', 'VALUACIÓN DE ACTIVOS', '1', '68'),
('685', '685', 'DETERIORO DEL VALOR DE LOS ACTIVOS', '1', '68'),
('686', '686', 'PROVISIONES', '1', '68'),
('691', '691', 'MERCADERÍAS', '1', '69'),
('692', '692', 'PRODUCTOS TERMINADOS', '1', '69'),
('693', '693', 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS', '1', '69'),
('694', '694', 'SERVICIOS', '1', '69'),
('701', '701', 'MERCADERÍAS', '1', '70'),
('702', '702', 'PRODUCTOS TERMINADOS', '1', '70'),
('703', '703', 'SUBPRODUCTOS, DESECHOS Y DESPERDICIOS', '1', '70'),
('704', '704', 'PRESTACIÓN DE SERVICIOS', '1', '70'),
('709', '709', 'DEVOLUCIONES SOBRE VENTAS', '1', '70'),
('711', '711', 'VARIACIÓN DE PRODUCTOS TERMINADOS', '1', '71'),
('712', '712', 'VARIACIÓN DE SUBPRODUCTOS, DESECHOS Y DESPERDICIOS', '1', '71'),
('713', '713', 'VARIACIÓN DE PRODUCTOS EN PROCESO', '1', '71'),
('714', '714', 'VARIACIÓN DE ENVASES Y EMBALAJES', '1', '71'),
('715', '715', 'VARIACIÓN DE EXISTENCIAS DE SERVICIOS', '1', '71'),
('721', '721', 'INVERSIONES INMOBILIARIAS', '1', '72'),
('722', '722', 'INMUEBLES, MAQUINARIA Y EQUIPO', '1', '72'),
('723', '723', 'INTANGIBLES', '1', '72'),
('724', '724', 'ACTIVOS BIOLÓGICOS', '1', '72'),
('725', '725', 'COSTOS DE FINANCIACIÓN CAPITALIZADOS', '1', '72'),
('731', '731', 'DESCUENTOS, REBAJAS Y BONIFICACIONES OBTENIDOS', '1', '73'),
('741', '741', 'DESCUENTOS, REBAJAS Y BONIFICACIONES CONCEDIDOS', '1', '74'),
('751', '751', 'SERVICIOS EN BENEFICIO DEL PERSONAL', '1', '75'),
('752', '752', 'COMISIONES Y CORRETAJES', '1', '75'),
('753', '753', 'REGALÍAS', '1', '75'),
('754', '754', 'ALQUILERES', '1', '75'),
('755', '755', 'RECUPERACIÓN DE CUENTAS DE VALUACIÓN', '1', '75'),
('756', '756', 'ENAJENACIÓN DE ACTIVOS INMOVILIZADOS', '1', '75'),
('757', '757', 'RECUPERACIÓN DE DETERIORO DE CUENTAS DE ACTIVOS INMOVILIZADOS', '1', '75'),
('759', '759', 'OTROS INGRESOS DE GESTIÓN', '1', '75'),
('761', '761', 'ACTIVO REALIZABLE', '1', '76'),
('762', '762', 'ACTIVO INMOVILIZADO', '1', '76'),
('763', '763', 'PARTICIPACIÓN EN LOS RESULTADOS DE SUBSIDIARIAS Y ASOCIADAS BAJO EL MÉTODO DEL VALOR PATRIMONIAL', '1', '76'),
('764', '764', 'INGRESOS POR PARTICIPACIONES EN NEGOCIOS CONJUNTOS', '1', '76'),
('771', '771', 'GANANCIA POR INSTRUMENTO FINANCIERO DERIVADO', '1', '77'),
('772', '772', 'RENDIMIENTOS GANADOS', '1', '77'),
('773', '773', 'DIVIDENDOS', '1', '77'),
('775', '775', 'DESCUENTOS OBTENIDOS POR PRONTO PAGO', '1', '77'),
('776', '776', 'DIFERENCIA EN CAMBIO', '1', '77'),
('777', '777', 'GANANCIA POR MEDICIÓN DE ACTIVOS Y PASIVOS FINANCIEROS AL VALOR RAZONABLE', '1', '77'),
('779', '779', 'OTROS INGRESOS FINANCIEROS', '1', '77'),
('781', '781', 'CARGAS CUBIERTAS POR PROVISIONES', '1', '78'),
('791', '791', 'CARGAS IMPUTABLES A CUENTAS DE COSTOS Y GASTOS', '1', '79'),
('792', '792', 'GASTOS FINANCIEROS IMPUTABLES A CUENTAS DE EXISTENCIAS', '1', '79'),
('801', '801', 'MARGEN COMERCIAL', '1', '80'),
('811', '811', 'PRODUCCIÓN DE BIENES', '1', '81'),
('812', '812', 'PRODUCCIÓN DE SERVICIOS', '1', '81'),
('813', '813', 'PRODUCCIÓN DE ACTIVO INMOVILIZADO', '1', '81'),
('821', '821', 'VALOR AGREGADO', '1', '82'),
('831', '831', 'EXCEDENTE BRUTO (INSUFICIENCIA BRUTA) DE EXPLOTACIÓN', '1', '83'),
('841', '841', 'RESULTADO DE EXPLOTACIÓN', '1', '84'),
('851', '851', 'RESULTADO ANTES DE PARTICIPACIONES E IMPUESTOS', '1', '85'),
('871', '871', 'PARTICIPACIÓN DE LOS TRABAJADORES ? CORRIENTE', '1', '87'),
('872', '872', 'PARTICIPACIÓN DE LOS TRABAJADORES ? DIFERIDA', '1', '87'),
('881', '881', 'IMPUESTO A LA RENTA ? CORRIENTE', '1', '88'),
('882', '882', 'IMPUESTO A LA RENTA - DIFERIDO', '1', '88'),
('891', '891', 'UTILIDAD', '1', '89'),
('892', '892', 'PÉRDIDA', '1', '89');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cont_sub_nivel`
--

CREATE TABLE IF NOT EXISTS `cont_sub_nivel` (
  `id_sub_nivel` varchar(22) NOT NULL,
  `nivel` varchar(12) NOT NULL,
  `decripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  PRIMARY KEY (`id_sub_nivel`),
  KEY `cont_nivel_cont_sub_nivel_fk` (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cont_sub_nivel`
--

INSERT INTO `cont_sub_nivel` (`id_sub_nivel`, `nivel`, `decripcion`, `estado`, `id_nivel`) VALUES
('10', '10', 'TUPAC', '1', '1');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `detalle_compras`
--
CREATE TABLE IF NOT EXISTS `detalle_compras` (
`id_mov_det` varchar(22)
,`id_voucher` varchar(22)
,`id_nivel` varchar(22)
,`id_cuenta_comp` varchar(22)
,`serie` varchar(6)
,`numdoc` varchar(20)
,`ruc` varchar(12)
,`detalle` varchar(80)
,`baseimp1` double
,`igv1` double
,`baseimp2` double
,`igv2` double
,`baseimp3` double
,`igv3` double
,`baseimp4` double
,`igv4` double
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `estado_cuenta`
--
CREATE TABLE IF NOT EXISTS `estado_cuenta` (
`id_estado_cuenta` double
,`mov` varchar(28)
,`documento` varchar(17)
,`fecha_doc` date
,`fecha_prov` date
,`voucher` varchar(22)
,`lote` varchar(30)
,`debito` double
,`credito` double
,`moneda` varchar(5)
,`otro_imp` varchar(1)
,`id` varchar(22)
,`proveedor` varchar(22)
);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_conceptos`
--

CREATE TABLE IF NOT EXISTS `fina_conceptos` (
  `id_conceptos` varchar(22) NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_conceptos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fina_conceptos`
--

INSERT INTO `fina_conceptos` (`id_conceptos`, `detalle`, `estado`) VALUES
('2013103100000001', 'Enseñanza', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_contrato_alumno`
--

CREATE TABLE IF NOT EXISTS `fina_contrato_alumno` (
  `id_contrato_alumno` varchar(22) NOT NULL,
  `codigo_contrato` varchar(22) NOT NULL,
  `so` varchar(2) NOT NULL,
  `id_cliente` varchar(22) NOT NULL,
  `num_hermano` int(11) NOT NULL,
  `tipo_beca` varchar(2) NOT NULL,
  `vivienda_direccion` varchar(150) NOT NULL,
  `res_fin_dni` varchar(20) NOT NULL,
  `res_fin_nombre` varchar(150) NOT NULL,
  `res_fin_trabajo` varchar(150) NOT NULL,
  `res_fin_paren` varchar(30) DEFAULT NULL COMMENT 'iar',
  `res_fin_telef` varchar(40) NOT NULL,
  `res_fin_direccion` varchar(200) NOT NULL,
  `res_fin_religion` varchar(60) NOT NULL,
  `res_fin_bautizado` varchar(2) NOT NULL,
  `res_fin_iglesia` varchar(60) NOT NULL,
  `id_grado` varchar(22) NOT NULL,
  `tipo_pago` varchar(2) NOT NULL,
  `fecha` date NOT NULL,
  `personal_user` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `importe` double NOT NULL,
  `descuento` double NOT NULL,
  `mora` double NOT NULL,
  `saldo` double NOT NULL,
  `tipo_ingreso` varchar(2) DEFAULT NULL COMMENT '--R=Ratificado, N=Nuevo',
  `estado_mat` varchar(2) NOT NULL,
  `compromiso_honor` varchar(2) NOT NULL,
  `entrego_so` varchar(2) NOT NULL,
  `cobra_mora` varchar(2) NOT NULL,
  `dias_mora` int(11) NOT NULL,
  `dias_descuento` int(11) NOT NULL,
  `seccion` varchar(10) NOT NULL,
  `tipo_matricula` varchar(6) DEFAULT NULL COMMENT '--con, cre',
  PRIMARY KEY (`id_contrato_alumno`),
  KEY `fina_grado_fina_contrato_alumno_fk` (`id_grado`),
  KEY `vent_cliente_fina_contrato_alumno_fk` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_contrato_alumno_criterio`
--

CREATE TABLE IF NOT EXISTS `fina_contrato_alumno_criterio` (
  `id_contrato_criterio` varchar(22) NOT NULL,
  `codigo_contrato` varchar(22) DEFAULT NULL COMMENT 'id_venta=condigo_contrato',
  `descripcion` varchar(100) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `tipo` varchar(2) DEFAULT NULL COMMENT 'MA=Matricula, EN=Ense�anza',
  `id_nivel_vnt` varchar(22) NOT NULL,
  `id_cuenta_vnt` varchar(22) NOT NULL,
  `num_cuotas` int(11) NOT NULL,
  `tipo_mat` varchar(10) NOT NULL,
  PRIMARY KEY (`id_contrato_criterio`),
  KEY `fina_nivel_fina_contrato_alumno_criterio_fk` (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fina_contrato_alumno_criterio`
--

INSERT INTO `fina_contrato_alumno_criterio` (`id_contrato_criterio`, `codigo_contrato`, `descripcion`, `precio`, `cantidad`, `estado`, `id_nivel`, `tipo`, `id_nivel_vnt`, `id_cuenta_vnt`, `num_cuotas`, `tipo_mat`) VALUES
('2013111100000001', '001-2013', 'Matricula', 160, 1, '1', '2013111000000001', 'MA', '103', '12345', 1, 'RA'),
('2013111100000002', '001-2013', 'Enseñanza', 1500, 1, '1', '2013111000000001', 'EN', '103', '12345', 9, 'GE'),
('2013111200000003', '001-2013', 'Matricula Primaria', 130, 1, '1', '2013111000000002', 'MA', '111', '11245', 1, 'RA'),
('2013111300000004', '001-2013', 'Matricula Primaria', 140, 1, '1', '2013111000000002', 'MA', '104', '10111', 1, 'NU');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_contrato_alumno_detalle`
--

CREATE TABLE IF NOT EXISTS `fina_contrato_alumno_detalle` (
  `id_contrato_alumno_det` varchar(22) NOT NULL,
  `id_contrato_alumno` varchar(22) NOT NULL,
  `importe` double NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_contrato_criterio` varchar(22) NOT NULL,
  PRIMARY KEY (`id_contrato_alumno_det`),
  KEY `fina_contrato_alumno_criterio_fina_contrato_alumno_detalle_fk` (`id_contrato_criterio`),
  KEY `fina_contrato_alumno_fina_contrato_alumno_detalle_fk` (`id_contrato_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_contrato_criterio_detalle`
--

CREATE TABLE IF NOT EXISTS `fina_contrato_criterio_detalle` (
  `id_criterio_detalle` varchar(22) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_contrato_criterio` varchar(22) NOT NULL,
  PRIMARY KEY (`id_criterio_detalle`),
  KEY `fina_contrato_alumno_criterio_fina_contrato_criterio_detalle_fk` (`id_contrato_criterio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fina_contrato_criterio_detalle`
--

INSERT INTO `fina_contrato_criterio_detalle` (`id_criterio_detalle`, `descripcion`, `precio`, `estado`, `id_nivel`, `id_cuenta`, `id_contrato_criterio`) VALUES
('2013111100000001', 'Matricula Total', 160, '1', '103', '12345', '2013111100000001'),
('2013111100000002', 'Enseñanza Total', 1500, '1', '103', '12345', '2013111100000002'),
('2013111200000003', 'Agenda', 100, '1', '104', '12411', '2013111200000003'),
('2013111200000004', 'Concept Matricula', 30, '1', '104', '11111', '2013111200000003'),
('2013111300000005', 'Concepto Matricula', 140, '1', '104', '10111', '2013111300000004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_curso`
--

CREATE TABLE IF NOT EXISTS `fina_curso` (
  `id_curso` varchar(22) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `etiqueta` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fina_curso`
--

INSERT INTO `fina_curso` (`id_curso`, `nombre`, `descripcion`, `etiqueta`, `estado`, `tipo`) VALUES
('2013111000000001', 'Comunicacion', 'Comunicaciones ', 'COM', '1', 'RE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_curso_grado`
--

CREATE TABLE IF NOT EXISTS `fina_curso_grado` (
  `id_curso_grado` varchar(22) NOT NULL,
  `id_curso` varchar(22) NOT NULL,
  `id_grado` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_curso_grado`),
  KEY `fina_curso_fina_curso_grado_fk` (`id_curso`),
  KEY `fina_grado_fina_curso_grado_fk` (`id_grado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_grado`
--

CREATE TABLE IF NOT EXISTS `fina_grado` (
  `id_grado` varchar(22) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `etiquetag` varchar(20) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  PRIMARY KEY (`id_grado`),
  KEY `fina_nivel_fina_grado_fk` (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fina_grado`
--

INSERT INTO `fina_grado` (`id_grado`, `nombre`, `etiquetag`, `estado`, `id_nivel`) VALUES
('2013111000000001', 'Primero', 'P1', '1', '2013111000000002'),
('2013112500000002', '4 Años', '4A', '1', '2013111000000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fina_nivel`
--

CREATE TABLE IF NOT EXISTS `fina_nivel` (
  `id_nivel` varchar(22) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `etiqueta` varchar(20) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `nivel` varchar(22) NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fina_nivel`
--

INSERT INTO `fina_nivel` (`id_nivel`, `nombre`, `etiqueta`, `estado`, `nivel`) VALUES
('2013111000000001', 'Inicial', 'INI', '1', '103'),
('2013111000000002', 'Primaria', 'PRI', '1', '104'),
('2013111000000003', 'Secundaria', 'SEC', '1', '105');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_apertura_periodo`
--

CREATE TABLE IF NOT EXISTS `glo_apertura_periodo` (
  `id_apertura_periodo` varchar(22) NOT NULL,
  `id_empresa` varchar(22) NOT NULL,
  `id_configuracion` varchar(22) NOT NULL,
  `id_periodo` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_apertura_periodo`),
  KEY `glo_configuracion_periodo_glo_apertura_periodo_fk` (`id_configuracion`),
  KEY `glo_empresa_glo_apertura_periodo_fk` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_apertura_periodo`
--

INSERT INTO `glo_apertura_periodo` (`id_apertura_periodo`, `id_empresa`, `id_configuracion`, `id_periodo`, `estado`, `ip`, `id_personal_user`) VALUES
('2013110300001', '2013110300001', '201311030001', '001-2013', '1', 'x', 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_area`
--

CREATE TABLE IF NOT EXISTS `glo_area` (
  `id_area` varchar(22) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_departamento` varchar(22) NOT NULL,
  PRIMARY KEY (`id_area`),
  KEY `glo_departamento_glo_area_fk` (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_banco`
--

CREATE TABLE IF NOT EXISTS `glo_banco` (
  `id_banco` varchar(22) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cuenta_corriente` varchar(60) NOT NULL,
  `cuenta_ahorros` varchar(60) NOT NULL,
  `rep_legal` varchar(150) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `fecha_activacion` date NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_banco`
--

INSERT INTO `glo_banco` (`id_banco`, `nombre`, `cuenta_corriente`, `cuenta_ahorros`, `rep_legal`, `estado`, `fecha_activacion`, `tipo`, `id_nivel`) VALUES
('2013111800000001', 'BCP', '11111', '11111', '1', '1', '2013-11-18', '1', 'X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_cheque_repo`
--

CREATE TABLE IF NOT EXISTS `glo_cheque_repo` (
  `id_mov_chec_repo` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `numcheque` varchar(12) NOT NULL,
  `monto` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_periodo` varchar(12) NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_chec_repo`),
  KEY `glo_voucher_repo_glo_cheque_repo_fk` (`id_voucher_repo`),
  KEY `glo_banco_glo_cheque_repo_fk` (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_comprobante`
--

CREATE TABLE IF NOT EXISTS `glo_comprobante` (
  `id_comprobante` varchar(22) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_comprobante`
--

INSERT INTO `glo_comprobante` (`id_comprobante`, `codigo`, `descripcion`, `estado`) VALUES
('2013110500000001', '00', 'Otros (especificar)', '1'),
('2013110500000002', '01', 'Factura', '1'),
('2013110500000003', '02', 'Recibo por Honorarios', '1'),
('2013110500000004', '03', 'Boleta de Venta', '1'),
('2013110500000005', '04', 'Liquidación de compra', '1'),
('2013110500000006', '05', 'Boleto de compañía de aviación comercial por el servicio de transporte aéreo de pasajeros', '1'),
('2013110500000007', '06', 'Carta de porte aéreo por el servicio de transporte de carga aérea', '1'),
('2013110500000008', '07', 'Nota de crédito', '1'),
('2013110500000009', '08', 'Nota de débito', '1'),
('2013110500000010', '09', 'Guía de remisión - Remitente', '1'),
('2013110500000011', '10', 'Recibo por Arrendamiento', '1'),
('2013110500000012', '11', 'Póliza emitida por las Bolsas de Valores, Bolsas de Productos o Agentes de Intermediación por operac', '1'),
('2013110500000013', '', 'realizadas en las Bolsas de Valores o Productos o fuera de las mismas, autorizadas por CONASEV', '1'),
('2013110500000014', '12', 'Ticket o cinta emitido por máquina registradora', '1'),
('2013110500000015', '13', 'Documento emitido por bancos, instituciones financieras, crediticias y de seguros que se encuentren ', '1'),
('2013110500000016', '', 'control de la Superintendencia de Banca y Seguros', '1'),
('2013110500000017', '14', 'Recibo por servicios públicos de suministro de energía eléctrica, agua, teléfono, telex y telegráfic', '1'),
('2013110500000018', '', 'servicios complementarios que se incluyan en el recibo de servicio público', '1'),
('2013110500000019', '15', 'Boleto emitido por las empresas de transporte público urbano de pasajeros', '1'),
('2013110500000020', '16', 'Boleto de viaje emitido por las empresas de transporte público interprovincial de pasajeros dentro d', '1'),
('2013110500000021', '17', 'Documento emitido por la Iglesia Católica por el arrendamiento de bienes inmuebles', '1'),
('2013110500000022', '18', 'Documento emitido por las Administradoras Privadas de Fondo de Pensiones que se encuentran bajo la ', '1'),
('2013110500000023', '', 'supervisión de la Superintendencia de Administradoras Privadas de Fondos de Pensiones', '1'),
('2013110500000024', '19', 'Boleto o entrada por atracciones y espectáculos públicos', '1'),
('2013110500000025', '20', 'Comprobante de Retención', '1'),
('2013110500000026', '21', 'Conocimiento de embarque por el servicio de transporte de carga marítima', '1'),
('2013110500000027', '22', 'Comprobante por Operaciones No Habituales', '1'),
('2013110500000028', '23', 'Pólizas de Adjudicación emitidas con ocasión del remate o adjudicación de bienes por venta forzada, ', '1'),
('2013110500000029', '', 'martilleros o las entidades que rematen o subasten bienes por cuenta de terceros', '1'),
('2013110500000030', '24', 'Certificado de pago de regalías emitidas por PERUPETRO S.A', '1'),
('2013110500000031', '25', 'Documento de Atribución (Ley del Impuesto General a las Ventas e Impuesto Selectivo al Consumo, Art.', '1'),
('2013110500000032', '', 'último párrafo, R.S. N° 022-98-SUNAT).', '1'),
('2013110500000033', '26', 'Recibo por el Pago de la Tarifa por Uso de Agua Superficial con fines agrarios y por el pago de la C', '1'),
('2013110500000034', '', 'ejecución de una determinada obra o actividad acordada por la Asamblea General de la Comisión de Reg', '1'),
('2013110500000035', '', 'Resolución expedida por el Jefe de la Unidad de Aguas y de Riego (Decreto Supremo N° 003-90-AG, Arts', '1'),
('2013110500000036', '27', 'Seguro Complementario de Trabajo de Riesgo', '1'),
('2013110500000037', '28', 'Tarifa Unificada de Uso de Aeropuerto', '1'),
('2013110500000038', '29', 'Documentos emitidos por la COFOPRI en calidad de oferta de venta de terrenos, los correspondientes a', '1'),
('2013110500000039', '', 'subastas públicas y a la retribución de los servicios que presta', '1'),
('2013110500000040', '30', 'Documentos emitidos por las empresas que desempeñan el rol adquirente en los sistemas de pago median', '1'),
('2013110500000041', '', 'tarjetas de crédito y débito', '1'),
('2013110500000042', '31', 'Guía de Remisión - Transportista', '1'),
('2013110500000043', '32', 'Documentos emitidos por las empresas recaudadoras de la denominada Garantía de Red Principal a la qu', '1'),
('2013110500000044', '', 'el numeral 7.6 del artículo 7° de la Ley N° 27133 ? Ley de Promoción del Desarrollo de la Industria ', '1'),
('2013110500000045', '34', 'Documento del Operador', '1'),
('2013110500000046', '35', 'Documento del Partícipe', '1'),
('2013110500000047', '36', 'Recibo de Distribución de Gas Natural', '1'),
('2013110500000048', '37', 'Documentos que emitan los concesionarios del servicio de revisiones técnicas vehiculares, por la pre', '1'),
('2013110500000049', '', 'servicio', '1'),
('2013110500000050', '50', 'Declaración Única de Aduanas - Importación definitiva                 ', '1'),
('2013110500000051', '52', 'Despacho Simplificado - Importación Simplificada                        ', '1'),
('2013110500000052', '53', 'Declaración de Mensajería o Courier                                         ', '1'),
('2013110500000053', '54', 'Liquidación de Cobranza                                                     ', '1'),
('2013110500000054', '87', 'Nota de Crédito Especial', '1'),
('2013110500000055', '88', 'Nota de Débito Especial', '1'),
('2013110500000056', '91', 'Comprobante de No Domiciliado                                                 ', '1'),
('2013110500000057', '96', 'Exceso de crédito fiscal por retiro de bienes                           ', '1'),
('2013110500000058', '97', 'Nota de Crédito - No Domiciliado', '1'),
('2013110500000059', '98', 'Nota de Débito - No Domiciliado', '1'),
('2013110500000060', '99', 'Otros -Consolidado de Boletas de Venta', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_configuracion`
--

CREATE TABLE IF NOT EXISTS `glo_configuracion` (
  `id_configuracion` varchar(22) NOT NULL,
  `id_cuenta_igv` varchar(22) NOT NULL,
  `porcent_igv` double NOT NULL,
  PRIMARY KEY (`id_configuracion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_configuracion`
--

INSERT INTO `glo_configuracion` (`id_configuracion`, `id_cuenta_igv`, `porcent_igv`) VALUES
('201311030001', 'x', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_departamento`
--

CREATE TABLE IF NOT EXISTS `glo_departamento` (
  `id_departamento` varchar(22) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_deposito_banco`
--

CREATE TABLE IF NOT EXISTS `glo_deposito_banco` (
  `id_mov_deposito` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `fecha_doc` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `monto` double NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `cuenta` varchar(40) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `id_cliente` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_deposito`),
  KEY `glo_banco_glo_deposito_banco_fk` (`id_banco`),
  KEY `vent_voucher_glo_deposito_banco_fk` (`id_voucher`),
  KEY `vent_cliente_glo_deposito_banco_fk` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_empresa`
--

CREATE TABLE IF NOT EXISTS `glo_empresa` (
  `id_empresa` varchar(22) NOT NULL,
  `razonsocial` varchar(80) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `direccionleg` varchar(80) NOT NULL,
  `direccionref` varchar(80) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `ruc` varchar(12) NOT NULL,
  `paginaweb` varchar(80) NOT NULL,
  `email` varchar(60) NOT NULL,
  `logo` varchar(80) NOT NULL,
  `siglas` varchar(30) NOT NULL,
  `rep_legal` varchar(100) NOT NULL,
  `nombre_anho` varchar(200) NOT NULL,
  `grado_reflegal` varchar(20) NOT NULL,
  `dni_replegal` varchar(10) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_empresa`
--

INSERT INTO `glo_empresa` (`id_empresa`, `razonsocial`, `descripcion`, `direccionleg`, `direccionref`, `telefono`, `celular`, `ruc`, `paginaweb`, `email`, `logo`, `siglas`, `rep_legal`, `nombre_anho`, `grado_reflegal`, `dni_replegal`) VALUES
('2013110300001', 'ASOC.EDUC.COLEGIO ADVENTISTA TUPAC AMARU', 'X', 'JR. MOQUEGUA NRO. 852 BARRIO TUPAC AMARU PUNO - SAN ROMAN - JULIACA', 'X', '951782520', '951782520', '20156630731', 'www.cata.upeu.pe', 'cata@gmail.com', 'X', 'C.A.T.A.', 'David Junion Mamani Astete', 'Dario Gonzales Mostajo', 'Doctor', '43631917');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_impresion_accesos`
--

CREATE TABLE IF NOT EXISTS `glo_impresion_accesos` (
  `id_impresion` varchar(22) NOT NULL,
  `id_impdoc` varchar(6) NOT NULL,
  `ip_impresion` varchar(30) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_impresion`),
  KEY `vent_ventas_impdoc_glo_impresion_accesos_fk` (`id_impdoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_impresion_usuario`
--

CREATE TABLE IF NOT EXISTS `glo_impresion_usuario` (
  `id_impresion_usuario` varchar(22) NOT NULL,
  `id_impresion` varchar(22) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  PRIMARY KEY (`id_impresion_usuario`),
  KEY `glo_impresion_accesos_glo_impresion_usuario_fk` (`id_impresion`),
  KEY `glo_persona_glo_impresion_usuario_fk` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_mediopago`
--

CREATE TABLE IF NOT EXISTS `glo_mediopago` (
  `id_mediopago` varchar(22) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_mediopago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_mediopago`
--

INSERT INTO `glo_mediopago` (`id_mediopago`, `codigo`, `descripcion`, `estado`) VALUES
('2013110500000001', '001', 'DEPÓSITO EN CUENTA', '1'),
('2013110500000002', '002', 'GIRO', '1'),
('2013110500000003', '003', 'TRANSFERENCIA DE FONDOS', '1'),
('2013110500000004', '004', 'ORDEN DE PAGO', '1'),
('2013110500000005', '005', 'TARJETA DE DÉBITO', '1'),
('2013110500000006', '006', 'TARJETA DE CRÉDITO', '1'),
('2013110500000007', '007', 'CHEQUES CON LA CLÁUSULA DE "NO NEGOCIABLE", "INTRANSFERIBLES", "NO A LA ORDEN" U OTRA EQUIVALENTE, A', '1'),
('2013110500000008', '008', 'EFECTIVO, POR OPERACIONES EN LAS QUE NO EXISTE OBLIGACIÓN DE UTILIZAR MEDIOS DE PAGO', '1'),
('2013110500000009', '009', 'EFECTIVO, EN LOS DEMÁS CASOS', '1'),
('2013110500000010', '010', 'MEDIOS DE PAGO DE COMERCIO EXTERIOR', '1'),
('2013110500000011', '011', 'LETRAS DE CAMBIO', '1'),
('2013110500000012', '101', 'TRANSFERENCIAS - COMERCIO EXTERIOR', '1'),
('2013110500000013', '102', 'CHEQUES BANCARIOS  - COMERCIO EXTERIOR', '1'),
('2013110500000014', '103', 'ORDEN DE PAGO SIMPLE  - COMERCIO EXTERIOR', '1'),
('2013110500000015', '104', 'ORDEN DE PAGO DOCUMENTARIO  - COMERCIO EXTERIOR', '1'),
('2013110500000016', '105', 'REMESA SIMPLE  - COMERCIO EXTERIOR', '1'),
('2013110500000017', '106', 'REMESA DOCUMENTARIA  - COMERCIO EXTERIOR', '1'),
('2013110500000018', '107', 'CARTA DE CRÉDITO SIMPLE  - COMERCIO EXTERIOR', '1'),
('2013110500000019', '108', 'CARTA DE CRÉDITO DOCUMENTARIO  - COMERCIO EXTERIOR', '1'),
('2013110500000020', '999', 'OTROS MEDIOS DE PAGO (ESPECIFICAR)', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_persona`
--

CREATE TABLE IF NOT EXISTS `glo_persona` (
  `id_persona` varchar(22) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `paterno` varchar(100) NOT NULL,
  `materno` varchar(22) NOT NULL,
  `id_tipoidentidad` varchar(22) NOT NULL,
  `dni` varchar(12) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `passwd` varchar(40) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `glo_tipoidentidad_glo_persona_fk` (`id_tipoidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_persona`
--

INSERT INTO `glo_persona` (`id_persona`, `nombres`, `paterno`, `materno`, `id_tipoidentidad`, `dni`, `usuario`, `passwd`, `telefono`, `estado`) VALUES
('20041056400001', 'David', 'Mamani', 'Pari', '2013110500410002', '43631917', 'davidmp', '123456', '951782520', '1'),
('2013110100400002', 'Elias', 'Mamani', 'Pari', '2013110500410002', '43631918', 'eliasmp', '123456', '951782520', '1'),
('2013110100400003', 'Darwin', 'Zuvieta', 'Ramos', '2013110500410002', '43617414', 'darwinzr', '123456', '95175444', '1'),
('2013110600400004', 'Jorge', 'Vallejos', 'Atalaya', '2013110500410002', '43631718', 'jorgev', '123456', '951782520', '1'),
('2013111800400005', 'Jose ', 'Limachi', 'Chavez', '20131105004100003', '46537040', 'josmarl', '123456', '345466', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_persona_empresa`
--

CREATE TABLE IF NOT EXISTS `glo_persona_empresa` (
  `id_persona_empresa` varchar(22) NOT NULL,
  `id_empresa` varchar(22) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  PRIMARY KEY (`id_persona_empresa`),
  KEY `glo_persona_glo_persona_empresa_fk` (`id_persona`),
  KEY `glo_empresa_glo_persona_empresa_fk` (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_tipoidentidad`
--

CREATE TABLE IF NOT EXISTS `glo_tipoidentidad` (
  `id_tipoidentidad` varchar(22) NOT NULL,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_tipoidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_tipoidentidad`
--

INSERT INTO `glo_tipoidentidad` (`id_tipoidentidad`, `codigo`, `descripcion`, `estado`) VALUES
('20131105004100003', '0', 'OTROS TIPOS DE DOCUMENTOS', '1'),
('20131105004100004', '4', 'CARNET DE EXTRANJERIA', '1'),
('20131105004100005', '6', 'REGISTRO ÚNICO DE CONTRIBUYENTES', '1'),
('20131105004100006', '7', 'PASAPORTE', '1'),
('2013110500410002', '1', 'DNI', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_tipomoneda`
--

CREATE TABLE IF NOT EXISTS `glo_tipomoneda` (
  `id_tipomoneda` varchar(22) NOT NULL,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_tipomoneda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_tipomoneda`
--

INSERT INTO `glo_tipomoneda` (`id_tipomoneda`, `codigo`, `descripcion`, `simbolo`, `estado`) VALUES
('2013110500000001', '1', 'Nuevo Soles', 'S/.', '1'),
('2013110500000002', '2', 'DÓLARES AMERICANOS', 'S/.', '1'),
('2013110500000003', '9', 'OTRA MONEDA (ESPECIFICAR)', 'S/.', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_tipooperacion`
--

CREATE TABLE IF NOT EXISTS `glo_tipooperacion` (
  `id_tipooperacion` varchar(22) NOT NULL,
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  PRIMARY KEY (`id_tipooperacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_tipooperacion`
--

INSERT INTO `glo_tipooperacion` (`id_tipooperacion`, `codigo`, `descripcion`) VALUES
('2013101104000001', '01', 'VENTA'),
('20131011040000010', '10', 'SALIDA A PRODUCCIÓN'),
('2013101104000002', '02', 'COMPRA'),
('2013101104000003', '03', 'CONSIGNACIÓN RECIBIDA'),
('2013101104000004', '04', 'CONSIGNACIÓN ENTREGADA'),
('2013101104000005', '05', 'DEVOLUCIÓN RECIBIDA'),
('2013101104000006', '06', 'DEVOLUCIÓN ENTREGADA'),
('2013101104000007', '07', 'PROMOCIÓN'),
('2013101104000008', '08', 'PREMIO'),
('2013101104000009', '09', 'DONACIÓN'),
('2013101104000011', '11', 'TRANSFERENCIA ENTRE ALMACENES'),
('2013101104000012', '12', 'RETIRO'),
('2013101104000013', '13', 'MERMAS'),
('2013101104000014', '14', 'DESMEDROS'),
('2013101104000015', '15', 'DESTRUCCIÓN'),
('2013101104000016', '16', 'SALDO INICIAL'),
('2013101104000017', '99', 'OTROS (ESPECIFICAR)');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_unidadmedida`
--

CREATE TABLE IF NOT EXISTS `glo_unidadmedida` (
  `id_unidadmedida` varchar(22) NOT NULL,
  `codigo` varchar(2) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_unidadmedida`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_unidadmedida`
--

INSERT INTO `glo_unidadmedida` (`id_unidadmedida`, `codigo`, `descripcion`, `estado`) VALUES
('2013101104000001', '07', 'Unidades', '1'),
('2013101104000002', '01', 'KILOGRAMOS', '1'),
('2013101104000003', '02', 'LIBRAS', '1'),
('2013101104000004', '03', 'TONELADAS LARGAS', '1'),
('2013101104000005', '04', 'TONELADAS MÉTRICAS', '1'),
('2013101104000006', '05', 'TONELADAS CORTAS', '1'),
('2013101104000007', '06', 'GRAMOS', '1'),
('2013101104000008', '08', 'LITROS', '1'),
('2013101104000009', '09', 'GALONES', '1'),
('2013101104000010', '10', 'BARRILES', '1'),
('2013101104000011', '11', 'LATAS', '1'),
('2013101104000012', '12', 'CAJAS', '1'),
('2013101104000013', '13', 'MILLARES', '1'),
('2013101104000014', '14', 'METROS CÚBICOS', '1'),
('2013101104000015', '15', 'METROS', '1'),
('2013101104000016', '99', 'OTROS (ESPECIFICAR)', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_vales`
--

CREATE TABLE IF NOT EXISTS `glo_vales` (
  `id_mov_vale` varchar(22) NOT NULL,
  `id_periodo` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `numvale` varchar(12) NOT NULL,
  `concepto` varchar(80) NOT NULL,
  `monto` double NOT NULL,
  `tipo_vale` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `fecha_devol` date NOT NULL,
  `observacion` varchar(100) NOT NULL,
  `id_trans_pag` varchar(22) NOT NULL,
  `id_module` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_egre` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_vale`),
  KEY `glo_voucher_repo_glo_vales_fk` (`id_voucher_repo`),
  KEY `pla_voucher_glo_vales_fk` (`id_voucher`),
  KEY `pla_trabajador_glo_vales_fk` (`id_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glo_voucher_repo`
--

CREATE TABLE IF NOT EXISTS `glo_voucher_repo` (
  `id_voucher_repo` varchar(22) NOT NULL,
  `voucher` varchar(12) NOT NULL,
  `libro` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `lote` varchar(30) NOT NULL,
  PRIMARY KEY (`id_voucher_repo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `glo_voucher_repo`
--

INSERT INTO `glo_voucher_repo` (`id_voucher_repo`, `voucher`, `libro`, `fecha`, `estado`, `id_nivel`, `lote`) VALUES
('1', '1', '1', '2013-11-18', '1', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_afpcomisiones`
--

CREATE TABLE IF NOT EXISTS `pla_afpcomisiones` (
  `id_afpcomisiones` varchar(22) NOT NULL,
  `id_afponp` varchar(22) NOT NULL,
  `id_tipocomision` varchar(22) NOT NULL,
  `modalidad` varchar(10) NOT NULL,
  `fondo` double NOT NULL,
  `seguro` double NOT NULL,
  `comision` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_afpcomisiones`),
  KEY `pla_tipocomision_pla_afpcomisiones_fk` (`id_tipocomision`),
  KEY `pla_afponp_pla_afpcomisiones_fk` (`id_afponp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_afponp`
--

CREATE TABLE IF NOT EXISTS `pla_afponp` (
  `id_afponp` varchar(22) NOT NULL,
  `nombre_afponp` varchar(80) NOT NULL,
  PRIMARY KEY (`id_afponp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pla_afponp`
--

INSERT INTO `pla_afponp` (`id_afponp`, `nombre_afponp`) VALUES
('1', 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_cargo`
--

CREATE TABLE IF NOT EXISTS `pla_cargo` (
  `id_cargo` varchar(22) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_area` varchar(22) NOT NULL,
  PRIMARY KEY (`id_cargo`),
  KEY `glo_area_pla_cargo_fk` (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_cheque`
--

CREATE TABLE IF NOT EXISTS `pla_cheque` (
  `id_mov_cheque` varchar(22) NOT NULL,
  `fecha_doc` date NOT NULL,
  `monto` double NOT NULL,
  `acreditado` varchar(80) NOT NULL,
  `monto_letra` varchar(150) NOT NULL,
  `reg_legal` varchar(150) NOT NULL,
  `numcheque` varchar(20) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `fecha_reg` date NOT NULL,
  `id_mov_planilla` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_cheque`),
  KEY `glo_banco_pla_cheque_fk` (`id_banco`),
  KEY `pla_voucher_pla_cheque_fk` (`id_voucher`),
  KEY `pla_planilla_registro_pla_cheque_fk` (`id_mov_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_criterio`
--

CREATE TABLE IF NOT EXISTS `pla_criterio` (
  `id_criterio` varchar(22) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `tipo` varchar(12) NOT NULL,
  `tipo_cantporcen` varchar(6) NOT NULL,
  `monto` double NOT NULL,
  `tipo_criterio` varchar(12) NOT NULL,
  PRIMARY KEY (`id_criterio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_cts`
--

CREATE TABLE IF NOT EXISTS `pla_cts` (
  `id_cts` varchar(22) NOT NULL,
  `monto` double NOT NULL,
  `detalle` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `modo_pago` varchar(20) NOT NULL,
  `id_mov_planilla` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_cts`),
  KEY `pla_planilla_registro_pla_cts_fk` (`id_mov_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_deposito_seguro`
--

CREATE TABLE IF NOT EXISTS `pla_deposito_seguro` (
  `id_dep_seguro` varchar(22) NOT NULL,
  `id_planilla` varchar(12) NOT NULL,
  `mes` varchar(20) NOT NULL,
  `fecha_dep` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `monto` double NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_egre` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_dep_seguro`),
  KEY `glo_voucher_repo_pla_deposito_seguro_fk` (`id_voucher_repo`),
  KEY `glo_banco_pla_deposito_seguro_fk` (`id_banco`),
  KEY `pla_main_pla_deposito_seguro_fk` (`id_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_efectivo`
--

CREATE TABLE IF NOT EXISTS `pla_efectivo` (
  `id_mov_efectivo` varchar(22) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `id_mov_planilla` varchar(22) NOT NULL,
  `id_liquidacion` varchar(22) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_efectivo`),
  KEY `glo_voucher_repo_pla_efectivo_fk` (`id_voucher_repo`),
  KEY `pla_planilla_registro_pla_efectivo_fk` (`id_mov_planilla`),
  KEY `pla_liquidacion_pla_efectivo_fk` (`id_liquidacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_egreso_depositos`
--

CREATE TABLE IF NOT EXISTS `pla_egreso_depositos` (
  `id_mov_deposito` varchar(22) NOT NULL,
  `monto` double NOT NULL,
  `fecha` date NOT NULL,
  `fecha_reg` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `cuenta` varchar(40) NOT NULL,
  `cuenta_titular` varchar(100) NOT NULL,
  `id_cts` varchar(22) NOT NULL,
  `banco` varchar(100) NOT NULL,
  `id_voucher_repo` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_deposito`),
  KEY `glo_voucher_repo_pla_egreso_depositos_fk` (`id_voucher_repo`),
  KEY `pla_cts_pla_egreso_depositos_fk` (`id_cts`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_ges_personal`
--

CREATE TABLE IF NOT EXISTS `pla_ges_personal` (
  `id_mov_dgp` varchar(22) NOT NULL,
  `detalle_dgp` varchar(100) NOT NULL,
  `justificacion` varchar(60) NOT NULL,
  `evaluacion` varchar(60) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_autorizacion` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `num_acuerdo` varchar(20) NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `id_planilla` varchar(12) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_dgp`),
  KEY `pla_main_pla_ges_personal_fk` (`id_planilla`),
  KEY `pla_trabajador_pla_ges_personal_fk` (`id_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_liquidacion`
--

CREATE TABLE IF NOT EXISTS `pla_liquidacion` (
  `id_liquidacion` varchar(22) NOT NULL,
  `id_mov_planilla` varchar(22) NOT NULL,
  `detalle` varchar(60) NOT NULL,
  `fecha` date NOT NULL,
  `monto` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `modo_pago` varchar(20) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_liquidacion`),
  KEY `pla_planilla_registro_pla_liquidacion_fk` (`id_mov_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_main`
--

CREATE TABLE IF NOT EXISTS `pla_main` (
  `id_planilla` varchar(12) NOT NULL,
  `periodo` varchar(12) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_parientes`
--

CREATE TABLE IF NOT EXISTS `pla_parientes` (
  `id_pariente` varchar(22) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `parentesco` varchar(20) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_pariente`),
  KEY `pla_trabajador_pla_parientes_fk` (`id_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_planilla_detalle`
--

CREATE TABLE IF NOT EXISTS `pla_planilla_detalle` (
  `id_mov_det` varchar(22) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `monto` double NOT NULL,
  `tipo_mov` varchar(12) DEFAULT NULL COMMENT '--ingreso, egresos o descuento',
  `estado` varchar(2) NOT NULL,
  `id_mov_planilla` varchar(22) NOT NULL,
  `tipo_criterio` varchar(12) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_det`),
  KEY `pla_planilla_registro_pla_planilla_detalle_fk` (`id_mov_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_planilla_registro`
--

CREATE TABLE IF NOT EXISTS `pla_planilla_registro` (
  `id_mov_planilla` varchar(22) NOT NULL,
  `fecha_doc` date NOT NULL,
  `mes_pago` varchar(12) NOT NULL,
  `ingresos` double NOT NULL,
  `descuento` double NOT NULL,
  `vliquido` double NOT NULL,
  `fecha_pago` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `modo_pago` varchar(20) NOT NULL,
  `cts` varchar(2) NOT NULL,
  `monto_essalud` double NOT NULL,
  `liquidacion` varchar(2) NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `id_planilla` varchar(12) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `afp_fondo` double NOT NULL,
  `afp_seguro` double NOT NULL,
  `afp_comision` double NOT NULL,
  PRIMARY KEY (`id_mov_planilla`),
  KEY `pla_main_pla_planilla_registro_fk` (`id_planilla`),
  KEY `pla_trabajador_pla_planilla_registro_fk` (`id_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_saldo_inicial`
--

CREATE TABLE IF NOT EXISTS `pla_saldo_inicial` (
  `id_mov_saldiv` varchar(22) NOT NULL,
  `id_planilla` varchar(12) NOT NULL,
  `id_apertura_periodo` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_saldiv`),
  KEY `pla_main_pla_saldo_inicial_fk` (`id_planilla`),
  KEY `glo_apertura_periodo_pla_saldo_inicial_fk` (`id_apertura_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_tipocomision`
--

CREATE TABLE IF NOT EXISTS `pla_tipocomision` (
  `id_tipocomision` varchar(22) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`id_tipocomision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pla_tipocomision`
--

INSERT INTO `pla_tipocomision` (`id_tipocomision`, `nombre`) VALUES
('1', 'x');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_trabajador`
--

CREATE TABLE IF NOT EXISTS `pla_trabajador` (
  `id_trabajador` varchar(22) NOT NULL,
  `codigo_essalud` varchar(30) NOT NULL,
  `codigo_cuss` varchar(30) NOT NULL,
  `aseguradora` varchar(20) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nivel` varchar(20) DEFAULT NULL COMMENT '--misionero, empleado, contratado',
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(12) NOT NULL,
  `celular` varchar(12) NOT NULL,
  `email` varchar(60) NOT NULL,
  `cuenta_cts` varchar(40) NOT NULL,
  `cuenta_sueldo` varchar(40) NOT NULL,
  `tipo_cuentasueldo` varchar(60) NOT NULL,
  `cuenta_aporte` varchar(40) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_cuenta_tra` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_afponp` varchar(22) NOT NULL,
  `id_tipocomision` varchar(22) NOT NULL,
  PRIMARY KEY (`id_trabajador`),
  KEY `pla_tipocomision_pla_trabajador_fk` (`id_tipocomision`),
  KEY `pla_afponp_pla_trabajador_fk` (`id_afponp`),
  KEY `glo_persona_pla_trabajador_fk` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pla_trabajador`
--

INSERT INTO `pla_trabajador` (`id_trabajador`, `codigo_essalud`, `codigo_cuss`, `aseguradora`, `codigo`, `nivel`, `direccion`, `telefono`, `celular`, `email`, `cuenta_cts`, `cuenta_sueldo`, `tipo_cuentasueldo`, `cuenta_aporte`, `id_persona`, `estado`, `id_cuenta_tra`, `id_cuenta`, `id_nivel`, `id_afponp`, `id_tipocomision`) VALUES
('1', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', 'x', '2013111800400005', '1', 'x', 'x', 'x', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_transferencia_banco`
--

CREATE TABLE IF NOT EXISTS `pla_transferencia_banco` (
  `id_mov_trans` varchar(22) NOT NULL,
  `id_mov_planilla` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `monto` double NOT NULL,
  `cuenta` varchar(40) NOT NULL,
  `cuenta_titular` varchar(100) NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_trans`),
  KEY `glo_banco_pla_transferencia_banco_fk` (`id_banco`),
  KEY `pla_planilla_registro_pla_transferencia_banco_fk` (`id_mov_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_transf_interna`
--

CREATE TABLE IF NOT EXISTS `pla_transf_interna` (
  `id_mov_tran` varchar(22) NOT NULL,
  `id_mov_vale` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `num_tran` varchar(12) NOT NULL,
  `monto` double NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `concepto` varchar(80) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_per` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_tran`),
  KEY `pla_voucher_pla_transf_inter_fk` (`id_voucher`),
  KEY `pla_trabajador_pla_transf_inter_fk` (`id_trabajador`),
  KEY `glo_vales_pla_transf_inter_fk` (`id_mov_vale`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_vitacora`
--

CREATE TABLE IF NOT EXISTS `pla_vitacora` (
  `id_vitacora` varchar(22) NOT NULL,
  `id_trabajador` varchar(22) NOT NULL,
  `id_planilla` varchar(12) NOT NULL,
  `id_cargo` varchar(22) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_termino` date NOT NULL,
  `grado` varchar(16) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `estado_civil` varchar(20) NOT NULL,
  `asignacion` varchar(6) NOT NULL,
  `num_hijos` int(11) NOT NULL,
  `religion` varchar(20) NOT NULL,
  `iglesia` varchar(100) NOT NULL,
  `bautizado` varchar(2) NOT NULL,
  `ant_penales` varchar(2) NOT NULL,
  `basico` double NOT NULL,
  `tipo_contrato` varchar(20) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_vitacora`),
  KEY `pla_cargo_pla_vitacora_fk` (`id_cargo`),
  KEY `pla_main_pla_vitacora_fk` (`id_planilla`),
  KEY `pla_trabajador_pla_vitacora_fk` (`id_trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pla_voucher`
--

CREATE TABLE IF NOT EXISTS `pla_voucher` (
  `id_voucher` varchar(22) NOT NULL,
  `id_planilla` varchar(12) NOT NULL,
  `voucher` varchar(12) NOT NULL,
  `libro` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_voucher`),
  KEY `pla_main_pla_voucher_fk` (`id_planilla`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_accesos`
--

CREATE TABLE IF NOT EXISTS `sys_accesos` (
  `id_accesos` varchar(22) NOT NULL,
  `nombre` varchar(22) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `codigo_seg` varchar(4) NOT NULL,
  `nro_orden` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_menu` varchar(22) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  PRIMARY KEY (`id_accesos`),
  KEY `sys_menu_sys_accesos_fk` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_accesos`
--

INSERT INTO `sys_accesos` (`id_accesos`, `nombre`, `descripcion`, `url`, `codigo_seg`, `nro_orden`, `estado`, `id_menu`, `imagen`) VALUES
('200410564000001', 'Adm. Menu', 'Manejo de Menues Dinamicos', '../MenuControlador?opc=6', 'X', 1, '1', '200410564000002', 'x'),
('200410564000002', 'Adm. Grupo', 'x', '../GrupoControlador?opc=6', 'X', 2, '1', '200410564000002', ''),
('200410564000003', 'Usuarios Modulos', 'Administracion de Usuarios para Todos los MÃƒÆ’Ã‚Â³dulos', '../UsuarioControlador?opc=6', 'X', 3, '1', '200410564000002', 'X'),
('200410564000004', 'Conf. Moneda', 'Configuracion de Monedas', '../TipoMonedaControlador?opc=6', 'X', 4, '1', '200410564000001', 'X'),
('200410564000005', 'Adm. Accesos', 'Gestion Accesos', '../AccesosControlador?opc=6', 'X', 3, '1', '200410564000001', 'X'),
('201307170400006', 'Ingreso Ventas', 'x', '../VentasControlador?opc=6', 'X', 6, '1', '2013071704000003', 'x'),
('2013071804000006', 'Adm. Perfil', 'X', '../PerfilesControlador?opc=6', 'X', 1, '1', '200410564000001', ''),
('2013081800000007', 'Ingreso Depositos', 'x', '../DepositosControlador?opc=6', 'X', 6, '1', '2013071704000003', 'x'),
('2013081800000008', 'Ing. Trans. Interna', 'x', '../TransferenciaIntControl?opc=6', 'X', 6, '1', '2013071704000003', 'x'),
('2013081800000010', 'Anular Operacion', 'x', '../AnularOperacion?opc=6', 'X', 6, '1', '2013071704000003', 'x'),
('2013081800000011', 'Registro Ventas (14.1)', 'x', '../ReportesVentasControlador?opc=6', 'X', 6, '1', '2013110104000007', 'x'),
('2013090404000007', 'Ingreso de Compras', 'ok', '../ComprasRegistroControlador?opc=2', 'X', 3, '1', '2013090404000004', 'Foto-0001.jpg'),
('2013090404000008', 'Cuentas por pagar', 'ok', '../ComprasRegistroControlador?opc=21	', 'X', 3, '1', '2013090404000004', 'Foto-0003.jpg'),
('2013090404000009', 'Administrar Compras', 'ok', '../ComprasRegistroControlador?opc=6', 'X', 3, '1', '2013090404000004', 'Foto-0007.jpg'),
('2013090404000010', 'Registro de compras', 'ok', '../ComprasRegistroControlador?opc=61', 'X', 3, '1', '2013090404000004', 'Foto-0008.jpg'),
('2013091004000011', 'Editar Proveedor', 'X', '../ProveedorControlador?opc=6', 'X', 3, '1', '2013090404000004', '05 Adorad.mp3'),
('2013091104000012', 'Estado de Cuenta', 'ok', '../ProveedorControlador?opc=61', 'X', 3, '1', '2013090404000004', '01-Gran SeÃ±or.mp3'),
('2013100904000013', 'Planilla de Movilidad', 'ok', '../ComprasRegistroControlador?opc=62', 'X', 3, '1', '2013090404000004', 'vacunos.xls'),
('2013100904000014', 'Vales', 'ok', '../ComprasRegistroControlador?opc=63', 'X', 3, '1', '2013090404000004', 'vacunos.xls'),
('2013100904000015', 'Voucher de Reposicion', 'ok', '../ComprasRegistroControlador?opc=64', 'X', 3, '1', '2013090404000004', 'vacunos.xls'),
('2013100904000016', 'Arqueo Caja', 'X', '../ArqueoControlador?opc=6', 'X', 6, '1', '2013071704000003', 'SS'),
('2013100904000017', 'Ingreso de Productos', 'X', '../ServiciosVariosControlador?opc=6', 'X', 6, '1', '2013071704000003', 'SS'),
('2013100904000018', 'Estado Cuenta', 'X', '../EstadoCuentaControlador?opc=6', 'X', 6, '1', '2013071704000003', 'SS'),
('2013101404000019', 'Reporte de Asientos', 'ok', '../ReportesControlador?opc=6', 'X', 3, '1', '2013090404000004', 'Plan Contable en Excel.xlsx'),
('2013101404000020', 'Conceptos', 'x', '../ConceptoControlador?opc=6', 'X', 4, '1', '2013090404000005', 'ss'),
('2013101404000021', 'Contrato Alumno', 'x', '../ContratoAlumnoControlador?opc=6', 'X', 4, '0', '2013090404000005', 'xs'),
('2013101404000022', 'Gestion de Cursos', 'x', '../CursoControlador?opc=6', 'X', 4, '1', '2013090404000005', 'x'),
('2013101404000023', 'Gestion Grados', 'x', '../GradoControlador?opc=6', 'X', 4, '1', '2013090404000005', 'x'),
('2013101404000024', 'Gestion Curso-Grado', 'x', '../CursoGradoControlador?opc=6', 'X', 4, '1', '2013090404000005', 'x'),
('2013101404000025', 'Gestion Nivel', 'x', '../NivelColegioControlador?opc=6', 'X', 4, '1', '2013090404000005', 'x'),
('2013102404000026', 'Adm. Privilegio', 'x', '../PrivilegiosControlador?opc=6', 'X', 9, '1', '200410564000001', 'imagen1.png'),
('2013103104000027', 'Adm. Elemento', 'x', '../ElementoControlador?opc=6', 'X', 1, '0', '2013103104000006', '2011-12-24 19.00.04.jpg'),
('2013103104000028', 'Adm. Cuenta Contable', 'Registro de cuentas', '../CuentaControlador?opc=6', 'X', 2, '1', '2013103104000006', '2011-12-24 19.00.04.jpg'),
('2013103104000029', 'Adm. Sub Cuenta', 'Registro de sub Cuentas', '../SubCuentaControlador?opc=6', 'X', 3, '1', '2013103104000006', '2011-12-24 18.58.48.jpg'),
('2013103104000030', 'Adm. Division', 'Registro de Divisiones Contables', '../DivisionControlador?opc=6', 'X', 4, '1', '2013103104000006', '2011-12-24 19.00.59.jpg'),
('2013103104000031', 'Adm. Sub. Divisiones', 'Registro de Sub Divisiones contables', '../SubdivCuentaControlador?opc=6', 'X', 5, '1', '2013103104000006', '2011-12-24 19.00.39.jpg'),
('2013103104000032', 'Adm. Nivel', 'Nivel de Areas de una Institucion', '../NivelControlador?opc=6', 'X', 6, '1', '2013103104000006', '2011-12-24 19.00.04.jpg'),
('2013103104000033', 'Adm. Sub. Nivel', 'Administrar SubNiveles', '../SubNivelControlador?opc=6', 'X', 7, '1', '2013103104000006', '2011-12-24 19.00.59.jpg'),
('2013103104000034', 'Adm. Div. Niveles', 'Registro de Divsiones de Niveles', '../DivNivelControlador?opc=6', 'X', 8, '1', '2013103104000006', '2011-12-24 19.00.59.jpg'),
('2013110104000035', 'Reg. Persona', 'Registro de Personas', '../PersonaControlador?opc=6', 'X', 9, '1', '200410564000002', '2011-12-04 20.16.03.jpg'),
('2013110504000036', 'Conf. Banco', 'Administrar Bancos', '../BancoControlador?opc=6', 'X', 10, '1', '200410564000001', '2011-12-24 18.57.57.jpg'),
('2013110504000037', 'Conf. Conprobante', 'Administra Comprobantes', '../ComprobanteControlador?opc=6', 'X', 11, '1', '200410564000001', '2011-12-04 20.16.03.jpg'),
('2013110504000038', 'Conf. Empresa', 'Configuracion de la Empresa.', '../EmpresaControlador?opc=6', 'X', 12, '1', '200410564000001', '2011-12-04 20.16.03.jpg'),
('2013110504000039', 'Conf. Medio. Pago', 'Configurar Medios de Pago', '../MedioPagoControlador?opc=6', 'X', 13, '1', '200410564000001', '2011-12-24 19.00.39.jpg'),
('2013110504000040', 'Conf. Tipo Identidad', 'Configurar Documentos de Identidad', '../TipoIdentidadControlador?opc=6', 'X', 14, '1', '200410564000001', '2011-12-24 19.00.04.jpg'),
('2013110504000041', 'Conf. Tipo Operacion', 'Configurar Tipos de Operacion', '../TipoOperacionControlador?opc=6', 'X', 15, '1', '200410564000001', '2011-12-04 20.16.03.jpg'),
('2013110504000042', 'Conf. Unidad Medida', 'Confurar las unidades de medida.', '../UnidadMedidaControlador?opc=6', 'X', 16, '1', '200410564000001', '2011-12-24 19.00.04.jpg'),
('2013110604000043', 'Matricula Financiera', 'x', '../MatriculaControlador?opc=6', 'X', 1, '1', '2013090404000005', '2011-12-04 20.16.03.jpg'),
('2013110604000044', 'Importar Compras', 'x', '../ImportarComprasControlador?opc=6', 'x', 1, '1', '2013120504000008', '2011-12-24 18.58.48.jpg'),
('2013110604000045', 'Impor. Pagos Efectivo', 'x', '../ImportarPagosEfectivoControlador?opc=6', 'X', 1, '1', '2013120504000008', '2011-12-24 18.57.57.jpg'),
('2013110604000046', 'Import. Ventas', 'x', '../ImportarVentasControlador?opc=6', 'X', 1, '1', '2013120504000008', '2011-12-24 19.00.39.jpg'),
('2013110604000047', 'Libro. Diario', 'x', '../LibroDiarioControlador?opc=6', 'X', 1, '1', '2013103104000006', '2011-12-24 19.00.39.jpg'),
('2013110604000048', 'Libro Mayor', 'x', '../ReportesContabilidadControlador?opc=21', 'X', 1, '1', '2013103104000006', '2011-12-24 19.00.39.jpg'),
('2013110604000049', 'Reporte Contabilidad', 'x', '../ReportesContabilidadControlador?opc=6', 'X', 1, '1', '2013103104000006', '2011-12-24 19.00.39.jpg'),
('2013111004000050', 'Criterio Cobro', 'x', '../ContratoAlumnoCriterioControlador?opc=6', 'X', 1, '1', '2013090404000005', '2011-12-04 20.16.03.jpg'),
('2013111104000051', 'Detalle Criterio Cobro', 'x', '../ContratoCriterioDetalleControlador?opc=6', 'X', 3, '1', '2013090404000005', '2011-12-24 18.57.57.jpg'),
('2013111104000052', 'Reg. Cliente', 'x', '../ClienteControlador?opc=6', 'X', 1, '1', '2013071704000003', '2011-12-24 18.57.57.jpg'),
('2013111304000053', 'Aper. Periodo Vacional', 'X', '../PeriodoVacacionalControlador?opc=6', 'X', 2, '1', '2013071704000003', '2011-12-04 20.16.03.jpg'),
('2013111304000054', 'Reg. Taller Vacacional', 'X', '../ServicioEducacionControlador?opc=6', 'X', 14, '1', '2013071704000003', '2011-12-24 19.00.04.jpg'),
('2013111304000055', 'Reporte Transferencia', 'x', '../ReporteTransfInternaControlador?opc=6', 'X', 3, '1', '2013071704000003', '2011-12-24 19.00.04.jpg'),
('2013111304000056', 'Asientos Pendientes', 'x', '../LibroDiarioControlador?opc=62', 'X', 3, '1', '2013103104000006', '2011-12-04 20.16.03.jpg'),
('2013112104000057', 'Balance Gen.', 'ok', '../ReportesContabilidadControlador?opc=61', 'X', 1, '1', '2013103104000006', 'acuerdos.docx'),
('2013112504000058', 'Cobrar Cuota', 'x', '../CobrarCuotaControlador?opc=6', 'X', 1, '1', '2013090404000005', 'developlogo.png'),
('2013120504000059', 'Importar Transfer Int.', 'x', '../ImportarTransInternaControlador?opc=6', 'X', 54, '1', '2013120504000008', 'DSC00724.JPG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_accesos_perfiles`
--

CREATE TABLE IF NOT EXISTS `sys_accesos_perfiles` (
  `id_accesos_perfiles` varchar(22) NOT NULL,
  `id_accesos` varchar(22) NOT NULL,
  `id_perfil` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_accesos_perfiles`),
  KEY `sys_perfiles_sys_accesos_perfiles_fk` (`id_perfil`),
  KEY `sys_accesos_sys_accesos_perfiles_fk` (`id_accesos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_detalle_sessiones`
--

CREATE TABLE IF NOT EXISTS `sys_detalle_sessiones` (
  `id_detalle_sessiones` varchar(22) NOT NULL,
  `id_sessiones` varchar(22) NOT NULL,
  `detalle` varchar(2000) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_detalle_sessiones`),
  KEY `sys_sessiones_sys_detalle_sessiones_fk` (`id_sessiones`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_grupo`
--

CREATE TABLE IF NOT EXISTS `sys_grupo` (
  `id_grupo` varchar(22) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `etiqueta` varchar(3) NOT NULL,
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_grupo`
--

INSERT INTO `sys_grupo` (`id_grupo`, `nombre`, `etiqueta`) VALUES
('200410564000001', 'Ventas', 'VE'),
('200410564000002', 'Compras', 'CO'),
('200410564000003', 'Planillas', 'PL'),
('200410564000004', 'Contabilidad', 'CT'),
('200410564000005', 'Matricula', 'MA'),
('200410564000006', 'Setup', 'SE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_menu`
--

CREATE TABLE IF NOT EXISTS `sys_menu` (
  `id_menu` varchar(22) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `etiqueta` varchar(3) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_grupo` varchar(22) NOT NULL,
  PRIMARY KEY (`id_menu`),
  KEY `sys_grupo_sys_menu_fk` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_menu`
--

INSERT INTO `sys_menu` (`id_menu`, `nombre`, `etiqueta`, `estado`, `id_grupo`) VALUES
('200410564000001', 'Configuracion', 'CF', '0', '200410564000006'),
('200410564000002', 'Administrar', 'AD', '1', '200410564000006'),
('2013071704000003', 'Ventas', 'VE', '1', '200410564000001'),
('2013090404000004', 'Compras', 'CO', '1', '200410564000002'),
('2013090404000005', 'Matriculas', 'MA', '1', '200410564000005'),
('2013103104000006', 'Contabilidad', 'CT', '0', '200410564000004'),
('2013110104000007', 'Reportes', 'V2', '1', '200410564000001'),
('2013120504000008', 'Administrar', 'CA', '1', '200410564000004');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_perfiles`
--

CREATE TABLE IF NOT EXISTS `sys_perfiles` (
  `id_perfil` varchar(22) NOT NULL,
  `nombre` varchar(70) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `codigo` varchar(3) DEFAULT NULL COMMENT '--1 Super--2 Administra--3 en adelante Restringido.',
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_perfiles`
--

INSERT INTO `sys_perfiles` (`id_perfil`, `nombre`, `descripcion`, `estado`, `codigo`) VALUES
('20041056400001', 'Administrador', 'Tiene Todo los Accesos Asignados', '1', '2'),
('20041056400002', 'Contabilidad', 'Tienes solo los Accesos Habilitados', '1', '3'),
('20041056400003', 'Super Administrador', 'Tiene Todo. Absolutamente todo.', '1', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_perfiles_crud`
--

CREATE TABLE IF NOT EXISTS `sys_perfiles_crud` (
  `id_perfiles_crud` varchar(22) NOT NULL,
  `id_perfil` varchar(22) NOT NULL,
  `descripcion` varchar(60) NOT NULL,
  `etiqueta` varchar(2) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_perfiles_crud`),
  KEY `sys_perfiles_sys_perfiles_crud_fk` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_perfiles_crud`
--

INSERT INTO `sys_perfiles_crud` (`id_perfiles_crud`, `id_perfil`, `descripcion`, `etiqueta`, `estado`) VALUES
('20041056400001', '20041056400002', 'Modificar', 'U', '1'),
('20041056400002', '20041056400002', 'Crear', 'C', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_privilegios`
--

CREATE TABLE IF NOT EXISTS `sys_privilegios` (
  `id_privilegio` varchar(22) NOT NULL,
  `id_accesos` varchar(22) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_usuario` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_privilegio`),
  KEY `sys_usuario_sys_privilegios_fk` (`id_usuario`),
  KEY `sys_accesos_sys_privilegios_fk` (`id_accesos`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_privilegios`
--

INSERT INTO `sys_privilegios` (`id_privilegio`, `id_accesos`, `fecha_alta`, `estado`, `id_usuario`, `ip`, `id_personal_user`) VALUES
('2013103100000001', '2013100904000017', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000002', '2013081800000010', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000003', '2013081800000007', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000004', '2013100904000018', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000005', '2013081800000011', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000006', '2013081800000008', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000007', '2013100904000016', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000009', '201307170400006', '2013-10-31 00:00:00', '1', '2013103100400002', 'X', '20041056400001'),
('2013103100000010', '2013091104000012', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000011', '2013090404000009', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000012', '2013101404000019', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000013', '2013100904000013', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000014', '2013090404000010', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000015', '2013090404000007', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000016', '2013100904000014', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000017', '2013091004000011', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000018', '2013090404000008', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000019', '2013100904000015', '2013-10-31 00:00:00', '0', '2013103100400003', 'X', '20041056400001'),
('2013103100000020', '2013101404000025', '2013-10-31 00:00:00', '1', '2013103100400005', 'X', '20041056400001'),
('2013103100000021', '2013101404000022', '2013-10-31 00:00:00', '1', '2013103100400005', 'X', '20041056400001'),
('2013103100000022', '2013101404000023', '2013-10-31 00:00:00', '1', '2013103100400005', 'X', '20041056400001'),
('2013103100000023', '2013101404000020', '2013-10-31 00:00:00', '1', '2013103100400005', 'X', '20041056400001'),
('2013103100000024', '2013101404000024', '2013-10-31 00:00:00', '1', '2013103100400005', 'X', '20041056400001'),
('2013103100000025', '2013101404000021', '2013-10-31 00:00:00', '1', '2013103100400005', 'X', '20041056400001'),
('2013103100000026', '2013103104000027', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000027', '2013103104000028', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000028', '2013103104000029', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000029', '2013103104000030', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000030', '2013103104000031', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000031', '2013103104000032', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000032', '2013103104000033', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013103100000033', '2013103104000034', '2013-10-31 00:00:00', '1', '2013103100400004', 'X', '20041056400001'),
('2013110100000034', '201307170400006', '2013-11-01 00:00:00', '1', '2013110100400006', 'X', '20041056400001'),
('2013110100000035', '2013100904000018', '2013-11-01 00:00:00', '1', '2013110100400006', 'X', '20041056400001'),
('2013110100000036', '2013081800000011', '2013-11-01 00:00:00', '0', '2013110100400006', 'X', '20041056400001'),
('2013110100000037', '2013110104000035', '2013-11-01 00:00:00', '1', '2013110100400007', 'X', '20041056400001'),
('2013110300000038', '2013081800000011', '2013-11-03 00:00:00', '1', '2013103100400003', 'X', '20041056400001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_sessiones`
--

CREATE TABLE IF NOT EXISTS `sys_sessiones` (
  `id_sessiones` varchar(22) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_sessiones`),
  KEY `glo_persona_sys_sessiones1_fk` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sys_usuario`
--

CREATE TABLE IF NOT EXISTS `sys_usuario` (
  `id_usuario` varchar(22) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `fecha_acceso` datetime NOT NULL,
  `ip` varchar(60) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  `id_grupo` varchar(22) NOT NULL,
  `id_perfil` varchar(22) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `sys_grupo_sys_usuario_fk` (`id_grupo`),
  KEY `glo_persona_sys_usuario_fk` (`id_persona`),
  KEY `sys_perfiles_sys_usuario_fk` (`id_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sys_usuario`
--

INSERT INTO `sys_usuario` (`id_usuario`, `fecha_alta`, `fecha_acceso`, `ip`, `estado`, `id_persona`, `id_grupo`, `id_perfil`) VALUES
('20041056400001', '2013-10-30 00:00:00', '2013-12-31 00:00:00', '192.168.30.1', '1', '20041056400001', '200410564000006', '20041056400003'),
('2013103100400002', '2013-10-31 00:00:00', '2013-12-30 00:00:00', 'X', '1', '20041056400001', '200410564000001', '20041056400003'),
('2013103100400003', '2013-10-31 00:00:00', '2013-12-30 00:00:00', 'X', '1', '20041056400001', '200410564000002', '20041056400003'),
('2013103100400004', '2013-10-31 00:00:00', '2013-12-30 00:00:00', 'X', '1', '20041056400001', '200410564000004', '20041056400003'),
('2013103100400005', '2013-10-31 00:00:00', '2013-12-30 00:00:00', 'X', '1', '20041056400001', '200410564000005', '20041056400003'),
('2013110100400006', '2013-11-01 00:00:00', '2013-12-31 00:00:00', 'X', '1', '2013110100400003', '200410564000001', '20041056400002'),
('2013110100400007', '2013-11-01 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110100400003', '200410564000006', '20041056400002'),
('2013110600400008', '2013-11-06 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110600400004', '200410564000006', '20041056400003'),
('2013110600400009', '2013-11-06 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110600400004', '200410564000001', '20041056400003'),
('2013110600400010', '2013-11-06 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110600400004', '200410564000002', '20041056400003'),
('2013110600400011', '2013-11-06 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110600400004', '200410564000003', '20041056400003'),
('2013110600400012', '2013-11-06 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110600400004', '200410564000004', '20041056400003'),
('2013110600400013', '2013-11-06 00:00:00', '2013-12-30 00:00:00', 'X', '1', '2013110600400004', '200410564000005', '20041056400003'),
('2013111300400014', '2013-11-13 00:00:00', '2013-12-30 00:00:00', 'X', '1', '20041056400001', '200410564000003', '20041056400003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_carrito_venta`
--

CREATE TABLE IF NOT EXISTS `vent_carrito_venta` (
  `id_mov_carrito` varchar(22) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `id_mov_serv` varchar(22) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unit` double NOT NULL,
  `id_cliente` varchar(22) DEFAULT NULL,
  `descripcion` varchar(150) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`id_mov_carrito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_cheques`
--

CREATE TABLE IF NOT EXISTS `vent_cheques` (
  `id_mov_cheque` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_mov_vnt` varchar(22) NOT NULL,
  `fecha_doc` date NOT NULL,
  `monto` double NOT NULL,
  `num_cheque` varchar(12) NOT NULL,
  `id_cliente` varchar(22) NOT NULL,
  `rep_legal` varchar(100) NOT NULL,
  `banco` varchar(100) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `fecha_reg` date NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_cli` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_cheque`),
  KEY `vent_voucher_vent_cheques_fk` (`id_voucher`),
  KEY `vent_cliente_vent_cheques_fk` (`id_cliente`),
  KEY `vent_ventas_registro_vent_cheques_fk` (`id_mov_vnt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_cliente`
--

CREATE TABLE IF NOT EXISTS `vent_cliente` (
  `id_cliente` varchar(22) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `paterno` varchar(60) NOT NULL,
  `materno` varchar(60) NOT NULL,
  `tipo_cliente` varchar(20) NOT NULL,
  `ruc` varchar(12) NOT NULL,
  `numdoc_ident` varchar(20) NOT NULL,
  `codigo` varchar(12) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_tipoidentidad` varchar(22) NOT NULL,
  `aca_telefono` varchar(30) NOT NULL,
  `aca_direccion` varchar(80) NOT NULL,
  `aca_nivel` varchar(22) NOT NULL,
  `aca_grado` varchar(22) NOT NULL,
  `aca_seccion` varchar(22) NOT NULL,
  `aca_codigo_mod` varchar(60) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `glo_tipoidentidad_vent_cliente_fk` (`id_tipoidentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_cliente`
--

INSERT INTO `vent_cliente` (`id_cliente`, `nombre`, `paterno`, `materno`, `tipo_cliente`, `ruc`, `numdoc_ident`, `codigo`, `fecha_nacimiento`, `id_tipoidentidad`, `aca_telefono`, `aca_direccion`, `aca_nivel`, `aca_grado`, `aca_seccion`, `aca_codigo_mod`) VALUES
('2013110300001', 'General', 'General', 'General', 'GE', 'xxx', '43631917', '200410564', '2013-11-02', '2013110500410002', '951782520', 'x', 'Inicial', '4 Años', 'nuveo', 'X'),
('2013110300002', 'David Ñieto', 'Mamani', 'Pari', 'Nu', 'xxx', '4361917', '200410565', '2013-02-02', '2013110500410002', '9517254110', 'x', 'Primaria', 'Primero', 'nuveo', 'X');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_depositos`
--

CREATE TABLE IF NOT EXISTS `vent_depositos` (
  `id_mov_deposito` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `serie` varchar(10) NOT NULL,
  `numdoc` varchar(12) NOT NULL,
  `fecha` date NOT NULL,
  `glosa` varchar(200) NOT NULL,
  `importe` double NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_cliente` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_mov_vnt` varchar(22) DEFAULT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_cli` varchar(16) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_deposito`),
  KEY `vent_voucher_vent_depositos_fk` (`id_voucher`),
  KEY `vent_cliente_vent_depositos_fk` (`id_cliente`),
  KEY `vent_ventas_registro_vent_depositos_fk` (`id_mov_vnt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_depositos`
--

INSERT INTO `vent_depositos` (`id_mov_deposito`, `id_venta`, `serie`, `numdoc`, `fecha`, `glosa`, `importe`, `ip`, `id_personal_user`, `estado`, `id_cliente`, `id_voucher`, `id_mov_vnt`, `id_nivel`, `id_cuenta_cli`, `id_cuenta`) VALUES
('D201312050000001', '001-2013', '001', '29', '2013-12-05', 'ventas*Vellejos Atalaya Jorge*dni*43631917', 36.5, '0.0.0.0', '20041056400001', '1', '2013110300001', '2013120500000002', 'V201312050000001', '101', '12121', 's');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_impdoc_data`
--

CREATE TABLE IF NOT EXISTS `vent_impdoc_data` (
  `id_impdoc_data` varchar(6) NOT NULL,
  `id_impdoc` varchar(6) NOT NULL,
  `modo` varchar(12) NOT NULL,
  `contenido` varchar(100) NOT NULL,
  `posx` int(11) NOT NULL,
  `posy` int(11) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  PRIMARY KEY (`id_impdoc_data`),
  KEY `vent_ventas_impdoc_vent_impdoc_data_fk` (`id_impdoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_main`
--

CREATE TABLE IF NOT EXISTS `vent_main` (
  `id_mov_main` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `id_cuenta_cliente` varchar(22) NOT NULL,
  `id_cuenta_igv` varchar(22) NOT NULL,
  `id_cuentax_cobrar` varchar(22) NOT NULL,
  `id_cuenta_caja` varchar(22) NOT NULL,
  `id_cuanta_otro` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_main`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_main`
--

INSERT INTO `vent_main` (`id_mov_main`, `id_venta`, `id_cuenta_cliente`, `id_cuenta_igv`, `id_cuentax_cobrar`, `id_cuenta_caja`, `id_cuanta_otro`) VALUES
('201311030001', '001-2013', '12121', '40111', '12121', '10111', '42145');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_notas`
--

CREATE TABLE IF NOT EXISTS `vent_notas` (
  `id_mov_not` varchar(22) NOT NULL,
  `fecha_doc` date NOT NULL,
  `serie` varchar(6) NOT NULL,
  `numnot` varchar(12) NOT NULL,
  `glosa` varchar(80) NOT NULL,
  `dc` varchar(2) NOT NULL,
  `importe` double NOT NULL,
  `igv` double NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_mov_vnt` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_tipooperacion` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_igv` varchar(16) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_cli` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_not`),
  KEY `vent_voucher_vent_notas_fk` (`id_voucher`),
  KEY `glo_tipooperacion_vent_notas_fk` (`id_tipooperacion`),
  KEY `vent_ventas_registro_vent_notas_fk` (`id_mov_vnt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_periodo_vaca`
--

CREATE TABLE IF NOT EXISTS `vent_periodo_vaca` (
  `id_periodo_vaca` varchar(22) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `periodo` varchar(16) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `tipo_periodo` varchar(12) NOT NULL,
  PRIMARY KEY (`id_periodo_vaca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_periodo_vaca`
--

INSERT INTO `vent_periodo_vaca` (`id_periodo_vaca`, `descripcion`, `periodo`, `estado`, `tipo_periodo`) VALUES
('2013111300000001', 'Verano 2014', '2014-1', '1', 'Verano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_saldo_inicial`
--

CREATE TABLE IF NOT EXISTS `vent_saldo_inicial` (
  `id_mov_sal_ini` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `id_apertura_periodo` varchar(22) NOT NULL,
  `id_personal` varchar(22) NOT NULL,
  `glosa` varchar(80) NOT NULL,
  `importe` double NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `fecha` date NOT NULL,
  `cuenta` varchar(22) NOT NULL,
  `nivel` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_sal_ini`),
  KEY `glo_apertura_periodo_vent_saldo_inicial_fk` (`id_apertura_periodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_servicios_varios`
--

CREATE TABLE IF NOT EXISTS `vent_servicios_varios` (
  `id_mov_serv` varchar(22) NOT NULL,
  `codigo` varchar(16) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `tipo` varchar(2) DEFAULT NULL COMMENT 'RE=Regular, VA=Vacacional, GE=General',
  `tipo_trans` varchar(2) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) DEFAULT NULL,
  `id_cuenta` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`id_mov_serv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_servicios_varios`
--

INSERT INTO `vent_servicios_varios` (`id_mov_serv`, `codigo`, `descripcion`, `precio`, `cantidad`, `tipo`, `tipo_trans`, `estado`, `id_nivel`, `id_cuenta`) VALUES
('G201311030000001', '00', 'Agendas', 20, 100, 'GE', 'A', '1', '101', '10111'),
('G201311050000002', '00', 'Mochila', 16.5, 100, 'GE', 'A', '1', '101', '10111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_servicio_educacion`
--

CREATE TABLE IF NOT EXISTS `vent_servicio_educacion` (
  `id_mov_seredu` varchar(22) NOT NULL,
  `codigo` varchar(16) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `precio` double NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `tipo` varchar(2) NOT NULL,
  `id_periodo_vaca` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_seredu`),
  KEY `vent_periodo_vaca_vent_servicio_educacion_fk` (`id_periodo_vaca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_servicio_educacion`
--

INSERT INTO `vent_servicio_educacion` (`id_mov_seredu`, `codigo`, `descripcion`, `precio`, `cantidad`, `estado`, `id_nivel`, `id_cuenta`, `tipo`, `id_periodo_vaca`) VALUES
('V201311130000001', '001', 'Taller de Guitarra', 130, 111, '1', '105', '10111', 'VA', '2013111300000001'),
('V201311133000000', '001', 'Matricula 2014-1-Vacional', 50, 111, '1', '102', '10111', 'VA', '2013111300000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_transferencia_int`
--

CREATE TABLE IF NOT EXISTS `vent_transferencia_int` (
  `id_mov_trans` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `serie` varchar(6) NOT NULL,
  `numtran` varchar(12) NOT NULL,
  `fecha` date NOT NULL,
  `glosa` varchar(60) NOT NULL,
  `importe` double NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `dc` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_gasto` varchar(16) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_mov_vnt` varchar(22) DEFAULT NULL,
  `id_cliente` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_trans`),
  KEY `vent_voucher_vent_transferencia_int_fk` (`id_voucher`),
  KEY `vent_cliente_vent_transferencia_int_fk` (`id_cliente`),
  KEY `vent_ventas_registro_vent_transferencia_int_fk` (`id_mov_vnt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_transf_banco`
--

CREATE TABLE IF NOT EXISTS `vent_transf_banco` (
  `id_mov_tranf` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `id_cliente` varchar(22) NOT NULL,
  `cuenta` varchar(40) NOT NULL,
  `monto` double NOT NULL,
  `fecha_doc` date NOT NULL,
  `num_doc` varchar(12) NOT NULL,
  `id_banco` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta` varchar(22) NOT NULL,
  `id_cuenta_cli` varchar(22) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_personal_user` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_tranf`),
  KEY `glo_banco_vent_transf_banco_fk` (`id_banco`),
  KEY `vent_voucher_vent_transf_banco_fk` (`id_voucher`),
  KEY `vent_cliente_vent_transf_banco_fk` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_ventas_impdoc`
--

CREATE TABLE IF NOT EXISTS `vent_ventas_impdoc` (
  `id_impdoc` varchar(6) NOT NULL,
  `serie` varchar(6) NOT NULL,
  `contador` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `documento` varchar(30) NOT NULL,
  `tipo_doc` varchar(22) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_impdoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_ventas_impdoc`
--

INSERT INTO `vent_ventas_impdoc` (`id_impdoc`, `serie`, `contador`, `nombre`, `documento`, `tipo_doc`, `fecha`, `estado`) VALUES
('deposi', '001', 29, 'Cata Deposito', 'Tiket', '12', '2013-11-03', '1'),
('transi', '001', 6, 'Transferencia', 'Tiket', '12', '2013-11-03', '1'),
('ventas', '001', 25, 'Cata Ventas', 'Tiket', '12', '2013-11-03', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_ventas_registro`
--

CREATE TABLE IF NOT EXISTS `vent_ventas_registro` (
  `id_mov_vnt` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `tipo_venta` varchar(6) NOT NULL,
  `fecha_doc` datetime NOT NULL,
  `fecha_venc` date NOT NULL,
  `serie` varchar(10) NOT NULL,
  `numvnt` varchar(12) NOT NULL,
  `export_importe` double NOT NULL,
  `glosa` varchar(80) NOT NULL,
  `base_imp` double NOT NULL,
  `igv` double NOT NULL,
  `exonerados` double NOT NULL,
  `inafectos` double NOT NULL,
  `isc` double NOT NULL,
  `importe` double NOT NULL,
  `tipo_cambio` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `ip` varchar(30) NOT NULL,
  `id_persona` varchar(22) NOT NULL,
  `id_voucher` varchar(22) NOT NULL,
  `id_comprobante` varchar(22) NOT NULL,
  `id_tipooperacion` varchar(22) NOT NULL,
  `id_tipomoneda` varchar(22) NOT NULL,
  `id_cliente` varchar(22) NOT NULL,
  `mod_fecha` date NOT NULL,
  `mod_tipo` varchar(6) NOT NULL,
  `mod_serie` varchar(10) NOT NULL,
  `mod_numdoc` varchar(12) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_vnt` varchar(22) NOT NULL,
  `id_cuenta_cli` varchar(22) NOT NULL,
  `id_cuenta_igv` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_vnt`),
  KEY `vent_voucher_vent_ventas_registro_fk` (`id_voucher`),
  KEY `glo_comprobante_vent_ventas_registro_fk` (`id_comprobante`),
  KEY `glo_tipomoneda_vent_ventas_registro_fk` (`id_tipomoneda`),
  KEY `glo_tipooperacion_vent_ventas_registro_fk` (`id_tipooperacion`),
  KEY `vent_cliente_vent_ventas_registro_fk` (`id_cliente`),
  KEY `glo_persona_vent_ventas_registro_fk` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_ventas_registro`
--

INSERT INTO `vent_ventas_registro` (`id_mov_vnt`, `id_venta`, `tipo_venta`, `fecha_doc`, `fecha_venc`, `serie`, `numvnt`, `export_importe`, `glosa`, `base_imp`, `igv`, `exonerados`, `inafectos`, `isc`, `importe`, `tipo_cambio`, `estado`, `ip`, `id_persona`, `id_voucher`, `id_comprobante`, `id_tipooperacion`, `id_tipomoneda`, `id_cliente`, `mod_fecha`, `mod_tipo`, `mod_serie`, `mod_numdoc`, `id_nivel`, `id_cuenta_vnt`, `id_cuenta_cli`, `id_cuenta_igv`) VALUES
('V201312050000001', '001-2013', 'con', '2013-12-05 12:27:53', '2013-12-05', '001', '25', 0, 'ventas*Vellejos Atalaya Jorge*dni*43631917', 29.93, 6.569999999999999, 0, 0, 0, 36.5, 0, 'V', '0.0.0.0', '20041056400001', '2013120500000001', '2013110500000014', '2013101104000001', '2013110500000001', '2013110300001', '2013-12-05', '', '', '', '101', '12121', '12121', '40111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_venta_detalle`
--

CREATE TABLE IF NOT EXISTS `vent_venta_detalle` (
  `id_mov_det` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `id_mov_vnt` varchar(22) NOT NULL,
  `dc` varchar(2) NOT NULL,
  `detalle` varchar(80) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `base_imp` double NOT NULL,
  `igv` double NOT NULL,
  `importe` double NOT NULL,
  `estado` varchar(2) NOT NULL,
  `id_unidadmedida` varchar(22) NOT NULL,
  `id_nivel` varchar(22) NOT NULL,
  `id_cuenta_vnt` varchar(22) NOT NULL,
  PRIMARY KEY (`id_mov_det`),
  KEY `glo_unidadmedida_vent_venta_detalle_fk` (`id_unidadmedida`),
  KEY `vent_ventas_registro_vent_venta_detalle_fk` (`id_mov_vnt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_venta_detalle`
--

INSERT INTO `vent_venta_detalle` (`id_mov_det`, `id_venta`, `id_mov_vnt`, `dc`, `detalle`, `cantidad`, `base_imp`, `igv`, `importe`, `estado`, `id_unidadmedida`, `id_nivel`, `id_cuenta_vnt`) VALUES
('2013120500000001', '001-2013', 'V201312050000001', 'A', 'Mochila', 1, 13.530000000000001, 2.9699999999999998, 16.5, 'V', '2013101104000001', '101', '10111'),
('2013120500000002', '001-2013', 'V201312050000001', 'A', 'Agendas', 1, 16.4, 3.5999999999999996, 20, 'V', '2013101104000001', '101', '10111');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vent_voucher`
--

CREATE TABLE IF NOT EXISTS `vent_voucher` (
  `id_voucher` varchar(22) NOT NULL,
  `id_venta` varchar(12) NOT NULL,
  `voucher` varchar(12) NOT NULL,
  `libro` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(2) NOT NULL,
  `modulo` varchar(20) NOT NULL,
  `lote` varchar(30) NOT NULL,
  PRIMARY KEY (`id_voucher`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vent_voucher`
--

INSERT INTO `vent_voucher` (`id_voucher`, `id_venta`, `voucher`, `libro`, `fecha`, `estado`, `modulo`, `lote`) VALUES
('2013120500000001', '001-2013', '001', '1', '2013-12-05', '1', 'venta', ' '),
('2013120500000002', '001-2013', '001', '1', '2013-12-05', '1', 'deposito', ' ');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estado_cuenta`
--
CREATE TABLE IF NOT EXISTS `vista_estado_cuenta` (
`idUnion` varchar(22)
,`id_cliente` varchar(22)
,`nombre` varchar(80)
,`pat` varchar(60)
,`mat` varchar(60)
,`codigo` varchar(12)
,`glosa` varchar(200)
,`id_voucher` varchar(22)
,`voucher` varchar(12)
,`importe` double
,`fecha_doc` date
,`id_persona` varchar(22)
,`lote` varchar(30)
,`numdoc` varchar(12)
,`tipo_oper` varchar(1)
,`doc` varchar(9)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_importe_compras`
--
CREATE TABLE IF NOT EXISTS `vista_importe_compras` (
`id` double
,`id_voucher` varchar(22)
,`id_mov_compra` varchar(22)
,`detalle` varchar(121)
,`imp_ref` double
,`id_nivel` varchar(22)
,`id_cuenta_comp` varchar(22)
,`tipo` varchar(5)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_sys_accesos`
--
CREATE TABLE IF NOT EXISTS `vista_sys_accesos` (
`id_accesos` varchar(22)
,`nombre` varchar(22)
,`url` varchar(200)
,`orden` int(11)
,`etiqueta` varchar(3)
,`id_menu` varchar(22)
,`nombremenu` varchar(60)
,`id_grupo` varchar(22)
,`estate` varchar(1)
,`estadopri` varchar(1)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventas_varios`
--
CREATE TABLE IF NOT EXISTS `vista_ventas_varios` (
`id_mov_serv` varchar(22)
,`codigo` varchar(22)
,`descripcion` varchar(100)
,`precio` double
,`tipo` varchar(2)
,`tipo_trans` varchar(2)
,`estado` varchar(2)
,`id_nivel` varchar(22)
,`id_cuenta` varchar(22)
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ventserviciosmultiples`
--
CREATE TABLE IF NOT EXISTS `vista_ventserviciosmultiples` (
`id_mov_serv` varchar(22)
,`codigo` varchar(16)
,`descripcion` varchar(80)
,`precio` double
,`tipo` varchar(2)
,`tipo_trans` varchar(2)
,`estado` varchar(2)
,`id_nivel` varchar(22)
,`id_cuenta` varchar(22)
);
-- --------------------------------------------------------

--
-- Estructura para la vista `detalle_compras`
--
DROP TABLE IF EXISTS `detalle_compras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_compras` AS select `cd`.`id_mov_det` AS `id_mov_det`,`cv`.`id_voucher` AS `id_voucher`,`cd`.`id_nivel` AS `id_nivel`,`cd`.`id_cuenta_comp` AS `id_cuenta_comp`,`cr`.`serie` AS `serie`,`cr`.`numdoc` AS `numdoc`,`cp`.`ruc` AS `ruc`,`cd`.`detalle` AS `detalle`,`cr`.`baseimp1` AS `baseimp1`,`cr`.`igv1` AS `igv1`,`cr`.`baseimp2` AS `baseimp2`,`cr`.`igv2` AS `igv2`,`cr`.`baseimp3` AS `baseimp3`,`cr`.`igv3` AS `igv3`,`cr`.`baseimp4` AS `baseimp4`,`cr`.`igv4` AS `igv4` from (((`comp_compras_detalle` `cd` left join `comp_compras_registro` `cr` on((`cd`.`id_mov_compra` = `cr`.`id_mov_compra`))) left join `comp_voucher` `cv` on((`cr`.`id_voucher` = `cv`.`id_voucher`))) left join `comp_proveedor` `cp` on((`cr`.`id_proveedor` = `cp`.`id_proveedor`))) order by (`cd`.`id_nivel` and `cd`.`id_cuenta_comp`);

-- --------------------------------------------------------

--
-- Estructura para la vista `estado_cuenta`
--
DROP TABLE IF EXISTS `estado_cuenta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `estado_cuenta` AS select rand() AS `id_estado_cuenta`,'compra' AS `mov`,concat('00',`cr`.`serie`,'-',lpad(`cr`.`numdoc`,8,'0')) AS `documento`,`cr`.`fecha_doc` AS `fecha_doc`,`cr`.`fecha_prov` AS `fecha_prov`,`cv`.`voucher` AS `voucher`,`cv`.`lote` AS `lote`,0.0 AS `debito`,`cr`.`importe` AS `credito`,'local' AS `moneda`,' ' AS `otro_imp`,`cr`.`id_mov_compra` AS `id`,`cr`.`id_proveedor` AS `proveedor` from ((`comp_compras_registro` `cr` left join `comp_pagos_efec` `pe` on((`cr`.`id_mov_compra` = `pe`.`id_mov_compra`))) left join `comp_voucher` `cv` on((`cr`.`id_voucher` = `cv`.`id_voucher`))) union all select rand() AS `id_estado_cuenta`,concat('Pag. Efec. ',`pe`.`numdoc`) AS `mov`,concat('00',`cr`.`serie`,'-',lpad(`cr`.`numdoc`,8,'0')) AS `documento`,`pe`.`fecha_doc` AS `fecha_doc`,`pe`.`fecha_doc` AS `fecha_doc`,`cv`.`voucher` AS `voucher`,`cv`.`lote` AS `lote`,`pe`.`importe` AS `importe`,0.0 AS `credito`,'local' AS `moneda`,' ' AS `otro_imp`,`cr`.`id_mov_compra` AS `id`,`cr`.`id_proveedor` AS `proveedor` from ((`comp_pagos_efec` `pe` left join `comp_compras_registro` `cr` on((`cr`.`id_mov_compra` = `pe`.`id_mov_compra`))) left join `comp_voucher` `cv` on((`cr`.`id_voucher` = `cv`.`id_voucher`))) union all select rand() AS `id_estado_cuenta`,concat('Pag. Cheque. ',`cc`.`num_doc`) AS `mov`,concat('00',`cr`.`serie`,'-',lpad(`cr`.`numdoc`,8,'0')) AS `documento`,`cc`.`fecha_doc` AS `fecha_doc`,`cc`.`fecha_doc` AS `fecha_doc`,`cv`.`voucher` AS `voucher`,`cv`.`lote` AS `lote`,`cc`.`monto` AS `importe`,0.0 AS `credito`,'local' AS `moneda`,' ' AS `otro_imp`,`cr`.`id_mov_compra` AS `id`,`cr`.`id_proveedor` AS `proveedor` from ((`comp_cheque` `cc` left join `comp_compras_registro` `cr` on((`cr`.`id_mov_compra` = `cc`.`id_mov_compra`))) left join `comp_voucher` `cv` on((`cr`.`id_voucher` = `cv`.`id_voucher`))) union all select rand() AS `id_estado_cuenta`,concat('Pag. Dep. Banco ',`db`.`numdoc`) AS `mov`,concat('00',`cr`.`serie`,'-',lpad(`cr`.`numdoc`,8,'0')) AS `documento`,`db`.`fecha_doc` AS `fecha_doc`,`db`.`fecha_doc` AS `fecha_doc`,`cv`.`voucher` AS `voucher`,`cv`.`lote` AS `lote`,`db`.`importe` AS `importe`,0.0 AS `credito`,'local' AS `moneda`,' ' AS `otro_imp`,`cr`.`id_mov_compra` AS `id`,`cr`.`id_proveedor` AS `proveedor` from ((`comp_depositos_banco` `db` left join `comp_compras_registro` `cr` on((`cr`.`id_mov_compra` = `db`.`id_mov_compra`))) left join `comp_voucher` `cv` on((`cr`.`id_voucher` = `cv`.`id_voucher`)));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estado_cuenta`
--
DROP TABLE IF EXISTS `vista_estado_cuenta`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estado_cuenta` AS select `vr`.`id_mov_vnt` AS `idUnion`,`vr`.`id_cliente` AS `id_cliente`,`cl3`.`nombre` AS `nombre`,`cl3`.`paterno` AS `pat`,`cl3`.`materno` AS `mat`,`cl3`.`codigo` AS `codigo`,`vr`.`glosa` AS `glosa`,`vo3`.`id_voucher` AS `id_voucher`,`vo3`.`voucher` AS `voucher`,`vr`.`importe` AS `importe`,`vr`.`fecha_doc` AS `fecha_doc`,`vr`.`id_persona` AS `id_persona`,`vo3`.`lote` AS `lote`,`vr`.`numvnt` AS `numdoc`,'d' AS `tipo_oper`,'Vent' AS `doc` from ((`vent_ventas_registro` `vr` join `vent_cliente` `cl3`) join `vent_voucher` `vo3`) where ((`vr`.`id_cliente` = `cl3`.`id_cliente`) and (`vo3`.`id_voucher` = `vr`.`id_voucher`)) union all select `de`.`id_mov_deposito` AS `idUnion`,`de`.`id_cliente` AS `id_cliente`,`cl`.`nombre` AS `nombre`,`cl`.`paterno` AS `pat`,`cl`.`materno` AS `mat`,`cl`.`codigo` AS `codigo`,`de`.`glosa` AS `glosa`,`vo`.`id_voucher` AS `id_voucher`,`vo`.`voucher` AS `voucher`,`de`.`importe` AS `importe`,`de`.`fecha` AS `fecha`,`de`.`id_personal_user` AS `id_personal_user`,`vo`.`lote` AS `lote`,`de`.`numdoc` AS `numdoc`,'c' AS `tipo_oper`,'Dep' AS `doc` from ((`vent_depositos` `de` join `vent_cliente` `cl`) join `vent_voucher` `vo`) where ((`de`.`id_cliente` = `cl`.`id_cliente`) and (`vo`.`id_voucher` = `de`.`id_voucher`)) union all select `ba`.`id_mov_deposito` AS `idUnion`,`ba`.`id_cliente` AS `id_cliente`,`cl1`.`nombre` AS `nombre`,`cl1`.`paterno` AS `pat`,`cl1`.`materno` AS `mat`,`cl1`.`codigo` AS `codigo`,'' AS `glosa`,`vo1`.`id_voucher` AS `id_voucher`,`vo1`.`voucher` AS `voucher`,`ba`.`monto` AS `importe`,`ba`.`fecha_doc` AS `fecha_doc`,`ba`.`id_personal_user` AS `id_personal_user`,`vo1`.`lote` AS `lote`,`ba`.`num_doc` AS `numdoc`,'c' AS `tipo_oper`,'Dep.Banc.' AS `doc` from ((`glo_deposito_banco` `ba` join `vent_cliente` `cl1`) join `vent_voucher` `vo1`) where ((`ba`.`id_cliente` = `cl1`.`id_cliente`) and (`vo1`.`id_voucher` = `ba`.`id_voucher`)) union all select `ti`.`id_mov_trans` AS `idUnion`,`ti`.`id_cliente` AS `id_cliente`,`cl2`.`nombre` AS `nombre`,`cl2`.`paterno` AS `pat`,`cl2`.`materno` AS `mat`,`cl2`.`codigo` AS `codigo`,`ti`.`glosa` AS `glosa`,`vo2`.`id_voucher` AS `id_voucher`,`vo2`.`voucher` AS `voucher`,`ti`.`importe` AS `importe`,`ti`.`fecha` AS `fecha`,`ti`.`id_personal_user` AS `id_personal_user`,`vo2`.`lote` AS `lote`,`ti`.`numtran` AS `numdoc`,'c' AS `tipo_oper`,'Tran.Int.' AS `doc` from ((`vent_transferencia_int` `ti` join `vent_cliente` `cl2`) join `vent_voucher` `vo2`) where ((`ti`.`id_cliente` = `cl2`.`id_cliente`) and (`ti`.`id_voucher` = `vo2`.`id_voucher`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_importe_compras`
--
DROP TABLE IF EXISTS `vista_importe_compras`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_importe_compras` AS select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cd`.`id_mov_compra` AS `id_mov_compra`,concat('RUC:',`cp`.`ruc`,'-DOC:',lpad(`cr`.`serie`,3,'0'),'-',lpad(`cr`.`numdoc`,8,'0'),'/',`cd`.`detalle`) AS `detalle`,`cd`.`imp_ref` AS `imp_ref`,`cd`.`id_nivel` AS `id_nivel`,`cd`.`id_cuenta_comp` AS `id_cuenta_comp`,'debe' AS `tipo` from ((`comp_compras_detalle` `cd` join `comp_compras_registro` `cr`) join `comp_proveedor` `cp`) where ((`cd`.`id_mov_compra` = `cr`.`id_mov_compra`) and (`cp`.`id_proveedor` = `cr`.`id_proveedor`) and (`cd`.`tipo_bi` <> 'b4.0')) union all select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cr`.`id_mov_compra` AS `id_mov_compra`,concat('Compras por pagar del dia : ',dayofmonth(`cv`.`fecha`),'/',month(`cv`.`fecha`),'/',year(`cv`.`fecha`)) AS `glosa`,(sum(`cd`.`importe`) + (sum((`cr`.`isc` + `cr`.`otro_imp`)) / (select (count(`comp_compras_registro`.`otro_imp`) + count(`comp_compras_registro`.`isc`)) from `comp_compras_registro` where ((`comp_compras_registro`.`otro_imp` > 0) and (`comp_compras_registro`.`isc` > 0))))) AS `SUM(cr.importe)`,`cd`.`id_nivel` AS `id_nivel`,`cr`.`id_cuenta_comp` AS `id_cuenta_comp`,'haber' AS `tipo` from ((`comp_compras_registro` `cr` join `comp_voucher` `cv`) left join `comp_compras_detalle` `cd` on((`cr`.`id_mov_compra` = `cd`.`id_mov_compra`))) where (`cr`.`id_voucher` = `cv`.`id_voucher`) group by `cr`.`id_voucher`,`cd`.`id_nivel` union all select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cr`.`id_mov_compra` AS `id_mov_compra`,'IGV' AS `glosa`,sum(`cd`.`igv`) AS `SUM(cd.igv)`,`cd`.`id_nivel` AS `id_nivel`,`cd`.`id_cta_igv` AS `id_cta_igv`,'debe' AS `tipo` from (`comp_compras_registro` `cr` join `comp_compras_detalle` `cd`) where ((`cr`.`id_mov_compra` = `cd`.`id_mov_compra`) and (`cd`.`tipo_bi` <> 'b4.0')) group by `cr`.`id_voucher`,`cd`.`id_nivel` union all select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cr`.`id_mov_compra` AS `id_mov_compra`,'ISC' AS `glosa`,sum(`cr`.`isc`) AS `SUM(cr.isc)`,`cr`.`id_nivel` AS `id_nivel`,'40121' AS `id_cuenta_comp`,'debe' AS `tipo` from `comp_compras_registro` `cr` group by `cr`.`id_voucher` union all select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cr`.`id_mov_compra` AS `id_mov_compra`,'Otros Imp.' AS `glosa`,sum(`cr`.`otro_imp`) AS `SUM(cr.otro_imp)`,`cr`.`id_nivel` AS `id_nivel`,'40189' AS `id_cuenta_comp`,'debe' AS `tipo` from `comp_compras_registro` `cr` group by `cr`.`id_voucher` union all select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cd`.`id_mov_compra` AS `id_mov_compra`,concat('INAF - ','RUC:',`cp`.`ruc`,'-DOC:',lpad(`cr`.`serie`,3,'0'),'-',lpad(`cr`.`numdoc`,8,'0'),'/',`cd`.`detalle`) AS `detalle`,`cd`.`importe` AS `importe`,`cd`.`id_nivel` AS `id_nivel`,`cd`.`id_cuenta_comp` AS `id_cuenta_comp`,'debe' AS `tipo` from ((`comp_compras_detalle` `cd` join `comp_compras_registro` `cr`) join `comp_proveedor` `cp`) where ((`cd`.`id_mov_compra` = `cr`.`id_mov_compra`) and (`cr`.`id_proveedor` = `cp`.`id_proveedor`) and (`cd`.`tipo_bi` = 'b4.0')) union all select rand() AS `id`,`cr`.`id_voucher` AS `id_voucher`,`cr`.`id_mov_compra` AS `id_mov_compra`,'IGV inaf.' AS `glosa`,sum(`cd`.`igv`) AS `SUM(cd.igv)`,`cd`.`id_nivel` AS `id_nivel`,`cd`.`id_cta_igv` AS `id_cta_igv`,'debe' AS `tipo` from (`comp_compras_registro` `cr` join `comp_compras_detalle` `cd`) where ((`cr`.`id_mov_compra` = `cd`.`id_mov_compra`) and (`cd`.`tipo_bi` = 'b4.0')) group by `cr`.`id_voucher`,`cd`.`id_nivel` order by `id_mov_compra`;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_sys_accesos`
--
DROP TABLE IF EXISTS `vista_sys_accesos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_sys_accesos` AS select `a`.`id_accesos` AS `id_accesos`,`a`.`nombre` AS `nombre`,`a`.`url` AS `url`,`a`.`nro_orden` AS `orden`,`m`.`etiqueta` AS `etiqueta`,`m`.`id_menu` AS `id_menu`,`m`.`nombre` AS `nombremenu`,`m`.`id_grupo` AS `id_grupo`,' ' AS `estate`,' ' AS `estadopri` from (`sys_accesos` `a` join `sys_menu` `m`) where (`a`.`id_menu` = `m`.`id_menu`);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventas_varios`
--
DROP TABLE IF EXISTS `vista_ventas_varios`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ventas_varios` AS select `sv`.`id_mov_serv` AS `id_mov_serv`,`sv`.`codigo` AS `codigo`,`sv`.`descripcion` AS `descripcion`,`sv`.`precio` AS `precio`,`sv`.`tipo` AS `tipo`,`sv`.`tipo_trans` AS `tipo_trans`,`sv`.`estado` AS `estado`,`sv`.`id_nivel` AS `id_nivel`,`sv`.`id_cuenta` AS `id_cuenta` from `vent_servicios_varios` `sv` where (`sv`.`estado` = '1') union all select `se`.`id_mov_seredu` AS `id_mov_seredu`,`se`.`codigo` AS `codigo`,`se`.`descripcion` AS `descripcion`,`se`.`precio` AS `precio`,`se`.`tipo` AS `tipo`,'I' AS `tipo_trans`,`se`.`estado` AS `estado`,`se`.`id_nivel` AS `id_nivel`,`se`.`id_cuenta` AS `id_cuenta` from (`vent_servicio_educacion` `se` join `vent_periodo_vaca` `pv`) where ((`se`.`estado` = '1') and (`pv`.`id_periodo_vaca` = `se`.`id_periodo_vaca`) and (`pv`.`estado` = '1')) union all select `cal`.`id_contrato_criterio` AS `id_contrato_criterio`,`cal`.`codigo_contrato` AS `codigo_contrato`,`cal`.`descripcion` AS `descripcion`,`cal`.`precio` AS `precio`,`cal`.`tipo` AS `tipo`,'I' AS `tipo_trans`,`cal`.`estado` AS `estado`,`cal`.`id_nivel` AS `id_nivel`,`cal`.`id_cuenta_vnt` AS `id_cuenta_vnt` from `fina_contrato_alumno_criterio` `cal` where (`cal`.`estado` = '1');

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ventserviciosmultiples`
--
DROP TABLE IF EXISTS `vista_ventserviciosmultiples`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ventserviciosmultiples` AS select `sv`.`id_mov_serv` AS `id_mov_serv`,`sv`.`codigo` AS `codigo`,`sv`.`descripcion` AS `descripcion`,`sv`.`precio` AS `precio`,`sv`.`tipo` AS `tipo`,`sv`.`tipo_trans` AS `tipo_trans`,`sv`.`estado` AS `estado`,`sv`.`id_nivel` AS `id_nivel`,`sv`.`id_cuenta` AS `id_cuenta` from `vent_servicios_varios` `sv` where (`sv`.`estado` = '1') union all select `se`.`id_mov_seredu` AS `id_mov_seredu`,`se`.`codigo` AS `codigo`,`se`.`descripcion` AS `descripcion`,`se`.`precio` AS `precio`,`se`.`tipo` AS `tipo`,'I' AS `tipo_trans`,`se`.`estado` AS `estado`,`se`.`id_nivel` AS `id_nivel`,`se`.`id_cuenta` AS `id_cuenta` from (`vent_servicio_educacion` `se` join `vent_periodo_vaca` `pv`) where ((`se`.`estado` = '1') and (`pv`.`id_periodo_vaca` = `se`.`id_periodo_vaca`) and (`pv`.`estado` = '1'));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comp_cheque`
--
ALTER TABLE `comp_cheque`
  ADD CONSTRAINT `comp_compras_registro_comp_cheque_fk` FOREIGN KEY (`id_mov_compra`) REFERENCES `comp_compras_registro` (`id_mov_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_proveedor_comp_cheque_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `comp_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_voucher_comp_cheque_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_banco_comp_cheque_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_compras_detalle`
--
ALTER TABLE `comp_compras_detalle`
  ADD CONSTRAINT `comp_compras_registro_comp_compras_detalle_fk` FOREIGN KEY (`id_mov_compra`) REFERENCES `comp_compras_registro` (`id_mov_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_unidadmedida_comp_compras_detalle_fk` FOREIGN KEY (`id_unidadmedida`) REFERENCES `glo_unidadmedida` (`id_unidadmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_compras_detalle_carrito`
--
ALTER TABLE `comp_compras_detalle_carrito`
  ADD CONSTRAINT `glo_persona_comp_compras_detalle_carrito_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_compras_registro`
--
ALTER TABLE `comp_compras_registro`
  ADD CONSTRAINT `comp_proveedor_comp_compras_registro_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `comp_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_voucher_comp_compras_registro_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_comprobante_comp_compras_registro_fk` FOREIGN KEY (`id_comprobante`) REFERENCES `glo_comprobante` (`id_comprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_mediopago_comp_compras_registro_fk` FOREIGN KEY (`id_mediopago`) REFERENCES `glo_mediopago` (`id_mediopago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_persona_comp_compras_registro_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_tipomoneda_comp_compras_registro_fk` FOREIGN KEY (`id_tipomoneda`) REFERENCES `glo_tipomoneda` (`id_tipomoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_tipooperacion_comp_compras_registro_fk` FOREIGN KEY (`id_tipooperacion`) REFERENCES `glo_tipooperacion` (`id_tipooperacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_depositos_banco`
--
ALTER TABLE `comp_depositos_banco`
  ADD CONSTRAINT `comp_compras_registro_comp_depositos_banco_fk` FOREIGN KEY (`id_mov_compra`) REFERENCES `comp_compras_registro` (`id_mov_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_proveedor_comp_depositos_banco_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `comp_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_voucher_comp_depositos_banco_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_voucher_repo_comp_depositos_banco_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_notas`
--
ALTER TABLE `comp_notas`
  ADD CONSTRAINT `comp_compras_registro_comp_notas_fk` FOREIGN KEY (`id_mov_compra`) REFERENCES `comp_compras_registro` (`id_mov_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_proveedor_comp_notas_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `comp_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_voucher_comp_notas_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_tipomoneda_comp_notas_fk` FOREIGN KEY (`id_tipomoneda`) REFERENCES `glo_tipomoneda` (`id_tipomoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_tipooperacion_comp_notas_fk` FOREIGN KEY (`id_tipooperacion`) REFERENCES `glo_tipooperacion` (`id_tipooperacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_voucher_repo_comp_notas_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_pagos_efec`
--
ALTER TABLE `comp_pagos_efec`
  ADD CONSTRAINT `comp_compras_registro_comp_pagos_efec_fk` FOREIGN KEY (`id_mov_compra`) REFERENCES `comp_compras_registro` (`id_mov_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_proveedor_comp_pagos_efec_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `comp_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_voucher_comp_pagos_efec_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_voucher_repo_comp_pagos_efec_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_pagos_efec_otros`
--
ALTER TABLE `comp_pagos_efec_otros`
  ADD CONSTRAINT `comp_voucher_comp_pagos_efec_otros_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_voucher_repo_comp_pagos_efec_otros_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_pagos_efec_otros_detalle`
--
ALTER TABLE `comp_pagos_efec_otros_detalle`
  ADD CONSTRAINT `comp_pagos_efec_otros_comp_pagos_efec_detalle_fk` FOREIGN KEY (`id_mov_pag`) REFERENCES `comp_pagos_efec_otros` (`id_mov_pag`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_proveedor`
--
ALTER TABLE `comp_proveedor`
  ADD CONSTRAINT `glo_tipoidentidad_comp_proveedor_fk` FOREIGN KEY (`id_tipoidentidad`) REFERENCES `glo_tipoidentidad` (`id_tipoidentidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_saldo_inicial`
--
ALTER TABLE `comp_saldo_inicial`
  ADD CONSTRAINT `glo_apertura_periodo_comp_saldo_inicial_fk` FOREIGN KEY (`id_apertura_periodo`) REFERENCES `glo_apertura_periodo` (`id_apertura_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comp_transferencia_banco`
--
ALTER TABLE `comp_transferencia_banco`
  ADD CONSTRAINT `comp_compras_registro_comp_transferencia_banco_fk` FOREIGN KEY (`id_mov_compra`) REFERENCES `comp_compras_registro` (`id_mov_compra`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_proveedor_comp_transferencia_banco_fk` FOREIGN KEY (`id_proveedor`) REFERENCES `comp_proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comp_voucher_comp_transferencia_banco_fk` FOREIGN KEY (`id_voucher`) REFERENCES `comp_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_banco_comp_transferencia_banco_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_cuenta`
--
ALTER TABLE `cont_cuenta`
  ADD CONSTRAINT `cont_elemento_cont_cuenta_fk` FOREIGN KEY (`id_elemento`) REFERENCES `cont_elemento` (`id_elemento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_division`
--
ALTER TABLE `cont_division`
  ADD CONSTRAINT `cont_sub_cuenta_cont_division_fk` FOREIGN KEY (`id_sub_cuenta`) REFERENCES `cont_sub_cuenta` (`id_sub_cuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_div_nivel`
--
ALTER TABLE `cont_div_nivel`
  ADD CONSTRAINT `cont_sub_nivel_cont_div_nivel_fk` FOREIGN KEY (`id_sub_nivel`) REFERENCES `cont_sub_nivel` (`id_sub_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_libro_diario`
--
ALTER TABLE `cont_libro_diario`
  ADD CONSTRAINT `cont_general_diario_cont_libro_diario_fk` FOREIGN KEY (`id_mov_gendiario`) REFERENCES `cont_general_diario` (`id_mov_gendiario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_subdiv_cuenta`
--
ALTER TABLE `cont_subdiv_cuenta`
  ADD CONSTRAINT `cont_division_cont_subdiv_cuenta_fk` FOREIGN KEY (`id_division`) REFERENCES `cont_division` (`id_division`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_sub_cuenta`
--
ALTER TABLE `cont_sub_cuenta`
  ADD CONSTRAINT `cont_cuenta_cont_sub_cuenta_fk` FOREIGN KEY (`id_cuenta`) REFERENCES `cont_cuenta` (`id_cuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cont_sub_nivel`
--
ALTER TABLE `cont_sub_nivel`
  ADD CONSTRAINT `cont_nivel_cont_sub_nivel_fk` FOREIGN KEY (`id_nivel`) REFERENCES `cont_nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fina_contrato_alumno`
--
ALTER TABLE `fina_contrato_alumno`
  ADD CONSTRAINT `fina_grado_fina_contrato_alumno_fk` FOREIGN KEY (`id_grado`) REFERENCES `fina_grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_cliente_fina_contrato_alumno_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fina_contrato_alumno_criterio`
--
ALTER TABLE `fina_contrato_alumno_criterio`
  ADD CONSTRAINT `fina_nivel_fina_contrato_alumno_criterio_fk` FOREIGN KEY (`id_nivel`) REFERENCES `fina_nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fina_contrato_alumno_detalle`
--
ALTER TABLE `fina_contrato_alumno_detalle`
  ADD CONSTRAINT `fina_contrato_alumno_criterio_fina_contrato_alumno_detalle_fk` FOREIGN KEY (`id_contrato_criterio`) REFERENCES `fina_contrato_alumno_criterio` (`id_contrato_criterio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fina_contrato_alumno_fina_contrato_alumno_detalle_fk` FOREIGN KEY (`id_contrato_alumno`) REFERENCES `fina_contrato_alumno` (`id_contrato_alumno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fina_contrato_criterio_detalle`
--
ALTER TABLE `fina_contrato_criterio_detalle`
  ADD CONSTRAINT `fina_contrato_alumno_criterio_fina_contrato_criterio_detalle_fk` FOREIGN KEY (`id_contrato_criterio`) REFERENCES `fina_contrato_alumno_criterio` (`id_contrato_criterio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fina_curso_grado`
--
ALTER TABLE `fina_curso_grado`
  ADD CONSTRAINT `fina_curso_fina_curso_grado_fk` FOREIGN KEY (`id_curso`) REFERENCES `fina_curso` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fina_grado_fina_curso_grado_fk` FOREIGN KEY (`id_grado`) REFERENCES `fina_grado` (`id_grado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fina_grado`
--
ALTER TABLE `fina_grado`
  ADD CONSTRAINT `fina_nivel_fina_grado_fk` FOREIGN KEY (`id_nivel`) REFERENCES `fina_nivel` (`id_nivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_apertura_periodo`
--
ALTER TABLE `glo_apertura_periodo`
  ADD CONSTRAINT `glo_configuracion_periodo_glo_apertura_periodo_fk` FOREIGN KEY (`id_configuracion`) REFERENCES `glo_configuracion` (`id_configuracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_empresa_glo_apertura_periodo_fk` FOREIGN KEY (`id_empresa`) REFERENCES `glo_empresa` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_area`
--
ALTER TABLE `glo_area`
  ADD CONSTRAINT `glo_departamento_glo_area_fk` FOREIGN KEY (`id_departamento`) REFERENCES `glo_departamento` (`id_departamento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_cheque_repo`
--
ALTER TABLE `glo_cheque_repo`
  ADD CONSTRAINT `glo_banco_glo_cheque_repo_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_voucher_repo_glo_cheque_repo_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_deposito_banco`
--
ALTER TABLE `glo_deposito_banco`
  ADD CONSTRAINT `glo_banco_glo_deposito_banco_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_cliente_glo_deposito_banco_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_glo_deposito_banco_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_impresion_accesos`
--
ALTER TABLE `glo_impresion_accesos`
  ADD CONSTRAINT `vent_ventas_impdoc_glo_impresion_accesos_fk` FOREIGN KEY (`id_impdoc`) REFERENCES `vent_ventas_impdoc` (`id_impdoc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_impresion_usuario`
--
ALTER TABLE `glo_impresion_usuario`
  ADD CONSTRAINT `glo_impresion_accesos_glo_impresion_usuario_fk` FOREIGN KEY (`id_impresion`) REFERENCES `glo_impresion_accesos` (`id_impresion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_persona_glo_impresion_usuario_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_persona`
--
ALTER TABLE `glo_persona`
  ADD CONSTRAINT `glo_tipoidentidad_glo_persona_fk` FOREIGN KEY (`id_tipoidentidad`) REFERENCES `glo_tipoidentidad` (`id_tipoidentidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_persona_empresa`
--
ALTER TABLE `glo_persona_empresa`
  ADD CONSTRAINT `glo_empresa_glo_persona_empresa_fk` FOREIGN KEY (`id_empresa`) REFERENCES `glo_empresa` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_persona_glo_persona_empresa_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `glo_vales`
--
ALTER TABLE `glo_vales`
  ADD CONSTRAINT `glo_voucher_repo_glo_vales_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_trabajador_glo_vales_fk` FOREIGN KEY (`id_trabajador`) REFERENCES `pla_trabajador` (`id_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_voucher_glo_vales_fk` FOREIGN KEY (`id_voucher`) REFERENCES `pla_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_afpcomisiones`
--
ALTER TABLE `pla_afpcomisiones`
  ADD CONSTRAINT `pla_afponp_pla_afpcomisiones_fk` FOREIGN KEY (`id_afponp`) REFERENCES `pla_afponp` (`id_afponp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_tipocomision_pla_afpcomisiones_fk` FOREIGN KEY (`id_tipocomision`) REFERENCES `pla_tipocomision` (`id_tipocomision`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_cargo`
--
ALTER TABLE `pla_cargo`
  ADD CONSTRAINT `glo_area_pla_cargo_fk` FOREIGN KEY (`id_area`) REFERENCES `glo_area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_cheque`
--
ALTER TABLE `pla_cheque`
  ADD CONSTRAINT `glo_banco_pla_cheque_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_planilla_registro_pla_cheque_fk` FOREIGN KEY (`id_mov_planilla`) REFERENCES `pla_planilla_registro` (`id_mov_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_voucher_pla_cheque_fk` FOREIGN KEY (`id_voucher`) REFERENCES `pla_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_cts`
--
ALTER TABLE `pla_cts`
  ADD CONSTRAINT `pla_planilla_registro_pla_cts_fk` FOREIGN KEY (`id_mov_planilla`) REFERENCES `pla_planilla_registro` (`id_mov_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_deposito_seguro`
--
ALTER TABLE `pla_deposito_seguro`
  ADD CONSTRAINT `glo_banco_pla_deposito_seguro_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_voucher_repo_pla_deposito_seguro_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_main_pla_deposito_seguro_fk` FOREIGN KEY (`id_planilla`) REFERENCES `pla_main` (`id_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_efectivo`
--
ALTER TABLE `pla_efectivo`
  ADD CONSTRAINT `glo_voucher_repo_pla_efectivo_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_liquidacion_pla_efectivo_fk` FOREIGN KEY (`id_liquidacion`) REFERENCES `pla_liquidacion` (`id_liquidacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_planilla_registro_pla_efectivo_fk` FOREIGN KEY (`id_mov_planilla`) REFERENCES `pla_planilla_registro` (`id_mov_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_egreso_depositos`
--
ALTER TABLE `pla_egreso_depositos`
  ADD CONSTRAINT `glo_voucher_repo_pla_egreso_depositos_fk` FOREIGN KEY (`id_voucher_repo`) REFERENCES `glo_voucher_repo` (`id_voucher_repo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_cts_pla_egreso_depositos_fk` FOREIGN KEY (`id_cts`) REFERENCES `pla_cts` (`id_cts`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_ges_personal`
--
ALTER TABLE `pla_ges_personal`
  ADD CONSTRAINT `pla_main_pla_ges_personal_fk` FOREIGN KEY (`id_planilla`) REFERENCES `pla_main` (`id_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_trabajador_pla_ges_personal_fk` FOREIGN KEY (`id_trabajador`) REFERENCES `pla_trabajador` (`id_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_liquidacion`
--
ALTER TABLE `pla_liquidacion`
  ADD CONSTRAINT `pla_planilla_registro_pla_liquidacion_fk` FOREIGN KEY (`id_mov_planilla`) REFERENCES `pla_planilla_registro` (`id_mov_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_parientes`
--
ALTER TABLE `pla_parientes`
  ADD CONSTRAINT `pla_trabajador_pla_parientes_fk` FOREIGN KEY (`id_trabajador`) REFERENCES `pla_trabajador` (`id_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_planilla_detalle`
--
ALTER TABLE `pla_planilla_detalle`
  ADD CONSTRAINT `pla_planilla_registro_pla_planilla_detalle_fk` FOREIGN KEY (`id_mov_planilla`) REFERENCES `pla_planilla_registro` (`id_mov_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_planilla_registro`
--
ALTER TABLE `pla_planilla_registro`
  ADD CONSTRAINT `pla_main_pla_planilla_registro_fk` FOREIGN KEY (`id_planilla`) REFERENCES `pla_main` (`id_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_trabajador_pla_planilla_registro_fk` FOREIGN KEY (`id_trabajador`) REFERENCES `pla_trabajador` (`id_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_saldo_inicial`
--
ALTER TABLE `pla_saldo_inicial`
  ADD CONSTRAINT `glo_apertura_periodo_pla_saldo_inicial_fk` FOREIGN KEY (`id_apertura_periodo`) REFERENCES `glo_apertura_periodo` (`id_apertura_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_main_pla_saldo_inicial_fk` FOREIGN KEY (`id_planilla`) REFERENCES `pla_main` (`id_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_trabajador`
--
ALTER TABLE `pla_trabajador`
  ADD CONSTRAINT `glo_persona_pla_trabajador_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_afponp_pla_trabajador_fk` FOREIGN KEY (`id_afponp`) REFERENCES `pla_afponp` (`id_afponp`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_tipocomision_pla_trabajador_fk` FOREIGN KEY (`id_tipocomision`) REFERENCES `pla_tipocomision` (`id_tipocomision`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_transferencia_banco`
--
ALTER TABLE `pla_transferencia_banco`
  ADD CONSTRAINT `glo_banco_pla_transferencia_banco_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_planilla_registro_pla_transferencia_banco_fk` FOREIGN KEY (`id_mov_planilla`) REFERENCES `pla_planilla_registro` (`id_mov_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_transf_interna`
--
ALTER TABLE `pla_transf_interna`
  ADD CONSTRAINT `glo_vales_pla_transf_inter_fk` FOREIGN KEY (`id_mov_vale`) REFERENCES `glo_vales` (`id_mov_vale`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_trabajador_pla_transf_inter_fk` FOREIGN KEY (`id_trabajador`) REFERENCES `pla_trabajador` (`id_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_voucher_pla_transf_inter_fk` FOREIGN KEY (`id_voucher`) REFERENCES `pla_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_vitacora`
--
ALTER TABLE `pla_vitacora`
  ADD CONSTRAINT `pla_cargo_pla_vitacora_fk` FOREIGN KEY (`id_cargo`) REFERENCES `pla_cargo` (`id_cargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_main_pla_vitacora_fk` FOREIGN KEY (`id_planilla`) REFERENCES `pla_main` (`id_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pla_trabajador_pla_vitacora_fk` FOREIGN KEY (`id_trabajador`) REFERENCES `pla_trabajador` (`id_trabajador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pla_voucher`
--
ALTER TABLE `pla_voucher`
  ADD CONSTRAINT `pla_main_pla_voucher_fk` FOREIGN KEY (`id_planilla`) REFERENCES `pla_main` (`id_planilla`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_accesos`
--
ALTER TABLE `sys_accesos`
  ADD CONSTRAINT `sys_menu_sys_accesos_fk` FOREIGN KEY (`id_menu`) REFERENCES `sys_menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_accesos_perfiles`
--
ALTER TABLE `sys_accesos_perfiles`
  ADD CONSTRAINT `sys_accesos_sys_accesos_perfiles_fk` FOREIGN KEY (`id_accesos`) REFERENCES `sys_accesos` (`id_accesos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sys_perfiles_sys_accesos_perfiles_fk` FOREIGN KEY (`id_perfil`) REFERENCES `sys_perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_detalle_sessiones`
--
ALTER TABLE `sys_detalle_sessiones`
  ADD CONSTRAINT `sys_sessiones_sys_detalle_sessiones_fk` FOREIGN KEY (`id_sessiones`) REFERENCES `sys_sessiones` (`id_sessiones`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_menu`
--
ALTER TABLE `sys_menu`
  ADD CONSTRAINT `sys_grupo_sys_menu_fk` FOREIGN KEY (`id_grupo`) REFERENCES `sys_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_perfiles_crud`
--
ALTER TABLE `sys_perfiles_crud`
  ADD CONSTRAINT `sys_perfiles_sys_perfiles_crud_fk` FOREIGN KEY (`id_perfil`) REFERENCES `sys_perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_privilegios`
--
ALTER TABLE `sys_privilegios`
  ADD CONSTRAINT `sys_accesos_sys_privilegios_fk` FOREIGN KEY (`id_accesos`) REFERENCES `sys_accesos` (`id_accesos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sys_usuario_sys_privilegios_fk` FOREIGN KEY (`id_usuario`) REFERENCES `sys_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_sessiones`
--
ALTER TABLE `sys_sessiones`
  ADD CONSTRAINT `glo_persona_sys_sessiones1_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sys_usuario`
--
ALTER TABLE `sys_usuario`
  ADD CONSTRAINT `glo_persona_sys_usuario_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sys_grupo_sys_usuario_fk` FOREIGN KEY (`id_grupo`) REFERENCES `sys_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sys_perfiles_sys_usuario_fk` FOREIGN KEY (`id_perfil`) REFERENCES `sys_perfiles` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_cheques`
--
ALTER TABLE `vent_cheques`
  ADD CONSTRAINT `vent_cliente_vent_cheques_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_ventas_registro_vent_cheques_fk` FOREIGN KEY (`id_mov_vnt`) REFERENCES `vent_ventas_registro` (`id_mov_vnt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_vent_cheques_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_cliente`
--
ALTER TABLE `vent_cliente`
  ADD CONSTRAINT `glo_tipoidentidad_vent_cliente_fk` FOREIGN KEY (`id_tipoidentidad`) REFERENCES `glo_tipoidentidad` (`id_tipoidentidad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_depositos`
--
ALTER TABLE `vent_depositos`
  ADD CONSTRAINT `vent_cliente_vent_depositos_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_ventas_registro_vent_depositos_fk` FOREIGN KEY (`id_mov_vnt`) REFERENCES `vent_ventas_registro` (`id_mov_vnt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_vent_depositos_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_impdoc_data`
--
ALTER TABLE `vent_impdoc_data`
  ADD CONSTRAINT `vent_ventas_impdoc_vent_impdoc_data_fk` FOREIGN KEY (`id_impdoc`) REFERENCES `vent_ventas_impdoc` (`id_impdoc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_notas`
--
ALTER TABLE `vent_notas`
  ADD CONSTRAINT `glo_tipooperacion_vent_notas_fk` FOREIGN KEY (`id_tipooperacion`) REFERENCES `glo_tipooperacion` (`id_tipooperacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_ventas_registro_vent_notas_fk` FOREIGN KEY (`id_mov_vnt`) REFERENCES `vent_ventas_registro` (`id_mov_vnt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_vent_notas_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_saldo_inicial`
--
ALTER TABLE `vent_saldo_inicial`
  ADD CONSTRAINT `glo_apertura_periodo_vent_saldo_inicial_fk` FOREIGN KEY (`id_apertura_periodo`) REFERENCES `glo_apertura_periodo` (`id_apertura_periodo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_servicio_educacion`
--
ALTER TABLE `vent_servicio_educacion`
  ADD CONSTRAINT `vent_periodo_vaca_vent_servicio_educacion_fk` FOREIGN KEY (`id_periodo_vaca`) REFERENCES `vent_periodo_vaca` (`id_periodo_vaca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_transferencia_int`
--
ALTER TABLE `vent_transferencia_int`
  ADD CONSTRAINT `vent_cliente_vent_transferencia_int_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_ventas_registro_vent_transferencia_int_fk` FOREIGN KEY (`id_mov_vnt`) REFERENCES `vent_ventas_registro` (`id_mov_vnt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_vent_transferencia_int_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_transf_banco`
--
ALTER TABLE `vent_transf_banco`
  ADD CONSTRAINT `glo_banco_vent_transf_banco_fk` FOREIGN KEY (`id_banco`) REFERENCES `glo_banco` (`id_banco`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_cliente_vent_transf_banco_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_vent_transf_banco_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_ventas_registro`
--
ALTER TABLE `vent_ventas_registro`
  ADD CONSTRAINT `glo_comprobante_vent_ventas_registro_fk` FOREIGN KEY (`id_comprobante`) REFERENCES `glo_comprobante` (`id_comprobante`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_persona_vent_ventas_registro_fk` FOREIGN KEY (`id_persona`) REFERENCES `glo_persona` (`id_persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_tipomoneda_vent_ventas_registro_fk` FOREIGN KEY (`id_tipomoneda`) REFERENCES `glo_tipomoneda` (`id_tipomoneda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `glo_tipooperacion_vent_ventas_registro_fk` FOREIGN KEY (`id_tipooperacion`) REFERENCES `glo_tipooperacion` (`id_tipooperacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_cliente_vent_ventas_registro_fk` FOREIGN KEY (`id_cliente`) REFERENCES `vent_cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_voucher_vent_ventas_registro_fk` FOREIGN KEY (`id_voucher`) REFERENCES `vent_voucher` (`id_voucher`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vent_venta_detalle`
--
ALTER TABLE `vent_venta_detalle`
  ADD CONSTRAINT `glo_unidadmedida_vent_venta_detalle_fk` FOREIGN KEY (`id_unidadmedida`) REFERENCES `glo_unidadmedida` (`id_unidadmedida`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vent_ventas_registro_vent_venta_detalle_fk` FOREIGN KEY (`id_mov_vnt`) REFERENCES `vent_ventas_registro` (`id_mov_vnt`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
