-- MySQL Workbench Forward Engineering

/*VERSION FINAL DEL SQL --> 3.0*/

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema granja_tpCuatrimestral
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema granja_tpCuatrimestral
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `granja_tpCuatrimestral` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `granja_tpCuatrimestral` ;

-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Calle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Calle` (
  `Nombre` VARCHAR(45) NOT NULL COMMENT '',
  `idCalle` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idCalle`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Cabaña`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Cabaña` (
  `Razon_social` VARCHAR(45) NULL COMMENT '',
  `id_Cabaña` INT NOT NULL COMMENT '',
  `Cuit` VARCHAR(45) NULL COMMENT '',
  `Num_dom` INT NULL COMMENT '',
  `Calle_idCalle` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id_Cabaña`)  COMMENT '',
  INDEX `fk_Cabaña_Calle1_idx` (`Calle_idCalle` ASC)  COMMENT '',
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
  `Codigo` INT NOT NULL COMMENT '',
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `Cabaña_id_Cabaña` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Codigo`)  COMMENT '',
  INDEX `fk_Genetica_Cabaña_idx` (`Cabaña_id_Cabaña` ASC)  COMMENT '',
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
  `Codigo` INT NOT NULL COMMENT '',
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `Edad_Gallinas` INT NULL COMMENT '',
  `Fecha_Entrada` DATE NULL COMMENT '',
  `Precio_Compra` INT NULL COMMENT '',
  `Genetica_Codigo` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Codigo`)  COMMENT '',
  INDEX `fk_Plantel_Genetica1_idx` (`Genetica_Codigo` ASC)  COMMENT '',
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
  `Numero` INT NOT NULL COMMENT '',
  `Ctdad_Gallinas` INT NULL COMMENT '',
  PRIMARY KEY (`Numero`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Usuarios` (
  `Nombre` VARCHAR(20) NULL COMMENT '',
  `Apellido` VARCHAR(45) NULL COMMENT '',
  `Legajo_Interno` VARCHAR(45) NOT NULL COMMENT '',
  `Cuil` VARCHAR(45) NULL COMMENT '',
  `Username` VARCHAR(45) NULL COMMENT '',
  `Password` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`Legajo_Interno`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Planilla`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Planilla` (
  `Galpon_Numero` INT NOT NULL COMMENT '',
  `Fecha` DATE NOT NULL COMMENT '',
  `ctdad_huevos` INT NULL COMMENT '',
  `cant_alimento` INT NULL COMMENT '',
  `tipo_alimento` VARCHAR(45) NULL COMMENT '',
  `ctdad_muertas` INT NULL COMMENT '',
  `novedades` TEXT NULL COMMENT '',
  `Legajo_Usuario` VARCHAR(45) NOT NULL COMMENT '',
  `FechaHora_Insert` DATETIME NULL COMMENT '',
  PRIMARY KEY (`Galpon_Numero`, `Fecha`)  COMMENT '',
  INDEX `fk_Planilla_Galpon1_idx` (`Galpon_Numero` ASC)  COMMENT '',
  INDEX `fk_Planilla_Usuarios1_idx` (`Legajo_Usuario` ASC)  COMMENT '',
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
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `Cuit` VARCHAR(45) NOT NULL COMMENT '',
  `Num_dom` INT NULL COMMENT '',
  `Calle_idCalle` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Cuit`)  COMMENT '',
  INDEX `fk_Clientes_Calle1_idx` (`Calle_idCalle` ASC)  COMMENT '',
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
  `idEmpaque` INT NOT NULL COMMENT '',
  `Descripcion` VARCHAR(45) NULL COMMENT '',
  `Ctdad_Huevos` INT NULL COMMENT '',
  PRIMARY KEY (`idEmpaque`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Productos` (
  `Codigo_prod` INT NOT NULL COMMENT '',
  `Precio_Venta` INT NULL COMMENT '',
  `Empaque_idEmpaque` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Codigo_prod`)  COMMENT '',
  INDEX `fk_Productos_Empaque1_idx` (`Empaque_idEmpaque` ASC)  COMMENT '',
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
  `Plantel_Codigo` INT NOT NULL COMMENT '',
  `Galpon_Numero` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Plantel_Codigo`, `Galpon_Numero`)  COMMENT '',
  INDEX `fk_Plantel_tiene_Galpon_Galpon1_idx` (`Galpon_Numero` ASC)  COMMENT '',
  INDEX `fk_Plantel_tiene_Galpon_Plantel1_idx` (`Plantel_Codigo` ASC)  COMMENT '',
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
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `idProv` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idProv`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Localidad` (
  `Nombre` VARCHAR(45) NULL COMMENT '',
  `idLocalidad` INT NOT NULL COMMENT '',
  PRIMARY KEY (`idLocalidad`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Factura` (
  `IdFactura` INT NOT NULL COMMENT '',
  `Clientes_Cuit` VARCHAR(45) NOT NULL COMMENT '',
  `Fecha_Venta` DATE NULL COMMENT '',
  PRIMARY KEY (`IdFactura`)  COMMENT '',
  INDEX `fk_Clientes_tiene_Productos_Clientes1_idx` (`Clientes_Cuit` ASC)  COMMENT '',
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
  `Factura_IdFactura` INT NOT NULL COMMENT '',
  `Productos_Codigo_prod` INT NOT NULL COMMENT '',
  `Cantidad_prod` INT NULL COMMENT '',
  `Precio` INT NULL COMMENT '',
  PRIMARY KEY (`Factura_IdFactura`, `Productos_Codigo_prod`)  COMMENT '',
  INDEX `fk_Productos_has_Factura_Factura1_idx` (`Factura_IdFactura` ASC)  COMMENT '',
  INDEX `fk_Productos_has_Factura_Productos1_idx` (`Productos_Codigo_prod` ASC)  COMMENT '',
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
  `Provincia_idProv` INT NOT NULL COMMENT '',
  `Localidad_idLocalidad` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Provincia_idProv`, `Localidad_idLocalidad`)  COMMENT '',
  INDEX `fk_Provincia_has_Localidad_Localidad1_idx` (`Localidad_idLocalidad` ASC)  COMMENT '',
  INDEX `fk_Provincia_has_Localidad_Provincia1_idx` (`Provincia_idProv` ASC)  COMMENT '',
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
  `Calle_idCalle` INT NOT NULL COMMENT '',
  `Localidad_idLocalidad` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Calle_idCalle`, `Localidad_idLocalidad`)  COMMENT '',
  INDEX `fk_Calle_has_Localidad_Localidad1_idx` (`Localidad_idLocalidad` ASC)  COMMENT '',
  INDEX `fk_Calle_has_Localidad_Calle1_idx` (`Calle_idCalle` ASC)  COMMENT '',
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
  `IdPlanillaLOG` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Galpon_Numero` INT NOT NULL COMMENT '',
  `Fecha` DATE NULL COMMENT '',
  `ctdad_huevos` INT NULL COMMENT '',
  `cant_alimento` INT NULL COMMENT '',
  `tipo_alimento` VARCHAR(45) NULL COMMENT '',
  `ctdad_muertas` INT NULL COMMENT '',
  `novedades` TEXT NULL COMMENT '',
  `Legajo_Usuario` VARCHAR(45) NOT NULL COMMENT '',
  `FechaHora_Insert` DATETIME NULL COMMENT '',
  PRIMARY KEY (`IdPlanillaLOG`)  COMMENT '',
  INDEX `fk_Planilla_Galpon1_idx` (`Galpon_Numero` ASC)  COMMENT '',
  INDEX `fk_Planilla_Usuarios1_idx` (`Legajo_Usuario` ASC)  COMMENT '',
  CONSTRAINT `fk_Planilla_Galpon11`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `granja_tpCuatrimestral`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planilla_Usuarios11`
    FOREIGN KEY (`Legajo_Usuario`)
    REFERENCES `granja_tpCuatrimestral`.`Usuarios` (`Legajo_Interno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `granja_tpCuatrimestral`.`Planilla_LOG`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `granja_tpCuatrimestral`.`Planilla_LOG` (
  `IdPlanillaLOG` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Galpon_Numero` INT NOT NULL COMMENT '',
  `Fecha` DATE NULL COMMENT '',
  `ctdad_huevos` INT NULL COMMENT '',
  `cant_alimento` INT NULL COMMENT '',
  `tipo_alimento` VARCHAR(45) NULL COMMENT '',
  `ctdad_muertas` INT NULL COMMENT '',
  `novedades` TEXT NULL COMMENT '',
  `Legajo_Usuario` VARCHAR(45) NOT NULL COMMENT '',
  `FechaHora_Insert` DATETIME NULL COMMENT '',
  PRIMARY KEY (`IdPlanillaLOG`)  COMMENT '',
  INDEX `fk_Planilla_Galpon1_idx` (`Galpon_Numero` ASC)  COMMENT '',
  INDEX `fk_Planilla_Usuarios1_idx` (`Legajo_Usuario` ASC)  COMMENT '',
  CONSTRAINT `fk_Planilla_Galpon11`
    FOREIGN KEY (`Galpon_Numero`)
    REFERENCES `granja_tpCuatrimestral`.`Galpon` (`Numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Planilla_Usuarios11`
    FOREIGN KEY (`Legajo_Usuario`)
    REFERENCES `granja_tpCuatrimestral`.`Usuarios` (`Legajo_Interno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;











