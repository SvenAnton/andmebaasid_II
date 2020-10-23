DROP TABLE IF EXISTS Tootaja_seisundi_liik CASCADE;

CREATE TABLE Tootaja_seisundi_liik
(
	tootaja_seisundi_liigi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Tootaja_seisundi_liik PRIMARY KEY (tootaja_seisundi_liigi_kood),
	CONSTRAINT UC_tootaja_seisundi_liik_nimetus UNIQUE (nimetus)
);