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


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Planilla` (
  `Galpon_Numero` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `ctdad_huevos` INT NULL,
  `cant_alimento` INT NULL,
  `tipo_alimento` VARCHAR(45) NULL,
  `ctdad_muertas` INT NULL,
  `novedades` TEXT NULL,
  `Legajo_Usuario` VARCHAR(45) NULL,
  `fechaHora_Insert` DATETIME NULL,
  INDEX `fk_Planilla_Galpon1_idx` (`Galpon_Numero` ASC),
  INDEX `fk_Planilla_Usuarios1_idx` (`Legajo_Usuario` ASC),
  PRIMARY KEY (`Galpon_Numero`, `Fecha`),
  CONSTRAINT `fk_Planilla_Galpon1`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `granja_tpCuatrimestral`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planilla_Usuarios1`
    FOREIGN KEY (`Legajo_Usuario`)
    REFERENCES `granja_tpCuatrimestral`.`Usuarios` (`Legajo_Interno`)
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
-- Table `granja_tpCuatrimestral`.`Planilla_LOG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Planilla_LOG` (
  `IdPlanillaLOG` INT NOT NULL AUTO_INCREMENT,
  `Galpon_Numero` INT NOT NULL,
  `Fecha` DATE NOT NULL,
  `ctdad_huevos` INT NULL,
  `cant_alimento` INT NULL,
  `tipo_alimento` VARCHAR(45) NULL,
  `ctdad_muertas` INT NULL,
  `novedades` TEXT NULL,
  `Legajo_Usuario` VARCHAR(45) NULL,
  `fechaHora_Insert` DATETIME NULL,
  INDEX `fk_Planilla_Galpon1_idx` (`Galpon_Numero` ASC),
  INDEX `fk_Planilla_Usuarios1_idx` (`Legajo_Usuario` ASC),
  PRIMARY KEY (`IdPlanillaLOG`),
  UNIQUE INDEX `IdPlanillaLOG_UNIQUE` (`IdPlanillaLOG` ASC),
  CONSTRAINT `fk_Planilla_Galpon10`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `granja_tpCuatrimestral`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planilla_Usuarios10`
    FOREIGN KEY (`Legajo_Usuario`)
    REFERENCES `granja_tpCuatrimestral`.`Usuarios` (`Legajo_Interno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
