DROP TABLE IF EXISTS Isik CASCADE;

DROP SEQUENCE IF EXISTS isik_isik_id_seq;

CREATE TABLE Isik
(
	isik_id bigserial NOT NULL,
	e_meil varchar(254)	 NOT NULL,
	parool varchar(255)	 NOT NULL,
	eesnimi varchar(1000)	,
	perenimi varchar(1000)	,
	elukoht varchar(1000)	,
	isikukood varchar(50)	 NOT NULL,
	isikukoodi_riik varchar(3)	 NOT NULL,
	synni_kp date NOT NULL,
	isiku_seisundi_liigi_kood smallint NOT NULL DEFAULT 1,
	reg_aeg timestamp without time zone NOT NULL DEFAULT localtimestamp(0),
	CONSTRAINT PK_Isik PRIMARY KEY (isik_id),
	CONSTRAINT CK_Isik_synni_kp CHECK (synni_kp BETWEEN '1900-01-01 00:00:00'::timestamp without time zone AND '2100-12-31 23:59:59'::timestamp without time zone),
	CONSTRAINT CK_Isik_synni_kp_reg_aeg CHECK (synni_kp <= reg_aeg),
  	CONSTRAINT CK_Isik_e_meil CHECK (e_meil ~ '@'),
	CONSTRAINT CK_Isik_elukoht CHECK (elukoht !~ '^[[:space:]]*$' and elukoht !~ '^[[:digit:]]*$'),
	CONSTRAINT CK_Isik_nimi CHECK (eesnimi IS NOT NULL OR perenimi IS NOT NULL),
	CONSTRAINT UC_Isik_id_riik UNIQUE (isikukood,isikukoodi_riik),
	CONSTRAINT CK_Isik_isikukood CHECK (isikukood ~ '^[[:alpha:]0-9_\-+\s=]*$'),
	CONSTRAINT CK_Isik_parool CHECK (parool !~ '^[[:space:]]*$'),
	CONSTRAINT CK_Isik_reg_aeg CHECK (reg_aeg BETWEEN '2010-01-01 00:00:00'::timestamp without time zone AND '2100-12-31 23:59:59'::timestamp without time zone),
	CONSTRAINT CK_Isik_eesnimi CHECK (eesnimi !~ '^[[:space:]]*$'),
	CONSTRAINT CK_Isik_perenimi CHECK (perenimi !~ '^[[:space:]]*$'),
	CONSTRAINT FK_Isik_isiku_seisundi_liigi_kood FOREIGN KEY (isiku_seisundi_liigi_kood) REFERENCES isiku_seisundi_liik (isiku_seisundi_liigi_kood)  ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Isik_isikukoodi_riik FOREIGN KEY (isikukoodi_riik) REFERENCES Riik (riigi_kood) ON DELETE No Action ON UPDATE Cascade
)
WITH (
  FILLFACTOR=90
)
;
CREATE INDEX IXFK_Isik_isiku_seisundi_liigi_kood ON Isik (isiku_seisundi_liigi_kood ASC);
CREATE INDEX IXFK_Isik_isikukoodi_riik ON Isik (isikukoodi_riik ASC);
CREATE UNIQUE INDEX IX_Isik_e_meil ON Isik (LOWER(e_meil));

-- auth related updates 05/12/2020
ALTER TABLE isik
    ADD COLUMN kasutajanimi varchar(254) GENERATED ALWAYS AS (e_meil) STORED,
    ADD COLUMN pildi_aadress varchar(256),
    ADD COLUMN on_aktiivne boolean NOT NULL DEFAULT FALSE,
    ADD COLUMN keelekood varchar(10),
    ADD COLUMN aktiveerimise_voti varchar(20),
    ADD COLUMN reset_voti varchar(20),
    ADD COLUMN registreerija_id varchar(50),
    ADD COLUMN reset_aeg timestamp,
    ADD COLUMN viimati_muudetud_id varchar(50),
    ADD COLUMN viimati_muudetud_aeg timestamp;

-- auth related changes 17/12/202
ALTER TABLE isik
	DROP COLUMN registreerija_id,
	DROP COLUMN viimati_muudetud_id,
	DROP COLUMN viimati_muudetud_aeg,
	DROP COLUMN on_aktiivne,
	DROP COLUMN kasutajanimi;

ALTER TABLE isik ADD COLUMN kasutajanimi varchar(50);
UPDATE isik SET kasutajanimi = split_part(e_meil, '@', 1);
ALTER TABLE isik ALTER COLUMN kasutajanimi SET NOT NULL;

ALTER TABLE isik ADD CONSTRAINT uc_isik_kasutajanimi UNIQUE (kasutajanimi);	
ALTER TABLE isik ADD CONSTRAINT ck_isik_reset_aeg CHECK (reset_aeg BETWEEN '2010-01-01 00:00:00'::timestamp without time zone AND '2100-12-31 23:59:59'::timestamp without time zone);

