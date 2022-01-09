CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.`terapija` (
  `komentar` MEDIUMTEXT NULL,
  `terapija_id` INT NOT NULL,
  PRIMARY KEY (`terapija_id`)
  );

CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.`dijagnoza` (
  `naziv` VARCHAR(255) NULL,
  `komentar` MEDIUMTEXT NULL,
  `dijagnoza_id` INT NOT NULL,
  PRIMARY KEY (`dijagnoza_id`)
  );

CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.`izvestaj` (
  `izvestaj_id` INT NOT NULL,
  `komentar` LONGTEXT NULL,
  `naziv` MEDIUMTEXT NULL,
  `dijagnoza_id` INT NULL,
  `terapija_id` INT NULL,
  PRIMARY KEY (`izvestaj_id`),
  INDEX `fk_iz_tr_idx` (`terapija_id` ASC) VISIBLE,
  INDEX `fk_iz_dg_idx` (`dijagnoza_id` ASC) VISIBLE,
  CONSTRAINT `fk_iz_tr`
    FOREIGN KEY (`terapija_id`)
    REFERENCES ${databaseNamePrefix}.`terapija` (`terapija_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_iz_dg`
    FOREIGN KEY (`dijagnoza_id`)
    REFERENCES ${databaseNamePrefix}.`dijagnoza` (`dijagnoza_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );

CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.`pregled` (
  `pregled_id` INT NOT NULL,
  `ts_pregled` TIMESTAMP NULL,
  `status` CHAR(2) NULL,
  `pacijent_id` INT NULL,
  `doktor_id` INT NULL,
  `izvestaj_id` INT NULL,
  PRIMARY KEY (`pregled_id`),
  INDEX `fk_pt` (`pacijent_id` ASC) VISIBLE,
  INDEX `fk_dk` (`doktor_id` ASC) VISIBLE,
  INDEX `fk_pr_dg_idx` (`izvestaj_id` ASC) VISIBLE,
  CONSTRAINT `fk_pr_pt`
    FOREIGN KEY (`pacijent_id`)
    REFERENCES ${databaseNamePrefix}.`pacijent` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pr_dk`
    FOREIGN KEY (`doktor_id`)
    REFERENCES ${databaseNamePrefix}.`doktor` (`korisnik_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pr_dg`
    FOREIGN KEY (`izvestaj_id`)
    REFERENCES ${databaseNamePrefix}.`izvestaj` (`izvestaj_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    );