-- -----------------------------------------------------
-- Schema decodemtl_addressbook_import
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `decodemtl_addressbook_import` ;

-- -----------------------------------------------------
-- Schema decodemtl_addressbook_import
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `decodemtl_addressbook_import` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `decodemtl_addressbook_import` ;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook_import`.`Account` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_import`.`Account` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `email` VARCHAR(255) NOT NULL COMMENT '',
  `password` VARCHAR(40) NOT NULL COMMENT '',
  `createdOn` DATETIME NOT NULL COMMENT '',
  `modifiedOn` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`AddressBook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook_import`.`AddressBook` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_import`.`AddressBook` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `accountId` INT NOT NULL COMMENT '',
  `name` VARCHAR(255) NOT NULL COMMENT '',
  `createdOn` DATETIME NOT NULL COMMENT '',
  `modifiedOn` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`Entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook_import`.`Entry` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_import`.`Entry` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `addressBookId` INT NOT NULL COMMENT '',
  `firstName` VARCHAR(255) NOT NULL COMMENT '',
  `lastName` VARCHAR(255) NULL COMMENT '',
  `birthday` DATETIME NULL COMMENT '',
  `type` ENUM('home', 'work', 'other') NOT NULL COMMENT '',
  `subtype` ENUM('phone', 'address', 'electronic-email') NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`Phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook_import`.`Phone` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_import`.`Phone` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `entryId` INT NOT NULL COMMENT '',
  `type` ENUM('home', 'work', 'other') NOT NULL COMMENT '',
  `subtype` ENUM('landline', 'cellular', 'fax') NOT NULL COMMENT '',
  `content` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook_import`.`Address` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_import`.`Address` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `entryId` INT NOT NULL COMMENT '',
  `type` ENUM('home', 'work', 'other') NOT NULL COMMENT '',
  `addressLine1` VARCHAR(255) NOT NULL COMMENT '',
  `addressLine2` VARCHAR(255) NULL COMMENT '',
  `city` VARCHAR(255) NULL COMMENT '',
  `province` VARCHAR(128) NULL COMMENT '',
  `country` VARCHAR(128) NULL COMMENT '',
  `postalCode` VARCHAR(10) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `decodemtl_addressbook_import`.`ElectronicMail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `decodemtl_addressbook_import`.`ElectronicMail` ;

CREATE TABLE IF NOT EXISTS `decodemtl_addressbook_import`.`ElectronicMail` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `entryId` INT NOT NULL COMMENT '',
  `type` ENUM('home', 'work', 'other') NOT NULL COMMENT '',
  `content` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;
