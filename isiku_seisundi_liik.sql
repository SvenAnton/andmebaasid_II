DROP TABLE IF EXISTS Isiku_seisundi_liik CASCADE;

CREATE TABLE Isiku_seisundi_liik
(
	isiku_seisundi_liigi_kood smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	CONSTRAINT PK_Isiku_seisundi_liik PRIMARY KEY (isiku_seisundi_liigi_kood),
	CONSTRAINT UC_Isiku_seisundi_liigi_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Isiku_seisundi_liigi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);
