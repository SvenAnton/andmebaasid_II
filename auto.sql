


DROP TABLE IF EXISTS Auto CASCADE
;

CREATE TABLE Auto
(
	Auto_kood integer NOT NULL,
	VIN_KOOD varchar(17)	 NOT NULL,
	acriss_kood varchar(4)	 NOT NULL,
	kohtade_arv smallint NOT NULL,
	MUDELI_KOOD smallint NOT NULL,
	KYYTUSE_TYYBI_KOOD smallint NOT NULL,
	KERETYYBI_KOOD smallint NOT NULL,
	REGISTREERIJA_ID bigint NOT NULL,
	reg_aeg timestamp without time zone NOT NULL DEFAULT localtimestamp(0),
	AUTO_SEISUND_LIIK_KOOD smallint NOT NULL DEFAULT 1,
	CONSTRAINT PK_Auto PRIMARY KEY (Auto_kood),
	CONSTRAINT CK_Auto_KOHTADE_ARV CHECK (kohtade_arv > 0 and kohtade_arv <= 30),
	CONSTRAINT CK_Auto_ACRISS_KOOD CHECK ((acriss_kood)::text ~ '^[a-z]{4}$'::text),
	CONSTRAINT CK_Auto_VIN_KOOD CHECK ((vin_kood)::text ~ '^[a-z0-9]{17}$'::text),
	CONSTRAINT UC_Auto_VIN_KOOD UNIQUE (VIN_KOOD),
	CONSTRAINT CK_Auto_reg_aeg CHECK (reg_aeg BETWEEN '2010-01-01 00:00:00'::timestamp without time zone AND '2100-12-31 23:59:59'::timestamp without time zone),
	CONSTRAINT FK_Auto_Auto_seisundi_liik FOREIGN KEY (AUTO_SEISUND_LIIK_KOOD) REFERENCES Auto_seisundi_liik (AUTO_SEISUNDI_LIIK_KOOD) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Auto_Keretyyp FOREIGN KEY (KERETYYBI_KOOD) REFERENCES Keretyyp (KERETYYBI_KOOD) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Auto_Kytuse_tyyp FOREIGN KEY (KYYTUSE_TYYBI_KOOD) REFERENCES Kytuse_tyyp (KYTUSE_TYYBI_KOOD) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Auto_Mudel FOREIGN KEY (MUDELI_KOOD) REFERENCES Mudel (MUDELI_KOOD) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Auto_Tootaja FOREIGN KEY (REGISTREERIJA_ID) REFERENCES Tootaja (isik_id) ON DELETE No Action ON UPDATE No Action
)
;


CREATE INDEX IXFK_Auto_Keretyyp ON Auto (KERETYYBI_KOOD ASC);
CREATE INDEX IXFK_Auto_Kytuse_tyyp ON Auto (KYYTUSE_TYYBI_KOOD ASC);
CREATE INDEX IXFK_Auto_Mudel ON Auto (AUTO_SEISUND_LIIK_KOOD ASC);
CREATE INDEX IXFK_Auto_Tootaja ON Auto (REGISTREERIJA_ID ASC);