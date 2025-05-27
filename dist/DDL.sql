-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hopi_hari_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hopi_hari_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hopi_hari_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `hopi_hari_db` ;

-- -----------------------------------------------------
-- Table `hopi_hari_db`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`areas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`rides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`rides` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `waiting_time` INT NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `area` INT NOT NULL,
  PRIMARY KEY (`id`, `area`),
  INDEX `aa_idx` (`area` ASC) VISIBLE,
  CONSTRAINT `aa`
    FOREIGN KEY (`area`)
    REFERENCES `hopi_hari_db`.`areas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 132
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `birth_date` DATE NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`notification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`notification` (
  `Notification_id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(200) NOT NULL,
  `users_id` INT NOT NULL,
  `rides_id` INT NOT NULL,
  `Status` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`Notification_id`),
  INDEX `fk_Notification_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_Notification_rides1_idx` (`rides_id` ASC) VISIBLE,
  CONSTRAINT `fk_Notification_rides1`
    FOREIGN KEY (`rides_id`)
    REFERENCES `hopi_hari_db`.`rides` (`id`),
  CONSTRAINT `fk_Notification_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `hopi_hari_db`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `hopi_hari_db`.`users_has_rides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hopi_hari_db`.`users_has_rides` (
  `users_id` INT NOT NULL,
  `Rides_id` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`, `Rides_id`),
  INDEX `fk_users_has_Rides_Rides1_idx` (`Rides_id` ASC) VISIBLE,
  INDEX `fk_users_has_Rides_users_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_Rides_Rides1`
    FOREIGN KEY (`Rides_id`)
    REFERENCES `hopi_hari_db`.`rides` (`id`),
  CONSTRAINT `fk_users_has_Rides_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `hopi_hari_db`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

USE `hopi_hari_db`;

DELIMITER $$
USE `hopi_hari_db`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `hopi_hari_db`.`after_inset_lines`
AFTER INSERT ON `hopi_hari_db`.`users_has_rides`
FOR EACH ROW
BEGIN
    
		DECLARE wait_time INT;
        DECLARE line_count INT;
        DECLARE total_wait INT;
        
		SELECT waiting_time INTO wait_time
			FROM rides
            WHERE id = NEW.rides_id;

		SELECT count(*) INTO line_count
        FROM hopi_hari_db.users_has_rides
        WHERE Rides_id = NEW.Rides_id;
        
        set total_wait = wait_time * line_count;
        
       insert INTO notification (description, users_id, rides_id, status)
		VALUES (concat(total_wait, " minutos de espera para o brinquedo"), NEW.users_id, NEW.rides_id, true);
		END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;