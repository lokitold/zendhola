
create database zendhola;

CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `full_text` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*28042014*/
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

CREATE TABLE `cji_unidadmedida` (
  `UNDMED_Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `UNDMED_Descripcion` varchar(250) DEFAULT NULL,
  `UNDMED_Simbolo` varchar(30) DEFAULT NULL,
  `UNDMED_FechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UNDMED_FechaModificacion` datetime DEFAULT NULL,
  `UNDMED_FlagEstado` char(1) DEFAULT '1',
  PRIMARY KEY (`UNDMED_Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8


CREATE TABLE `cji_productounidad` (
  `PRODUNIP_Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `UNDMED_Codigo` int(11) NOT NULL,
  `PROD_Codigo` int(11) NOT NULL,
  `PRODUNIC_Factor` varchar(250) DEFAULT NULL,
  `PRODUNIC_flagPrincipal` char(1) DEFAULT '0',
  `PRODUNIC_FechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRODUNIC_FechaModificacion` datetime DEFAULT NULL,
  `PRODUNIC_flagEstado` char(1) DEFAULT '1',
  PRIMARY KEY (`PRODUNIP_Codigo`),
  UNIQUE KEY `PROD_Codigo` (`PROD_Codigo`,`PRODUNIC_Factor`),
  KEY `FK_Reference_61` (`UNDMED_Codigo`),
  KEY `FK_Reference_62` (`PROD_Codigo`),
  CONSTRAINT `FK_Reference_61` FOREIGN KEY (`UNDMED_Codigo`) REFERENCES `cji_unidadmedida` (`UNDMED_Codigo`),
  CONSTRAINT `FK_Reference_62` FOREIGN KEY (`PROD_Codigo`) REFERENCES `cji_producto` (`PROD_Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `cji_moneda` (
  `MONED_Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `MONED_Descripcion` varchar(250) DEFAULT NULL,
  `MONED_Simbolo` varchar(100) NOT NULL,
  `MONED_FechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `MONED_FechaModificacion` datetime DEFAULT NULL,
  `MONED_Orden` int(11) NOT NULL DEFAULT '0',
  `MONED_FlagEstado` char(1) DEFAULT '1',
  PRIMARY KEY (`MONED_Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE `cji_productoprecio` (
  `PRODPREP_Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `PROD_Codigo` int(11) NOT NULL,
  `MONED_Codigo` int(11) NOT NULL,
  `PRODUNIP_Codigo` int(11) DEFAULT NULL,
  `PRODPREC_Precio` double NOT NULL,
  `PRODPREC_FechaRegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PRODPREC_FechaModificacion` datetime DEFAULT NULL,
  `PRODPREC_FlagEstado` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`PRODPREP_Codigo`),
  UNIQUE KEY `PROD_Codigo` (`PROD_Codigo`,`MONED_Codigo`,`PRODUNIP_Codigo`),
  KEY `FK_cji_productoprecio_moneda` (`MONED_Codigo`),
  KEY `FK_cji_productoprecio_produni` (`PRODUNIP_Codigo`),
  CONSTRAINT `FK_cji_productoprecio_moneda` FOREIGN KEY (`MONED_Codigo`) REFERENCES `cji_moneda` (`MONED_Codigo`),
  CONSTRAINT `FK_cji_productoprecio_producto` FOREIGN KEY (`PROD_Codigo`) REFERENCES `cji_producto` (`PROD_Codigo`),
  CONSTRAINT `FK_cji_productoprecio_produni` FOREIGN KEY (`PRODUNIP_Codigo`) REFERENCES `cji_productounidad` (`PRODUNIP_Codigo`) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8