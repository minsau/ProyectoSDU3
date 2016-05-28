-- MySQL Script generated by MySQL Workbench
-- 05/28/16 17:20:25
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema James
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema James
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `James` DEFAULT CHARACTER SET latin1 ;
USE `James` ;

-- -----------------------------------------------------
-- Table `James`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(60) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NOT NULL,
  `password` CHAR(64) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `tipo` INT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nombre_curso` VARCHAR(45) NOT NULL,
  `descripcion_curso` TEXT NULL,
  `costo` FLOAT NOT NULL DEFAULT 0.0,
  `fecha_inicio` DATE NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Tutorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Tutorial` (
  `id_tutorial` INT NOT NULL,
  `nombre_tutorial` VARCHAR(45) NOT NULL,
  `descripcion_tutorial` VARCHAR(45) NULL,
  `visitas` INT NULL DEFAULT 0,
  `like` INT NULL DEFAULT 0,
  `tipo` INT NULL,
  `tiempo` TIMESTAMP NULL,
  `id_curso` INT NOT NULL,
  `id_comentario` INT NOT NULL,
  PRIMARY KEY (`id_tutorial`, `id_curso`, `id_comentario`),
  INDEX `fk_Tutorial_Curso1_idx` (`id_curso` ASC),
  INDEX `fk_Tutorial_Comentario1_idx` (`id_comentario` ASC),
  CONSTRAINT `fk_Tutorial_Curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `James`.`Curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutorial_Comentario1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `James`.`Comentario` (`id_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(200) NOT NULL,
  `fecha` TIMESTAMP NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_comentario`, `id_usuario`),
  INDEX `fk_Comentario_Usuario1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `James`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Recurso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Recurso` (
  `id_recurso` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_recurso` VARCHAR(50) NOT NULL,
  `id_tutorial` INT(11) NOT NULL,
  PRIMARY KEY (`id_recurso`),
  INDEX `id_tutorial` (`id_tutorial` ASC),
  CONSTRAINT `Recurso_ibfk_1`
    FOREIGN KEY (`id_tutorial`)
    REFERENCES `James`.`Tutorial` (`id_tutorial`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `James`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(60) NULL,
  `direccion` VARCHAR(100) NULL,
  `telefono` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NOT NULL,
  `password` CHAR(64) NOT NULL,
  `fecha_nacimiento` DATE NULL,
  `tipo` INT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Curso` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nombre_curso` VARCHAR(45) NOT NULL,
  `descripcion_curso` TEXT NULL,
  `costo` FLOAT NOT NULL DEFAULT 0.0,
  `fecha_inicio` DATE NOT NULL,
  PRIMARY KEY (`id_curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `comentario` VARCHAR(200) NOT NULL,
  `fecha` TIMESTAMP NULL,
  `id_usuario` INT NOT NULL,
  PRIMARY KEY (`id_comentario`, `id_usuario`),
  INDEX `fk_Comentario_Usuario1_idx` (`id_usuario` ASC),
  CONSTRAINT `fk_Comentario_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `James`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Tutorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Tutorial` (
  `id_tutorial` INT NOT NULL,
  `nombre_tutorial` VARCHAR(45) NOT NULL,
  `descripcion_tutorial` VARCHAR(45) NULL,
  `visitas` INT NULL DEFAULT 0,
  `like` INT NULL DEFAULT 0,
  `tipo` INT NULL,
  `tiempo` TIMESTAMP NULL,
  `id_curso` INT NOT NULL,
  `id_comentario` INT NOT NULL,
  PRIMARY KEY (`id_tutorial`, `id_curso`, `id_comentario`),
  INDEX `fk_Tutorial_Curso1_idx` (`id_curso` ASC),
  INDEX `fk_Tutorial_Comentario1_idx` (`id_comentario` ASC),
  CONSTRAINT `fk_Tutorial_Curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `James`.`Curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tutorial_Comentario1`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `James`.`Comentario` (`id_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Pago` (
  `id_pago` INT NOT NULL AUTO_INCREMENT,
  `cuenta` VARCHAR(50) NOT NULL,
  `cantidad` FLOAT NOT NULL,
  `fecha_pago` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pago`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Usuario_has_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Usuario_has_Curso` (
  `id_usuario` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `estado` INT NOT NULL,
  `id_pago` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_curso`, `id_pago`),
  INDEX `fk_Usuario_has_Curso_Curso1_idx` (`id_curso` ASC),
  INDEX `fk_Usuario_has_Curso_Usuario1_idx` (`id_usuario` ASC),
  INDEX `fk_Usuario_has_Curso_Pago1_idx` (`id_pago` ASC),
  CONSTRAINT `fk_Usuario_has_Curso_Usuario1`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `James`.`Usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Curso_Curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `James`.`Curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Curso_Pago1`
    FOREIGN KEY (`id_pago`)
    REFERENCES `James`.`Pago` (`id_pago`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`Categoria_has_Curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`Categoria_has_Curso` (
  `id_categoria` INT NOT NULL,
  `id_curso` INT NOT NULL,
  PRIMARY KEY (`id_categoria`, `id_curso`),
  INDEX `fk_Categoria_has_Curso_Curso1_idx` (`id_curso` ASC),
  INDEX `fk_Categoria_has_Curso_Categoria1_idx` (`id_categoria` ASC),
  CONSTRAINT `fk_Categoria_has_Curso_Categoria1`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `James`.`Categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Categoria_has_Curso_Curso1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `James`.`Curso` (`id_curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `James`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `James`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;