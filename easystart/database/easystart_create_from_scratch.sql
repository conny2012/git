SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `easyStart` ;
CREATE SCHEMA IF NOT EXISTS `easyStart` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `easyStart` ;

-- -----------------------------------------------------
-- Table `easyStart`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easyStart`.`user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `easyStart`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Table to store registered users. \\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nNote that user id=0 is the default user, without name and password. He is used for development to simulate an user-centric approach from the very start. Probably dropped or changed to \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'admin\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\' later  /* comment truncated */' ,
  `name` VARCHAR(16) NULL DEFAULT NULL ,
  `pwd` VARCHAR(16) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `easyStart`.`doc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easyStart`.`doc` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `easyStart`.`doc` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `user_id` INT UNSIGNED NOT NULL ,
  `url` VARCHAR(45) NULL DEFAULT NULL ,
  `text` VARCHAR(1000) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_doc_user_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_doc_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `easyStart`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `easyStart`.`link`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easyStart`.`link` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `easyStart`.`link` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `url` VARCHAR(512) NOT NULL ,
  `created_at` DATE NOT NULL ,
  `clickcount` INT UNSIGNED NOT NULL DEFAULT 0 ,
  `title` VARCHAR(45) NULL DEFAULT NULL ,
  `description` VARCHAR(512) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `easyStart`.`link_has_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `easyStart`.`link_has_user` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `easyStart`.`link_has_user` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `link_id` INT UNSIGNED NOT NULL ,
  `user_id` INT UNSIGNED NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_link_has_user_link_idx` (`link_id` ASC) ,
  INDEX `fk_link_has_user_user_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_link_has_user_link`
    FOREIGN KEY (`link_id` )
    REFERENCES `easyStart`.`link` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_link_has_user_user`
    FOREIGN KEY (`user_id` )
    REFERENCES `easyStart`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
