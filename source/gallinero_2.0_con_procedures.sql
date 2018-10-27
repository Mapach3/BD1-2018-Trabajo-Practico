-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema granja_tpCuatrimestral
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema granja_tpCuatrimestral
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `granja_tpCuatrimestral` DEFAULT CHARACTER SET utf8 ;
USE `granja_tpCuatrimestral` ;

-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Calle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Calle` (
  `Nombre` VARCHAR(45) NOT NULL,
  `idCalle` INT NOT NULL,
  PRIMARY KEY (`idCalle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Cabaña`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Cabaña` (
  `Razon_social` VARCHAR(45) NULL,
  `id_Cabaña` INT NOT NULL,
  `Cuit` VARCHAR(45) NULL,
  `Num_dom` INT NULL,
  `Calle_idCalle` INT NOT NULL,
  PRIMARY KEY (`id_Cabaña`),
  INDEX `fk_Cabaña_Calle1_idx` (`Calle_idCalle` ASC),
  CONSTRAINT `fk_Cabaña_Calle1`
    FOREIGN KEY (`Calle_idCalle`)
    REFERENCES `granja_tpCuatrimestral`.`Calle` (`idCalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Genetica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Genetica` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Cabaña_id_Cabaña` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Genetica_Cabaña_idx` (`Cabaña_id_Cabaña` ASC),
  CONSTRAINT `fk_Genetica_Cabaña`
    FOREIGN KEY (`Cabaña_id_Cabaña`)
    REFERENCES `granja_tpCuatrimestral`.`Cabaña` (`id_Cabaña`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Plantel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Plantel` (
  `Codigo` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Edad_Gallinas` INT NULL,
  `Fecha_Entrada` DATE NULL,
  `Precio_Compra` INT NULL,
  `Genetica_Codigo` INT NOT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `fk_Plantel_Genetica1_idx` (`Genetica_Codigo` ASC),
  CONSTRAINT `fk_Plantel_Genetica1`
    FOREIGN KEY (`Genetica_Codigo`)
    REFERENCES `granja_tpCuatrimestral`.`Genetica` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Galpon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Galpon` (
  `Numero` INT NOT NULL,
  `Ctdad_Gallinas` INT NULL,
  PRIMARY KEY (`Numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Planilla` (
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
    REFERENCES `granja_tpCuatrimestral`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Clientes` (
  `Nombre` VARCHAR(45) NULL,
  `Cuit` VARCHAR(45) NOT NULL,
  `Num_dom` INT NULL,
  `Calle_idCalle` INT NOT NULL,
  PRIMARY KEY (`Cuit`),
  INDEX `fk_Clientes_Calle1_idx` (`Calle_idCalle` ASC),
  CONSTRAINT `fk_Clientes_Calle1`
    FOREIGN KEY (`Calle_idCalle`)
    REFERENCES `granja_tpCuatrimestral`.`Calle` (`idCalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Empaque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Empaque` (
  `idEmpaque` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Ctdad_Huevos` INT NULL,
  PRIMARY KEY (`idEmpaque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Productos` (
  `Codigo_prod` INT NOT NULL,
  `Precio_Venta` INT NULL,
  `Empaque_idEmpaque` INT NOT NULL,
  PRIMARY KEY (`Codigo_prod`),
  INDEX `fk_Productos_Empaque1_idx` (`Empaque_idEmpaque` ASC),
  CONSTRAINT `fk_Productos_Empaque1`
    FOREIGN KEY (`Empaque_idEmpaque`)
    REFERENCES `granja_tpCuatrimestral`.`Empaque` (`idEmpaque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Plantel_tiene_Galpon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Plantel_tiene_Galpon` (
  `Plantel_Codigo` INT NOT NULL,
  `Galpon_Numero` INT NOT NULL,
  PRIMARY KEY (`Plantel_Codigo`, `Galpon_Numero`),
  INDEX `fk_Plantel_tiene_Galpon_Galpon1_idx` (`Galpon_Numero` ASC),
  INDEX `fk_Plantel_tiene_Galpon_Plantel1_idx` (`Plantel_Codigo` ASC),
  CONSTRAINT `fk_Plantel_tiene_Galpon_Plantel1`
    FOREIGN KEY (`Plantel_Codigo`)
    REFERENCES `granja_tpCuatrimestral`.`Plantel` (`Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Plantel_tiene_Galpon_Galpon1`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `granja_tpCuatrimestral`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Provincia` (
  `Nombre` VARCHAR(45) NULL,
  `idProv` INT NOT NULL,
  PRIMARY KEY (`idProv`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Localidad` (
  `Nombre` VARCHAR(45) NULL,
  `idLocalidad` INT NOT NULL,
  PRIMARY KEY (`idLocalidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Factura` (
  `IdFactura` INT NOT NULL,
  `Clientes_Cuit` VARCHAR(45) NOT NULL,
  `Fecha_Venta` DATE NULL,
  PRIMARY KEY (`IdFactura`),
  INDEX `fk_Clientes_tiene_Productos_Clientes1_idx` (`Clientes_Cuit` ASC),
  CONSTRAINT `fk_Clientes_tiene_Productos_Clientes1`
    FOREIGN KEY (`Clientes_Cuit`)
    REFERENCES `granja_tpCuatrimestral`.`Clientes` (`Cuit`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Detalle_Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Detalle_Factura` (
  `Factura_IdFactura` INT NOT NULL,
  `Productos_Codigo_prod` INT NOT NULL,
  `Cantidad_prod` INT NULL,
  `Precio` INT NULL,
  PRIMARY KEY (`Factura_IdFactura`, `Productos_Codigo_prod`),
  INDEX `fk_Productos_has_Factura_Factura1_idx` (`Factura_IdFactura` ASC),
  INDEX `fk_Productos_has_Factura_Productos1_idx` (`Productos_Codigo_prod` ASC),
  CONSTRAINT `fk_Productos_has_Factura_Productos1`
    FOREIGN KEY (`Productos_Codigo_prod`)
    REFERENCES `granja_tpCuatrimestral`.`Productos` (`Codigo_prod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_has_Factura_Factura1`
    FOREIGN KEY (`Factura_IdFactura`)
    REFERENCES `granja_tpCuatrimestral`.`Factura` (`IdFactura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Provincia_has_Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Provincia_has_Localidad` (
  `Provincia_idProv` INT NOT NULL,
  `Localidad_idLocalidad` INT NOT NULL,
  PRIMARY KEY (`Provincia_idProv`, `Localidad_idLocalidad`),
  INDEX `fk_Provincia_has_Localidad_Localidad1_idx` (`Localidad_idLocalidad` ASC),
  INDEX `fk_Provincia_has_Localidad_Provincia1_idx` (`Provincia_idProv` ASC),
  CONSTRAINT `fk_Provincia_has_Localidad_Provincia1`
    FOREIGN KEY (`Provincia_idProv`)
    REFERENCES `granja_tpCuatrimestral`.`Provincia` (`idProv`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Provincia_has_Localidad_Localidad1`
    FOREIGN KEY (`Localidad_idLocalidad`)
    REFERENCES `granja_tpCuatrimestral`.`Localidad` (`idLocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Calle_has_Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Calle_has_Localidad` (
  `Calle_idCalle` INT NOT NULL,
  `Localidad_idLocalidad` INT NOT NULL,
  PRIMARY KEY (`Calle_idCalle`, `Localidad_idLocalidad`),
  INDEX `fk_Calle_has_Localidad_Localidad1_idx` (`Localidad_idLocalidad` ASC),
  INDEX `fk_Calle_has_Localidad_Calle1_idx` (`Calle_idCalle` ASC),
  CONSTRAINT `fk_Calle_has_Localidad_Calle1`
    FOREIGN KEY (`Calle_idCalle`)
    REFERENCES `granja_tpCuatrimestral`.`Calle` (`idCalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Calle_has_Localidad_Localidad1`
    FOREIGN KEY (`Localidad_idLocalidad`)
    REFERENCES `granja_tpCuatrimestral`.`Localidad` (`idLocalidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Usuarios` (
  `Nombre` VARCHAR(20) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Legajo_Interno` VARCHAR(45) NOT NULL,
  `Cuil` VARCHAR(45) NULL,
  `Username` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`Legajo_Interno`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


/*============================ STORED PROCEDURES===============================*/
/*=============================================================================*/


/*Alta Provincias*/
DELIMITER $$
create procedure Alta_Provincia(IN _idProv int,IN _Nombre varchar(45))
begin
	insert into Provincia values(_Nombre,_idProv);
end$$
delimiter ;

#FUNCIONA


/*Alta prov_has_localid*/
DELIMITER $$
create procedure Alta_Prov_has_localidad(IN _idProv int,IN idLocalidad int)
begin
	insert into provincia_has_localidad values(_idProv,idLocalidad);
end$$
delimiter ;



/*Alta Localidad*/
DELIMITER $$
create procedure Alta_Localidad(IN NombreLoc varchar(45),IN idLocalidad int)
begin
	insert into localidad values(NombreLoc,idLocalidad);
end$$
delimiter ;
# call alta_localidad("Burzaco",1);
# FUNCIONA



/*Alta calle_has_localid*/
DELIMITER $$
create procedure Alta_Calle_has_localidad(IN _idCalle int,IN idLocalidad int)
begin
	insert into calle_has_localidad values(_idCalle,idLocalidad);
end$$

delimiter ;
#FUNCIONA


/*Alta calle*/
DELIMITER $$
create procedure Alta_Calle(IN _nomCalle varchar(45),IN _idCalle int)
begin
	insert into Calle values(_nomCalle,_idCalle);
end$$
delimiter ;
# call alta_calle("Baso",1);
# funciona

/*ALTA Clientes*/
delimiter $$
CREATE PROCEDURE Alta_clientes(IN _Nombre varchar(45),IN _Cuit varchar(45),IN _numDom int, _Calle varchar(45))
begin
	insert into clientes values(_Nombre,_Cuit,_numDom,_Calle);
end$$
delimiter ;
#FUNCIONA
#call alta_clientes(null,"22",2,1);


/*ALTA Cabañas*/
delimiter $$
create procedure Alta_cabaña(IN _RazonSocial varchar(45),IN _idCab int ,IN _Cuit varchar(45),IN _numDom int,IN _Calle varchar(45))
begin
	insert into cabaña values(_RazonSocial,_idCab,_Cuit,_numDom,_Calle);
end $$
delimiter ;
#funciona

/*ALTA Genetica*/
delimiter $$
create procedure Alta_Genetica(IN _Codigo int,IN _Nombre varchar(45),IN _idCabaña int)
begin
	insert into genetica values(_Codigo,_Nombre,_idCabaña);
end$$
delimiter ;
#funciona



/*ALTA Plantel*/
delimiter $$
create procedure Alta_Plantel(IN _Codigo int,IN _Nombre varchar(45), IN _EdadGallinas int,IN _FechaEntrada date,IN _PrecioCompra INT,IN _CodGenetica int)
begin
	insert into Plantel values(_Codigo,_Nombre,_EdadGallinas,_FechaEntrada,_PrecioCompra,_CodGenetica);
end$$
delimiter ;
#funciona


/*ALTA Plantel_tien_Galpon*/
delimiter $$
create procedure Alta_Plantel_Tiene_Galpon(IN _codPlantel int,IN _numGalpon int)
begin
	insert into Plantel_Tiene_Galpon values(_codPlantel,_numGalpon);
end$$
delimiter ;
#funciona


/*ALTA Galpon*/
DELIMITER $$
CREATE PROCEDURE Alta_Galpon(IN _Numero int,IN _ctdGallinas int)
begin
	insert into galpon values(_Numero,_ctdGallinas);
end$$
delimiter ;
#funciona


/*Alta Planilla*/
delimiter $$
create procedure Alta_Planilla (IN _idPlanilla int,IN _Fecha date,IN _ctdHuevos int,IN _ctdAlimento int, IN _tipoAlimento varchar(45),IN _ctdMuertas int,IN _Novedad text,IN _numGalpon int)
begin
	insert into Planilla values(_idPlanilla,_Fecha,_ctdHuevos,_ctdAlimento,_tipoAlimento,_ctdMuertas,_Novedad,_numGalpon);
end$$
delimiter ;
#funciona


/*Alta Empaque*/
delimiter $$
create procedure Alta_Empaque(IN _idEmpaque int,IN _Descripcion varchar(45),IN _ctdHuevos int)
begin
	insert into Empaque values(_IdEmpaque,_Descripcion,_ctdHuevos);
end$$
delimiter ;
#funciona



/*Alta Productos*/
delimiter $$
create procedure Alta_Productos(IN _CodigoProd int,IN _PrecioVenta int,IN idEmpaque int)
begin
	insert into Productos values(_Codigoprod,_PrecioVenta,idEmpaque);
end$$
delimiter ;
#funciona


/*Alta factura*/
delimiter $$
create procedure Alta_Factura(IN _idFactura int,IN cuit_Cliente varchar(45),IN _FechaVenta date)
begin
	insert into Factura values(_idFactura,cuit_Cliente,_FechaVenta);
end$$
delimiter ;
#funciona

/*Alta Detalle_Factura*/
delimiter $$
create procedure Alta_Detalle_Factura(IN idFactura int,IN codProd int,IN cantProd int,IN _Precio int )
begin
	insert into Detalle_Factura values(idFactura,codProd,cantProd,_Precio);
end$$
delimiter ;


/*PROCEDURE DE ALTA DE USUARIOS: VERIFICAR SI QUEDA ASI O DESPUES SE MODIFICA ====================================*/

/*Alta Usuarios*/
delimiter $$
create procedure Alta_Usuarios(IN _Nomb varchar(20),IN _Apellido varchar(20),IN _Legajo varchar(20), _Cuil varchar(25), _User varchar(24), _Pass varchar(20))
begin
	insert into Usuarios values(_Nomb,_Apellido,_Legajo,_Cuil,_User,_Pass);
end$$
delimiter ;


select * from usuarios;

# call alta_usuarios(null,null,"adsasd","asd123","Pedrito","VM");
# delete from usuarios;
			
            /*===========================================================================================================================================*/


/*==================PROCEDURES DE MODIFICACION========================*/
/*====================================================================*/

/*IMPORTANTE:: Las modificaciones cambian incluso el ID que se haya ingresado en la tabla, EXCEPTO EN LAS QUERYS QUE SE INDIQUE LO CONTRARIO*/

/*Modificacion provincia*/
delimiter $$
create procedure Modificacion_Provincia(IN idInicial int, IN _Nombre varchar(45),IN _idProv int)
begin
	update Provincia set Nombre=_Nombre, idProv=_idProv
    where idProv=idInicial;
end$$
delimiter ;
#FUNCIONA 



/*Modificacion prov_has_localidad*/
delimiter $$
create procedure Modificacion_Prov_Has_loc(IN codLocalidad_orig int,IN codProv int,codLocalidad int) #en este caso solo cambio la localidad y no el id de la provincia.
begin
	update provincia_has_localidad set Localidad_idLocalidad=codLocalidad
    where Provincia_idProv=codProv and Localidad_idLocalidad=codLocalidad_orig;
end$$
delimiter ;
#FUNCIONA



/*Modificacion Localidad*/
delimiter $$
create procedure Modificacion_Localidad(IN idLoc_orig int,IN idLoc_nuevo int,IN nomLoc varchar(45))
begin
	update Localidad set idLocalidad=idLoc_nuevo,Nombre=nomLoc
    where idLocalidad=idLoc_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Calle*/
delimiter $$
create procedure Modifcacion_Calle(IN idCalle_orig int,in idCalle_nuevo int,in nomCalle varchar(45))
begin
	update Calle set Nombre=nomCalle,idCalle=idCalle_nuevo
    where idCalle=idCalle_orig;
end $$
delimiter ;
#FUNCIONA

 /*Modifcacion Calle_has_Localidad*/
delimiter $$
create procedure Modificacion_Calle_has_localidad(IN idLoc int,IN idCalle_orig int ,in idCalle_nueva int) #solo cambio el id de la calle pero no el de la localidad
begin
	update Calle_Has_Localidad set Calle_idCalle=idCalle_nueva
    where Calle_idCalle=idCalle_orig and Localidad_idLocalidad=idLoc;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Clientes*/
delimiter $$
create procedure Modificacion_Clientes(IN cuit_orig int,IN _Nombre varchar(45),IN _Cuit varchar(45),IN _numDom int,IN idCalle int) 
begin
	update Clientes set Nombre=_Nombre,Cuit=_Cuit,num_Dom=_numDom,Calle_idCalle=idCalle
    where Cuit=cuit_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Factura*/
delimiter $$
create procedure Modificacion_Factura(IN idFact_Orig int,IN idFact int,IN _Cuit varchar(45),IN _fechaVenta date)
begin
	update Factura set idFactura=idFact,Clientes_Cuit=_Cuit,Fecha_Venta=_fechaVenta
    where Factura.idFactura=idFact_Orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion detalle factura*/
delimiter $$
create procedure Modificacion_Detalle_Factura(IN idFact int,IN idProd_orig int,IN idFact_nuevo int,IN idProd_nuevo int,IN cant int,IN _precio int)
begin
	update Detalle_Factura set Productos_Codigo_prod=idProd_nuevo,Cantidad_prod=cant,Precio=_precio,Factura_IdFactura=idFact_nuevo
    where Detalle_Factura.Factura_IdFactura=idFact and Detalle_Factura.Factura_Productos_Codigo_prod=idProd_orig;
end$$
delimiter ;
#Funciona

/*Modificacion productos*/
delimiter $$
create procedure Modificacion_Productos(IN idProd_orig int,IN idProd_nuevo int,IN precioVenta int, idEmpaque int)
begin
	update Productos set Codigo_Prod=idProd_nuevo,Precio_Venta=precioVenta,Empaque_idEmpaque=idEmpaque
    where Productos.Codigo_Prod=idProd_orig;
end$$
delimiter ;
#FUNCIONA

/*Modificacion empaque*/
delimiter $$
create procedure Modificacion_Empaque(IN _idEmpaque_orig int,IN _idEmpaque_nuevo int,IN _DescripEmpaque varchar(45),IN _ctdHuevos int)
begin
	update Empaque set idEmpaque=_idEmpaque_nuevo,Descripcion=_DescripEmpaque,Ctdad_Huevos=_ctdHuevos
    where Empaque.idEmpaque=_idEmpaque_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Cabaña*/
delimiter $$
create procedure Modificacion_Cabaña(IN idCab_orig int,IN _RazonSocial varchar(45), IN idCab_nuevo int,IN _Cuit varchar(45),IN _NumDom int,IN idCalle int)
begin
	update Cabaña set Razon_Social=_RazonSocial,id_Cabaña=idCab_nuevo,Cuit=_Cuit,Num_Dom=_NumDom,Calle_idCalle=idCalle
    where Cabaña.id_Cabaña=idCab_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Genetica*/
delimiter $$
create procedure Modificacion_Genetica(IN codGen_orig int,IN codGen_nuevo int,IN nomGen varchar(45),IN idCabaña int)
begin
	update Genetica set Codigo=codGen_nuevo,Nombre=nomGen,Cabaña_id_Cabaña=idCabaña
    where Genetica.Codigo=codGen_orig;
end$$
delimiter ;
#FUNCIONA


delimiter $$
create procedure Modificacion_Plantel(IN cod_orig int,IN cod_nuevo int,IN _Nombre varchar(45),IN _edadGallinas int,IN _FechaEntrada date,IN _precioCompra int,IN Gen_Cod int)
begin
	update Plantel set Codigo=cod_nuevo,Nombre=_Nombre,Edad_Gallinas=_edadGallinas,Fecha_Entrada=_FechaEntrada,Precio_Compra=_precioCompra,Genetica_Codigo=Gen_Cod
    where Plantel.Codigo=cod_orig;
end$$
delimiter ;
#FUNCIONA


delimiter $$
create procedure Modificacion_Plantel_Tiene_Galpon(IN idPlantel_orig int,IN idPlantel_nuevo int,IN idGalpon int,IN idGalpon_nuevo int)
begin
	update Plantel_tiene_Galpon set Plantel_Codigo=idPlantel_nuevo,Galpon_Numero=idGalpon_nuevo
    where Plantel_Codigo=idPlantel_orig and Galpon_Numero=idGalpon;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Galpon*/
delimiter $$
create procedure Modificacion_Galpon (IN numGalpon_orig int,IN numGalpon_nuevo int,IN ctdGallinas int)
begin
	update Galpon set Numero=numGalpon_nuevo,Ctdad_Gallinas=ctdGallinas
    where Numero=numGalpon_orig;
end$$
delimiter ;
#FUNCIONA


/*Modificacion Planilla*/
delimiter $$
create procedure Modificacion_Planilla(IN idPlan_orig int,IN idPlan_nuevo int,IN _Fecha date,IN _ctdHuevos int,IN _ctdAlim int,IN tipoAlim varchar(45),IN ctdMuertes int,IN _Novedad text,IN NumGalpon int)
begin
	update Planilla set idPlanilla=idPlan_nuevo,Fecha=_Fecha,ctdad_huevos=_ctdHuevos,cant_alimento=_ctdAlim,
    tipo_Alimento=tipoAlim,ctdad_Muertas=ctdMuertes,novedades=_Novedad,Galpon_Numero=numGalpon
    where Planilla.idPlanilla=idPlan_orig;
end$$
delimiter ;
#FUNCIONA


/*======PROCEDURE DE MODIFICACION DE USUARIO=====*/
delimiter $$
create procedure Modificacion_Usuarios(IN Legajo_orig varchar(45),IN _Nomb varchar(20),_Apellido varchar(23),IN Legajo_nuevo varchar(45), _Cuil varchar(45),
IN _User varchar(45),IN _Pass varchar(45))
begin
	update Usuarios set Nombre=_Nomb,Apellido=_Apellido,Legajo_Interno=Legajo_nuevo,Cuil=_Cuil,Username=_User,Usuarios.password=_Pass
    where Usuarios.Legajo_Interno=Legajo_orig;
end$$
delimiter ;
#PASSWORD ES UNA PALABRA RESERVADA, PERO IGUAL FUNCIONA.


/*===============FIN PROCEDURES DE MODIFICACIONES==================================================================*/













