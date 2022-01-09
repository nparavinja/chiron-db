CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.korisnik (
  `korisnik_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NOT NULL,
  `ts_created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `ime` VARCHAR(255) NULL,
  PRIMARY KEY (`korisnik_id`)
  );

  CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.doktor (
  `korisnik_id` INT NOT NULL,
  `broj_licence` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NULL,
  `ts_created` TIMESTAMP NULL,
  `ime` VARCHAR(255) NULL,
  PRIMARY KEY (`korisnik_id`, `broj_licence`),
  CONSTRAINT `fk_dk_kr`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES ${databaseNamePrefix}.`korisnik` (`korisnik_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS ${databaseNamePrefix}.pacijent (
  `jmbg` CHAR(13) NOT NULL,
  `korisnik_id` INT NOT NULL,
  `lbo` VARCHAR(10) NOT NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(32) NULL,
  `ts_created` TIMESTAMP NULL,
  `ime` VARCHAR(255) NULL,
  PRIMARY KEY (`jmbg`, `korisnik_id`, `lbo`),
  INDEX `fk_pt_kr_idx` (`korisnik_id` ASC) VISIBLE,
  CONSTRAINT `fk_pt_kr`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES ${databaseNamePrefix}.`korisnik` (`korisnik_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);