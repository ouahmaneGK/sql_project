
DROP DATABASE IF EXISTS woofing;
CREATE DATABASE IF NOT EXISTS woofing;
USE woofing;
-- -----------------------------------------------------
-- Schema woofing
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `activity` (
  `id_activity` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_activity`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `address` (
  `id_address` INT(11) NOT NULL AUTO_INCREMENT,
  `num` INT(11) NULL DEFAULT NULL,
  `rue` VARCHAR(45) NULL DEFAULT NULL,
  `complement` VARCHAR(45) NULL DEFAULT NULL,
  `CP` INT(11) NULL DEFAULT NULL,
  `ville` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_address`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `host`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `host` (
  `id_host` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `presentation` VARCHAR(45) NULL DEFAULT NULL,
  `id_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_host`),
  CONSTRAINT `fk_host_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `worksite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `worksite` (
  `id_worksite` INT(11) NOT NULL AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `id_host` INT(11) NOT NULL,
  `nbrperson` INT(11) NULL DEFAULT NULL,
  `id_address` INT(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  PRIMARY KEY (`id_worksite`),
  CONSTRAINT `fk_worksite_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_worksite_host`
    FOREIGN KEY (`id_host`)
    REFERENCES `host` (`id_host`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `activity_worksite`
-- -----------------------------------------------------
CREATE TABLE  `activity_worksite` (
  `id_activity` int(11) NOT NULL,
  `id_worksite` int(11) NOT NULL,
  PRIMARY KEY (`id_activity`,`id_worksite`),
  KEY `fk_AW_worksite` (`id_worksite`),
  CONSTRAINT `fk_AW_activity` FOREIGN KEY (`id_activity`) REFERENCES `activity` (`id_activity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AW_worksite` FOREIGN KEY (`id_worksite`) REFERENCES `worksite` (`id_worksite`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `voluntary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `voluntary` (
  `id_voluntary` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `lastname` VARCHAR(45) NULL DEFAULT NULL,
  `id_address` INT(11) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  PRIMARY KEY (`id_voluntary`),
  CONSTRAINT `fk_voluntary_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `address` (`id_address`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `voluntary_activity`
-- -----------------------------------------------------
CREATE TABLE  `voluntary_activity` ( 
  `id_voluntary` int(11) NOT NULL,
  `id_activity` int(11) NOT NULL,
  `skill` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_voluntary`,`id_activity`),
  CONSTRAINT `fk_VA_activity` FOREIGN KEY (`id_activity`) REFERENCES `activity` (`id_activity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VA_voluntary` FOREIGN KEY (`id_voluntary`) REFERENCES `voluntary` (`id_voluntary`) ON DELETE NO ACTION ON UPDATE NO ACTION

)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `worksite_voluntary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `worksite_voluntary` (
  `id_worksite` int(11) NOT NULL,
  `id_voluntary` int(11) NOT NULL,
  `present` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id_worksite`,`id_voluntary`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


