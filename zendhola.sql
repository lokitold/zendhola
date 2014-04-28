
create database zendhola;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `full_text` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cji_producto` (
  `PROD_Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `PROD_Nombre` varchar(100) DEFAULT NULL,
  `PROD_DescripcionBreve` varchar(200) DEFAULT NULL,
  `PROD_Stock` double DEFAULT '0',
  `PROD_StockMinimo` double NOT NULL DEFAULT '0',
  `PROD_StockMaximo` double NOT NULL DEFAULT '0',
  `PROD_FlagActivo` char(1) DEFAULT '1',
  `PROD_FlagEstado` char(1) DEFAULT '1',
  PRIMARY KEY (`PROD_Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8