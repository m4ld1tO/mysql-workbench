CREATE TABLE IF NOT EXISTS `mydb`.`socios` (
  `id_socio` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `a_paterno` VARCHAR(45) NOT NULL,
  `a_materno` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_socio`),
  UNIQUE INDEX `id_socio_UNIQUE` (`id_socio` ASC))
ENGINE = InnoDB
COMMENT = 'table to save asociates data'

CREATE TABLE IF NOT EXISTS `mydb`.`barcos` (
  `matricula` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `num_amarre` VARCHAR(45) NOT NULL,
  `cuota` VARCHAR(45) NOT NULL,
  `socios_id_socio` INT NOT NULL,
  PRIMARY KEY (`matricula`, `socios_id_socio`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC),
  INDEX `fk_barcos_socios1_idx` (`socios_id_socio` ASC),
  CONSTRAINT `fk_barcos_socios1`
    FOREIGN KEY (`socios_id_socio`)
    REFERENCES `mydb`.`socios` (`id_socio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB

CREATE TABLE IF NOT EXISTS `mydb`.`patrones` (
  `id_patron` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `a_paterno` VARCHAR(45) NOT NULL,
  `a_materno` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_patron`),
  UNIQUE INDEX `id_socio_UNIQUE` (`id_patron` ASC))
ENGINE = InnoDB
COMMENT = 'table to save asociates data'

CREATE TABLE IF NOT EXISTS `mydb`.`salidas` (
  `id_salida` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `hora_salida` DATETIME NOT NULL,
  `destino` VARCHAR(45) NOT NULL,
  `barcos_matricula` INT NOT NULL,
  `patrones_id_patron` INT NOT NULL,
  PRIMARY KEY (`id_salida`, `barcos_matricula`, `patrones_id_patron`),
  UNIQUE INDEX `idsalidas_UNIQUE` (`id_salida` ASC),
  INDEX `fk_salidas_barcos_idx` (`barcos_matricula` ASC),
  INDEX `fk_salidas_patrones1_idx` (`patrones_id_patron` ASC),
  CONSTRAINT `fk_salidas_barcos`
    FOREIGN KEY (`barcos_matricula`)
    REFERENCES `mydb`.`barcos` (`matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_salidas_patrones1`
    FOREIGN KEY (`patrones_id_patron`)
    REFERENCES `mydb`.`patrones` (`id_patron`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB