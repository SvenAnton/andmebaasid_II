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
  CONSTRAINT UC_Isik_e_meil UNIQUE (e_meil),
	CONSTRAINT CK_Isik_isikukood CHECK (isikukood !~ '^[[:space:]]*$'),
	CONSTRAINT CK_Isik_parool CHECK (parool !~ '^[[:space:]]*$'),
	CONSTRAINT CK_Isik_reg_aeg CHECK (reg_aeg BETWEEN '2010-01-01 00:00:00'::timestamp without time zone AND '2100-12-31 23:59:59'::timestamp without time zone),
	CONSTRAINT CK_Isik_eesnimi CHECK (eesnimi !~ '^[[:space:]]*$'),
	CONSTRAINT CK_Isik_perenimi CHECK (perenimi !~ '^[[:space:]]*$'),
	CONSTRAINT FK_Isik_isiku_seisundi_liigi_kood FOREIGN KEY (isiku_seisundi_liigi_kood) REFERENCES Isiku_seisundi_liik (isiku_seisundi_liigi_kood)  ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Isik_isikukoodi_riik FOREIGN KEY (isikukoodi_riik) REFERENCES Riik (RIIGI_KOOD) ON DELETE No Action ON UPDATE Cascade
)
;
CREATE INDEX IXFK_Isik_isiku_seisundi_liigi_kood ON Isik (isiku_seisundi_liigi_kood ASC);
CREATE INDEX IXFK_Isik_isikukoodi_riik ON Isik (isikukoodi_riik ASC);
CREATE INDEX IX_e_meil ON Isik (e_meil ASC);