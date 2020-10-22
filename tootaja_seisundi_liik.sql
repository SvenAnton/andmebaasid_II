DROP TABLE IF EXISTS Tootaja_seisundi_liik CASCADE;

CREATE TABLE Tootaja_seisundi_liik
(
	TOOTAJA_SEISUNDI_LIIGI_KOOD smallint NOT NULL,
	nimetus varchar(255)	 NOT NULL,
	CONSTRAINT PK_Tootaja_seisundi_liik PRIMARY KEY (TOOTAJA_SEISUNDI_LIIGI_KOOD),
	CONSTRAINT UC_TOOTAJA_SEISUNDI_LIIGI_NIMETUS UNIQUE (nimetus),
	CONSTRAINT CK_Tootaja_seisundi_liigi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);