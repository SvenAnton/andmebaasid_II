DROP TABLE IF EXISTS Auto CASCADE
;

CREATE TABLE Auto
(
    auto_kood integer NOT NULL,
    vin_kood varchar(17)	 NOT NULL,
    acriss_kood varchar(4)	 NOT NULL,
    kohtade_arv smallint NOT NULL,
    mudeli_kood smallint NOT NULL,
    kytuse_tyybi_kood smallint NOT NULL,
    keretyybi_kood smallint NOT NULL,
    registreerija_id bigint NOT NULL,
    reg_aeg timestamp without time zone NOT NULL DEFAULT localtimestamp(0),
    auto_seisundi_liigi_kood smallint NOT NULL DEFAULT 1,
    CONSTRAINT PK_Auto PRIMARY KEY (auto_kood),
    CONSTRAINT CK_Auto_KOHTADE_ARV CHECK (kohtade_arv > 0 and kohtade_arv <= 30),
    CONSTRAINT CK_Auto_ACRISS_KOOD CHECK ((acriss_kood)::text ~ '^[A-Z]{4}$'::text),
    CONSTRAINT CK_Auto_vin_kood CHECK ((vin_kood)::text ~ '^[A-Z0-9]{17}$'::text),
    CONSTRAINT UC_Auto_vin_kood UNIQUE (vin_kood),
    CONSTRAINT CK_Auto_reg_aeg CHECK (reg_aeg BETWEEN '2010-01-01 00:00:00'::timestamp without time zone AND '2100-12-31 23:59:59'::timestamp without time zone),
    CONSTRAINT FK_Auto_Auto_seisundi_liik FOREIGN KEY (auto_seisundi_liigi_kood) REFERENCES Auto_seisundi_liik (auto_seisundi_liigi_kood)  ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Auto_Keretyyp FOREIGN KEY (keretyybi_kood) REFERENCES Keretyyp (keretyybi_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Auto_Kytuse_tyyp FOREIGN KEY (kytuse_tyybi_kood) REFERENCES Kytuse_tyyp (kytuse_tyybi_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Auto_Mudel FOREIGN KEY (mudeli_kood) REFERENCES Mudel (mudeli_kood) ON DELETE No Action ON UPDATE Cascade,
    CONSTRAINT FK_Auto_Tootaja FOREIGN KEY (registreerija_id) REFERENCES Tootaja (isik_id) ON DELETE No Action ON UPDATE No Action
)
WITH (
	FILLFACTOR=90
)
;

CREATE INDEX IXFK_Auto_Keretyyp ON Auto (keretyybi_kood ASC);
CREATE INDEX IXFK_Auto_Kytuse_tyyp ON Auto (kytuse_tyybi_kood ASC);
CREATE INDEX IXFK_Auto_Mudel ON Auto (mudeli_kood ASC);
CREATE INDEX IXFK_Auto_Tootaja ON Auto (registreerija_id ASC);
