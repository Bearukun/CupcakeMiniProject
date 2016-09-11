-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema cupcakeshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cupcakeshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cupcakeshop` DEFAULT CHARACTER SET utf8 ;
USE `cupcakeshop` ;

-- -----------------------------------------------------
-- Table `cupcakeshop`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcakeshop`.`user` (
  `idUser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `balance` INT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcakeshop`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcakeshop`.`invoice` (
  `idInvoice` INT NOT NULL AUTO_INCREMENT,
  `idUser` INT NULL,
  `idCupcake` INT NULL,
  PRIMARY KEY (`idInvoice`),
  INDEX `fk_idUser_idx` (`idUser` ASC),
  CONSTRAINT `fk_idUser`
    FOREIGN KEY (`idUser`)
    REFERENCES `cupcakeshop`.`user` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcakeshop`.`cupcakebottom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcakeshop`.`cupcakebottom` (
  `idBottom` INT NOT NULL AUTO_INCREMENT,
  `cupcakeBottomPiece` VARCHAR(45) NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`idBottom`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcakeshop`.`cupcaketopping`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcakeshop`.`cupcaketopping` (
  `idTopping` INT NOT NULL AUTO_INCREMENT,
  `cupcakeToppingPiece` VARCHAR(45) NULL,
  `price` INT NOT NULL,
  PRIMARY KEY (`idTopping`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcakeshop`.`cupcake`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcakeshop`.`cupcake` (
  `idCupcake` INT NOT NULL AUTO_INCREMENT,
  `cupcakeName` VARCHAR(45) NULL,
  `idTopping` INT NULL,
  `idBottom` INT NULL,
  PRIMARY KEY (`idCupcake`),
  INDEX `fk_topping_idx` (`idTopping` ASC),
  INDEX `fk_bottom_idx` (`idBottom` ASC),
  CONSTRAINT `fk_idTopping`
    FOREIGN KEY (`idTopping`)
    REFERENCES `cupcakeshop`.`cupcaketopping` (`idTopping`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idBottom`
    FOREIGN KEY (`idBottom`)
    REFERENCES `cupcakeshop`.`cupcakebottom` (`idBottom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cupcakeshop`.`invoicedetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cupcakeshop`.`invoicedetails` (
  `idInvoice` INT NOT NULL,
  `idCupcake` INT NULL,
  `qty` INT NULL,
  INDEX `fk_invoicedetails_IdCupCake_idx` (`idCupcake` ASC),
  CONSTRAINT `fk_invoicedetails_IdInvoice`
    FOREIGN KEY (`idInvoice`)
    REFERENCES `cupcakeshop`.`invoice` (`idInvoice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoicedetails_IdCupcake`
    FOREIGN KEY (`idCupcake`)
    REFERENCES `cupcakeshop`.`cupcake` (`idCupcake`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


-- -----------------------------------------------------
-- Fill in values
-- -----------------------------------------------------

INSERT INTO `cupcakeshop`.`user` (`username`, `password`, `balance`) VALUES ('Christian', 'Olsen', '1000');
INSERT INTO `cupcakeshop`.`user` (`username`, `password`, `balance`) VALUES ('Bjørn', 'Kristiansen', '1001');

INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Chocolate', '5');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Vanilla', '5');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Nutmeg', '5');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Pistacio', '6');
INSERT INTO `cupcakeshop`.`cupcaketopping` (`cupCakeToppingPiece`, `price`) VALUES ('Almond', '7');

INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Chocolate', '5');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Blueberry', '5');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Raspberry', '5');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Crispy', '6');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Strawberry', '6');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Rum/Raisin', '7');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Orange', '8');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Lemon', '8');
INSERT INTO `cupcakeshop`.`cupcakebottom` (`cupCakeBottomPiece`, `price`) VALUES ('Blue cheese', '9');

INSERT INTO `cupcakeshop`.`cupcake` (`cupcakeName`, `idTopping`, `idBottom`) VALUES ('ChoccoNut', '3', '1');
