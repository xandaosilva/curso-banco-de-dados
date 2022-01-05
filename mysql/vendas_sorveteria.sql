-- MySQL Script generated by MySQL Workbench
-- Wed Jan  5 20:41:29 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vendas_sorveteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vendas_sorveteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vendas_sorveteria` DEFAULT CHARACTER SET utf8 ;
USE `vendas_sorveteria` ;

-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`sabor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`sabor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`embalagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`embalagem` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`tipo_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`tipo_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_sabor` INT NOT NULL,
  `id_embalagem` INT NOT NULL,
  `id_tipo_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_picole_1_idx` (`id_sabor` ASC) VISIBLE,
  INDEX `fk_sabor_1_idx` (`id_embalagem` ASC) VISIBLE,
  INDEX `fk_picole_3_idx` (`id_tipo_picole` ASC) VISIBLE,
  CONSTRAINT `fk_picole_1`
    FOREIGN KEY (`id_sabor`)
    REFERENCES `vendas_sorveteria`.`sabor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picole_2`
    FOREIGN KEY (`id_embalagem`)
    REFERENCES `vendas_sorveteria`.`embalagem` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picole_3`
    FOREIGN KEY (`id_tipo_picole`)
    REFERENCES `vendas_sorveteria`.`tipo_picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`ingrediente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`ingrediente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`ingrediente_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`ingrediente_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_ingrediente` INT NOT NULL,
  `id_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ingrediente_picole_1_idx` (`id_ingrediente` ASC) VISIBLE,
  INDEX `fk_ingrediente_picole_2_idx` (`id_picole` ASC) VISIBLE,
  CONSTRAINT `fk_ingrediente_picole_1`
    FOREIGN KEY (`id_ingrediente`)
    REFERENCES `vendas_sorveteria`.`ingrediente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingrediente_picole_2`
    FOREIGN KEY (`id_picole`)
    REFERENCES `vendas_sorveteria`.`picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`aditivo_nutritivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`aditivo_nutritivo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `formula_quimica` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`conservante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`conservante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`aditivo_nutritivo_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`aditivo_nutritivo_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_aditivo_nutritivo` INT NOT NULL,
  `id_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_aditivo_nutritivo_picole_1_idx` (`id_aditivo_nutritivo` ASC) VISIBLE,
  INDEX `fk_aditivo_nutritivo_picole_2_idx` (`id_picole` ASC) VISIBLE,
  CONSTRAINT `fk_aditivo_nutritivo_picole_1`
    FOREIGN KEY (`id_aditivo_nutritivo`)
    REFERENCES `vendas_sorveteria`.`aditivo_nutritivo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aditivo_nutritivo_picole_2`
    FOREIGN KEY (`id_picole`)
    REFERENCES `vendas_sorveteria`.`picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`conservante_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`conservante_picole` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_conservante` INT NOT NULL,
  `id_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_conservante_picole_1_idx` (`id_conservante` ASC) VISIBLE,
  INDEX `fk_conservante_picole_2_idx` (`id_picole` ASC) VISIBLE,
  CONSTRAINT `fk_conservante_picole_1`
    FOREIGN KEY (`id_conservante`)
    REFERENCES `vendas_sorveteria`.`conservante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conservante_picole_2`
    FOREIGN KEY (`id_picole`)
    REFERENCES `vendas_sorveteria`.`picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`lote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `id_tipo_picole` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lote_1_idx` (`id_tipo_picole` ASC) VISIBLE,
  CONSTRAINT `fk_lote_1`
    FOREIGN KEY (`id_tipo_picole`)
    REFERENCES `vendas_sorveteria`.`tipo_picole` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`revendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`revendedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(20) NOT NULL,
  `razao_social` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`nota_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `numero_de_serie` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(100) NOT NULL,
  `id_revendedor` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nota_fiscal_1_idx` (`id_revendedor` ASC) VISIBLE,
  CONSTRAINT `fk_nota_fiscal_1`
    FOREIGN KEY (`id_revendedor`)
    REFERENCES `vendas_sorveteria`.`revendedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vendas_sorveteria`.`lote_nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendas_sorveteria`.`lote_nota_fiscal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_lote` INT NOT NULL,
  `id_nota_fiscal` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lote_nota_fiscal_1_idx` (`id_lote` ASC) VISIBLE,
  INDEX `fk_lote_nota_fiscal_2_idx` (`id_nota_fiscal` ASC) VISIBLE,
  CONSTRAINT `fk_lote_nota_fiscal_1`
    FOREIGN KEY (`id_lote`)
    REFERENCES `vendas_sorveteria`.`lote` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lote_nota_fiscal_2`
    FOREIGN KEY (`id_nota_fiscal`)
    REFERENCES `vendas_sorveteria`.`nota_fiscal` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
