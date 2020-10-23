DROP TABLE IF EXISTS Kliendi_seisundi_liik CASCADE;

CREATE TABLE Kliendi_seisundi_liik
(
	kliendi_seisundi_liigi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Kliendi_seisundi_liik PRIMARY KEY (kliendi_seisundi_liigi_kood),
	CONSTRAINT UC_Kliendi_seisundi_liik_nimetus UNIQUE (nimetus)
);