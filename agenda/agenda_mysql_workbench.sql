SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `agenda` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `agenda` ;

-- -----------------------------------------------------
-- Table `agenda`.`Contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda`.`Contato` (
  `id` INT NOT NULL,
  `confidencial` TINYINT(1) NULL,
  `tratamento` VARCHAR(100) NULL,
  `nome` VARCHAR(100) NULL,
  `sobrenome` VARCHAR(100) NULL,
  `nome_fantasia` VARCHAR(100) NULL,
  `razao_social` VARCHAR(100) NULL,
  `tipo_contato` VARCHAR(5) NULL,
  `cargo` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `cnpj` VARCHAR(13) NULL,
  `ie` VARCHAR(15) NULL,
  `cpf` VARCHAR(11) NULL,
  `rg` VARCHAR(15) NULL,
  `criado_em` DATETIME NULL,
  `modificado_em` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda`.`Relacionamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda`.`Relacionamento` (
  `id` INT NOT NULL,
  `contato_id` INT NOT NULL,
  `relaciona_com_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Relacionamento_Contato_idx` (`contato_id` ASC),
  INDEX `fk_Relacionamento_Contato1_idx` (`relaciona_com_id` ASC),
  CONSTRAINT `fk_Relacionamento_Contato`
    FOREIGN KEY (`contato_id`)
    REFERENCES `agenda`.`Contato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Relacionamento_Contato1`
    FOREIGN KEY (`relaciona_com_id`)
    REFERENCES `agenda`.`Contato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda`.`Endereco` (
  `id` INT NOT NULL,
  `contato_id` INT NOT NULL,
  `tipo_endereco` VARCHAR(1) NULL,
  `logradouro` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Endereco_Contato1_idx` (`contato_id` ASC),
  CONSTRAINT `fk_Endereco_Contato1`
    FOREIGN KEY (`contato_id`)
    REFERENCES `agenda`.`Contato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda`.`Fone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda`.`Fone` (
  `id` INT NOT NULL,
  `contato_id` INT NOT NULL,
  `fone` VARCHAR(45) NULL,
  `tipo_fone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Fone_Contato1_idx` (`contato_id` ASC),
  CONSTRAINT `fk_Fone_Contato1`
    FOREIGN KEY (`contato_id`)
    REFERENCES `agenda`.`Contato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda`.`Tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda`.`Tag` (
  `id` INT NOT NULL,
  `tag` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda`.`Contato_Tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda`.`Contato_Tag` (
  `id` INT NOT NULL,
  `contato_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Contato_Tag_Contato1_idx` (`contato_id` ASC),
  INDEX `fk_Contato_Tag_Tag1_idx` (`tag_id` ASC),
  CONSTRAINT `fk_Contato_Tag_Contato1`
    FOREIGN KEY (`contato_id`)
    REFERENCES `agenda`.`Contato` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contato_Tag_Tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `agenda`.`Tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
