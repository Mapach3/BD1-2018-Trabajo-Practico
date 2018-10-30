-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema practica2_granja
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema practica2_granja
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `practica2_granja` DEFAULT CHARACTER SET utf8 ;
USE `practica2_granja` ;

-- -----------------------------------------------------
-- Table `practica2_granja`.`Calle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Calle` (
  `Nombre` VARCHAR(45) NOT NULL,
  `idCalle` INT NOT NULL,
  PRIMARY KEY (`idCalle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Cabaña`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Cabaña` (
  `Razon_social` VARCHAR(45) NULL,
  `id_Cabaña` INT NOT NULL,
  `Cuit` VARCHAR(45) NULL,
  `Num_dom` INT NULL,
  `Calle_idCalle` INT NOT NULL,
  PRIMARY KEY (`id_Cabaña`),
  INDEX `fk_Cabaña_Calle1_idx` (`Calle_idCalle` ASC),
  CONSTRAINT `fk_Cabaña_Calle1`
    FOREIGN KEY (`Calle_idCalle`)
    REFERENCES `practica2_granja`.`Calle` (`idCalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Genetica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Genetica` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Cabaña_id_Cabaña` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Genetica_Cabaña_idx` (`Cabaña_id_Cabaña` ASC),
  CONSTRAINT `fk_Genetica_Cabaña`
    FOREIGN KEY (`Cabaña_id_Cabaña`)
    REFERENCES `practica2_granja`.`Cabaña` (`id_Cabaña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Plantel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Plantel` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Edad_Gallinas` INT NULL,
  `Fecha_Entrada` DATE NULL,
  `Precio_Compra` VARCHAR(45) NULL,
  `Genetica_Codigo` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Plantel_Genetica1_idx` (`Genetica_Codigo` ASC),
  CONSTRAINT `fk_Plantel_Genetica1`
    FOREIGN KEY (`Genetica_Codigo`)
    REFERENCES `practica2_granja`.`Genetica` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Galpon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Galpon` (
  `Numero` INT NOT NULL,
  `Ctdad_Gallinas` INT NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Planilla` (
  `idPlanilla` INT NOT NULL,
  `Fecha` DATE NULL,
  `ctdad_huevos` INT NULL,
  `cant_alimento` INT NULL,
  `tipo_alimento` VARCHAR(45) NULL,
  `ctdad_muertas` INT NULL,
  `novedades` TEXT NULL,
  `Galpon_Numero` INT NOT NULL,
  PRIMARY KEY (`idPlanilla`),
  INDEX `fk_Planilla_Galpon1_idx` (`Galpon_Numero` ASC),
  CONSTRAINT `fk_Planilla_Galpon1`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `practica2_granja`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Clientes` (
  `Nombre` VARCHAR(45) NULL,
  `Cuit` VARCHAR(45) NOT NULL,
  `Num_dom` INT NULL,
  `Calle_idCalle` INT NOT NULL,
  PRIMARY KEY (`Cuit`),
  INDEX `fk_Clientes_Calle1_idx` (`Calle_idCalle` ASC),
  CONSTRAINT `fk_Clientes_Calle1`
    FOREIGN KEY (`Calle_idCalle`)
    REFERENCES `practica2_granja`.`Calle` (`idCalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Empaque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Empaque` (
  `idEmpaque` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ctdad_Huevos` INT NULL,
  PRIMARY KEY (`idEmpaque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Productos` (
  `Codigo_prod` INT NOT NULL,
  `Precio_Venta` INT NULL,
  `Empaque_idEmpaque` INT NOT NULL,
  PRIMARY KEY (`Codigo_prod`),
  INDEX `fk_Productos_Empaque1_idx` (`Empaque_idEmpaque` ASC),
  CONSTRAINT `fk_Productos_Empaque1`
    FOREIGN KEY (`Empaque_idEmpaque`)
    REFERENCES `practica2_granja`.`Empaque` (`idEmpaque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Plantel_tiene_Galpon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Plantel_tiene_Galpon` (
  `Plantel_Codigo` INT NOT NULL,
  `Galpon_Numero` INT NOT NULL,
  PRIMARY KEY (`Plantel_Codigo`, `Galpon_Numero`),
  INDEX `fk_Plantel_tiene_Galpon_Galpon1_idx` (`Galpon_Numero` ASC),
  INDEX `fk_Plantel_tiene_Galpon_Plantel1_idx` (`Plantel_Codigo` ASC),
  CONSTRAINT `fk_Plantel_tiene_Galpon_Plantel1`
    FOREIGN KEY (`Plantel_Codigo`)
    REFERENCES `practica2_granja`.`Plantel` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plantel_tiene_Galpon_Galpon1`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `practica2_granja`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Provincia` (
  `Nombre` VARCHAR(45) NULL,
  `idProv` INT NOT NULL,
  PRIMARY KEY (`idProv`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Localidad` (
  `Nombre` VARCHAR(45) NULL,
  `idLocalidad` INT NOT NULL,
  PRIMARY KEY (`idLocalidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Factura` (
  `IdFactura` INT NOT NULL,
  `Clientes_Cuit` VARCHAR(45) NOT NULL,
  `Fecha_Venta` DATE NULL,
  PRIMARY KEY (`IdFactura`, `Clientes_Cuit`),
  INDEX `fk_Clientes_tiene_Productos_Clientes1_idx` (`Clientes_Cuit` ASC),
  CONSTRAINT `fk_Clientes_tiene_Productos_Clientes1`
    FOREIGN KEY (`Clientes_Cuit`)
    REFERENCES `practica2_granja`.`Clientes` (`Cuit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Detalle_Factura` (
  `Factura_IdFactura` INT NOT NULL,
  `Productos_Codigo_prod` INT NOT NULL,
  `Cantidad_prod` INT NULL,
  `Precio` INT NULL,
  PRIMARY KEY (`Factura_IdFactura`, `Productos_Codigo_prod`),
  INDEX `fk_Productos_has_Factura_Factura1_idx` (`Factura_IdFactura` ASC),
  INDEX `fk_Productos_has_Factura_Productos1_idx` (`Productos_Codigo_prod` ASC),
  CONSTRAINT `fk_Productos_has_Factura_Productos1`
    FOREIGN KEY (`Productos_Codigo_prod`)
    REFERENCES `practica2_granja`.`Productos` (`Codigo_prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Factura_Factura1`
    FOREIGN KEY (`Factura_IdFactura`)
    REFERENCES `practica2_granja`.`Factura` (`IdFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Provincia_has_Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Provincia_has_Localidad` (
  `Provincia_idProv` INT NOT NULL,
  `Localidad_idLocalidad` INT NOT NULL,
  PRIMARY KEY (`Provincia_idProv`, `Localidad_idLocalidad`),
  INDEX `fk_Provincia_has_Localidad_Localidad1_idx` (`Localidad_idLocalidad` ASC),
  INDEX `fk_Provincia_has_Localidad_Provincia1_idx` (`Provincia_idProv` ASC),
  CONSTRAINT `fk_Provincia_has_Localidad_Provincia1`
    FOREIGN KEY (`Provincia_idProv`)
    REFERENCES `practica2_granja`.`Provincia` (`idProv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Provincia_has_Localidad_Localidad1`
    FOREIGN KEY (`Localidad_idLocalidad`)
    REFERENCES `practica2_granja`.`Localidad` (`idLocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `practica2_granja`.`Calle_has_Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `practica2_granja`.`Calle_has_Localidad` (
  `Calle_idCalle` INT NOT NULL,
  `Localidad_idLocalidad` INT NOT NULL,
  PRIMARY KEY (`Calle_idCalle`, `Localidad_idLocalidad`),
  INDEX `fk_Calle_has_Localidad_Localidad1_idx` (`Localidad_idLocalidad` ASC),
  INDEX `fk_Calle_has_Localidad_Calle1_idx` (`Calle_idCalle` ASC),
  CONSTRAINT `fk_Calle_has_Localidad_Calle1`
    FOREIGN KEY (`Calle_idCalle`)
    REFERENCES `practica2_granja`.`Calle` (`idCalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calle_has_Localidad_Localidad1`
    FOREIGN KEY (`Localidad_idLocalidad`)
    REFERENCES `practica2_granja`.`Localidad` (`idLocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*PROCEDURES DE ALTAS:*/

/*Alta Provincias*/
DELIMITER $$
create procedure Alta_Provincia(IN _idProv int,IN _Nombre varchar(45))
begin
	insert into Provincia values(_Nombre,_idProv);
end$$

delimiter ;

/*Alta prov_has_localid*/
DELIMITER $$
create procedure Alta_Prov_has_localidad(IN _idProv int,IN idLocalidad int)
begin
	insert into Provincia values(_idProv,idLocalidad);
end$$

delimiter ;

/*Alta Localidad*/
DELIMITER $$
create procedure Alta_Localidad(IN NombreLoc varchar(45),IN idLocalidad int)
begin
	insert into Provincia values(NombreLoc,idLocalidad);
end$$

delimiter ;

/*Alta calle_has_localid*/
DELIMITER $$
create procedure Alta_Calle_has_localidad(IN _idCalle int,IN idLocalidad int)
begin
	insert into Provincia values(_idCalle,idLocalidad);
end$$

delimiter ;

/*Alta calle*/
DELIMITER $$
create procedure Alta_Calle(IN _nomCalle varchar(45),IN _idCalle int)
begin
	insert into Provincia values(_nomCalle,_idCalle);
end$$
delimiter ;


/*ALTA Clientes*/
delimiter $$
CREATE PROCEDURE Alta_clientes(IN _Nombre varchar(45),IN _Cuit varchar(45),IN _numDom int, _Calle varchar(45))
begin
	insert into clientes values(_Nombre,_Cuit,_numDom,_Calle);
end$$
delimiter ;


/*ALTA Cabañas*/
delimiter $$
create procedure Alta_cabaña(IN _RazonSocial varchar(45),IN _idCab int ,IN _Cuit varchar(45),IN _numDom int,IN _Calle varchar(45))
begin
	insert into cabaña values(_RazonSocial,_idCab,_Cuit,_numDom,_Calle);
end $$
delimiter ;


/*ALTA Genetica*/
delimiter $$
create procedure Alta_Genetica(IN _Codigo int,IN _Nombre varchar(45),IN _idCabaña int)
begin
	insert into genetica values(_Codigo,_Nombre,_idCabaña);
end$$
delimiter ;



/*ALTA Plantel*/
delimiter $$
create procedure Alta_Plantel(IN _Codigo int,IN _Nombre varchar(45), IN _EdadGallinas int,IN _FechaEntrada date,IN _PrecioCompra varchar(45),IN _CodGenetica int)
begin
	insert into Plantel values(_Codigo,_Nombre,_EdadGallinas,_FechaEntrada,_PrecioCompra,_CodGenetica);
end$$
delimiter ;


/*ALTA Plantel_tien_Galpon*/
delimiter $$
create procedure Alta_Plantel_Tiene_Galpon(IN _codPlantel int,IN _codGalpon int)
begin
	insert into Plantel_Tiene_Galpon values(_codPlantel,_codGalpon);
end$$
delimiter ;



/*ALTA Galpon*/
DELIMITER $$
CREATE PROCEDURE Alta_Galpon(IN _Numero int,IN _ctdGallinas int)
begin
	insert into galpon values(_Numero,_ctdGallinas);
end$$
delimiter ;


/*Alta Planilla*/
delimiter $$
create procedure Alta_Planilla (IN _idPlanilla int,IN _Fecha date,IN _ctdHuevos int,IN _ctdAlimento int, IN _tipoAlimento varchar(45),IN _ctdMuertas int,IN _Novedad text,IN _numGalpon int)
begin
	insert into Planilla values(_idPlanilla,_Fecha,_ctdHuevos,_ctdAlimento,_tipoAlimento,_ctdMuertas,_Novedad,_numGalpon);
end$$
delimiter ;


/*Alta Empaque*/
delimiter $$
create procedure Alta_Empaque(IN _idEmpaque int,IN _Descripcion varchar(45),IN _ctdHuevos int)
begin
	insert into Empaque values(_IdEmpaque,_Descripcion,_ctdHuevos);
end$$
delimiter ;

/*Alta Productos*/
delimiter $$
create procedure Alta_Productos(IN _CodigoProd int,IN _PrecioVenta int,IN idEmpaque int)
begin
	insert into Productos values(_Codigoprod,_PrecioVenta,idEmpaque);
end$$
delimiter ;


/*Alta factura*/
delimiter $$
create procedure Alta_Factura(IN _idFactura int,IN cuit_Cliente varchar(45),IN _FechaVenta date)
begin
	insert into Factura values(_idFactura,cuit_Cliente,_FechaVenta);
end$$

delimiter ;

/*Alta Detalle_Factura*/
delimiter $$
create procedure Alta_Detalle_Factura(IN idFactura int,IN codProd int,IN cantProd int,IN Precio int )
begin
	insert into Detalle_Factura values(idFactura,codProd,cantProd,Precio);
end$$
delimiter ;

/**************************************FIN PROCDURES ALTA***************/
/***********************************************************************/
/********************COMIENZO PROCEDURES DE MODIFICACION******************/

/*Modificacion provincia*/
delimiter $$
create procedure Modificacion_Provincia(IN idInicial int, IN _Nombre varchar(45),IN _idProv int)
begin
	update Provincia set Nombre=_Nombre, idProv=_idProv
    where idProv=idInicial;
end$$
delimiter ;

/*Modificacion prov_has_localidad*/
delimiter $$
create procedure Modificacion_Prov_Has_loc(IN codLocalidad_orig int,IN codProv int,codLocalidad int)
begin
	update provincia_has_localidad set Localidad_idLocalidad=codLocalidad
    where Provincia_idProv=codProv and Localidad_idLocalidad=codLocalidad_orig;
end$$
delimiter ;

/*Modificacion Localidad*/
delimiter $$
create procedure Modificacion_Localidad(IN idLoc_orig int,IN idLoc_nuevo int,IN nomLoc varchar(45))
begin
	update Localidad set idLocalidad=idLoc_nuevo,Nombre=nomLoc
    where idLocalidad=idLoc_orig;
end$$
delimiter ;
 
 
 /*Modifcacion Calle_has_Localidad*/
delimiter $$
create procedure Modificacion_Calle_has_localidad(IN idLoc int,IN idCalle_orig int ,in idCalle_nueva int)
begin
	update Calle_Has_Localidad set Calle_idCalle=idCalle_nueva
    where Calle_idCalle=idCalle_orig and Localidad_idLocalidad=idLoc;
end$$
delimiter ;

/*Modificacion Calle*/
delimiter $$
create procedure Modifcacion_Calle(IN idCalle_orig int,in idCalle_nuevo int,in nomCalle varchar(45))
begin
	update Calle set Nombre=nomCalle,idCalle=idCalle_nuevo
    where idCalle=idCalle_orig;
end $$
delimiter ;

/*Modificacion Clientes*/
delimiter $$
create procedure Modificacion_Clientes(IN cuit_orig int,IN _Nombre varchar(45),IN _Cuit varchar(45),IN _numDom int,IN idCalle int)
begin
	update Clientes set Nombre=_Nombre,Cuit=_Cuit,num_Dom=_numDom,Calle_idCalle=idCalle
    where Cuit=cuit_orig;
end$$
delimiter ;


/*Modificacion Factura*/
delimiter $$
create procedure Modificacion_Factura(IN idFact_Orig int,IN idFact int,IN _Cuit varchar(45),IN _fechaVenta date)
begin
	update Factura set idFactura=idFact,Clientes_Cuit=_Cuit,Fecha_Venta=_fechaVenta
    where Factura.idFactura=idFact_Orig;
end$$
delimiter ;

/*Modificacion detalle factura*/
delimiter $$
create procedure Modificacion_Detalle_Factura(IN idFact int,IN idProd_orig int,IN idProd_nuevo int,IN cant int,IN _precio int)/*tomo una factura (por id), luego un producto, y cambio esos 3 datos (prod,cant y precio)*/
begin
	update Detalle_Factura set Productos_Codigo_prod=idProd_nuevo,Cantidad_prod=cant,Precio=_precio
    where Detalle_Factura.Factura_IdFactura=idFact;
end$$
delimiter ;

/*Modificacion productos*/
delimiter $$
create procedure Modificacion_Productos(IN idProd_orig int,IN idProd_nuevo int,IN precioVenta int, idEmpaque int)
begin
	update Productos set Codigo_Prod=idProd_nuevo,Precio_Venta=precioVenta,Empaque_idEmpaque=idEmpaque
    where Productos.Codigo_Prod=idProd_orig;
end$$
delimiter ;


/*Modificacion empaque*/
delimiter $$
create procedure Modificacion_Empaque(IN _idEmpaque_orig int,IN _idEmpaque_nuevo int,IN _DescripEmpaque varchar(45),IN _ctdHuevos int)
begin
	update Empaque set idEmpaque=_idEmpaque_nuevo,Descripcion=_DescripEmpaque,Ctdad_Huevos=_ctdHuevos
    where Empaque.idEmpaque=_idEmpaque_orig;
end$$
delimiter ;

/*Modificacion Cabaña*/
delimiter $$
create procedure Modificacion_Cabaña(IN idCab_orig int,IN _RazonSocial varchar(45), IN idCab_nuevo int,IN _Cuit varchar(45),IN _NumDom int,IN idCalle int)
begin
	update Cabaña set Razon_Social=_RazonSocial,id_Cabaña=idCab_nuevo,Cuit=_Cuit,Num_Dom=_NumDom,Calle_idCalle=idCalle
    where Cabaña.id_Cabaña=idCar_orig;
end$$
delimiter ;

/*Modificacion Genetica*/
delimiter $$
create procedure Modificacion_Genetica(IN codGen_orig int,IN codGen_nuevo int,IN nomGen varchar(45),IN idCabaña int)
begin
	update Genetica set Codigo=codGen_nuevo,Nombre=nomGen,Cabaña_id_Cabaña=idCabaña
    where Genetica.Codigo=codGen_orig;
end$$
delimiter ;



-- alter table Plantel modify column precio_compra int;
/*Modificacion Plantel*/
delimiter $$
create procedure Modificacion_Plantel(IN cod_orig int,IN cod_nuevo int,IN _Nombre varchar(45),IN _edadGallinas int,IN _FechaEntrada date,IN _precioCompra int,IN Gen_Cod int)
begin
	update Plantel set Codigo=cod_nuevo,Nombre=_Nombre,Edad_Gallinas=_edadGallinas,Fecha_Entrada=_FechaEntrada,Precio_Compra=_precioCompra,Genetica_Codigo=Gen_Cod
    where Plantel.Codigo=cod_orig;
end$$
delimiter ;


/*Modificaicon Plantel_Tiene_Galpon*/
delimiter $$
create procedure Modificacion_Plantel_Tiene_Galpon(IN idPlantel_orig int,IN idPlantel_nuevo int,IN idGalpon int) /* tomo un galpon y le cambio el plantel*/
begin
	update Plantel_tiene_Galpon set Plantel_Codigo=idPlantel_nuevo,Galpon_Numero=idGalpon
    where Plantel_Codigo=idPlantel_orig and Galpon_Numero=idGalpon;
end$$
delimiter ;


/*Modificacion Galpon*/
delimiter $$
create procedure Modificacion_Galpon (IN numGalpon_orig int,IN numGalpon_nuevo int,IN ctdGallinas int)
begin
	update Galpon set Numero=numGalpon_nuevo,Ctdad_Gallinas=ctdGallinas
    where Numero=numGalpon_orig;
end$$
delimiter ;


/*Modificacion Planilla*/
delimiter $$
create procedure Modificacion_Planilla(IN idPlan_orig int,IN idPlan_nuevo int,IN _Fecha date,IN _ctdHuevos int,IN _ctdAlim int,IN tipoAlim varchar(45),IN ctdMuertes int,IN _Novedad text,IN NumGalpon int)
begin
	update Planilla set idPlanilla=idPlan_nuevo,Fecha=_Fecha,ctdad_huevos=_ctdHuevos,cant_alimento=_ctdAlim,
    tipo_Alimento=tipoAlim,ctdad_Muertas=ctdMuertes,novedades=_Novedad,Galpon_Numero=numGalpon
    where Planilla.idPlanilla=idPlan_orig;
end$$
delimiter ;


/*====================FIN PROCEDURES MODIFICACION========================*/
/********************COMIENZO PROCEDURES DE BAJA******************/

/*Baja provincia*/
delimiter $$
create procedure Baja_Provincia(_idProv int)
begin
	delete from Provincia where idProv=_idProv limit 1;
end$$
delimiter ;

/*Baja Localidad*/
delimiter $$
create procedure Baja_Localidad(_idLocal int)
begin
	delete from Localidad where idLocalidad=_idLocal limit 1;
end$$
delimiter ;

/*Baja Prov_Has_Localidad*/
delimiter $$
create procedure Baja_Prov_Has_Local( id_prov int ,id_Loc int) #Como es una tabla compuesta por dos FK, se utilizan las dos FK.
begin
	delete from Provincia_Has_Localidad where Provincia_Has_Localidad.Provincia_idProv=id_Prov and Provincia_Has_Localidad.Localidad_idLocalidad=id_Loc;
end$$
delimiter ;

/*Baja Calle*/
delimiter $$
create procedure Baja_Calle(_idCalle int)
begin
	delete from Calle where idCalle=_idCalle limit 1;
end$$
delimiter ;

/*Baja Calle_Has_Localidad*/
delimiter $$
create procedure Baja_Calle_Has_Localidad(_idLocalid int, _idCalle int )
begin 
	delete from Calle_Has_Localidad where Calle_Has_Localidad.Calle_idCalle=idCalle and Calle_Has_Localidad.Localidad_idLocalidad;
end$$
delimiter ;


/*Baja Cabaña*/
delimiter $$
create procedure Baja_Cabaña(_idCabaña int)
begin
	delete from Cabaña where id_Cabaña=_idCabaña limit 1;
end$$
delimiter ;


/*falta: desde clientes a empaque y desde genetica a planilla*/









