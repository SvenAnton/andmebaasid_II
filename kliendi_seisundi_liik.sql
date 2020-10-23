DROP TABLE IF EXISTS Kliendi_seisundi_liik CASCADE;

CREATE TABLE Kliendi_seisundi_liik
(
	KLIENDI_SEISUNDI_LIIGI_KOOD smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Kliendi_seisundi_liik PRIMARY KEY (KLIENDI_SEISUNDI_LIIGI_KOOD),
	CONSTRAINT UC_Kliendi_seisundi_liik_nimetus UNIQUE (nimetus)
);