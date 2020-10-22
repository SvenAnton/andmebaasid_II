DROP TABLE IF EXISTS Auto_seisundi_liik CASCADE;

CREATE TABLE Auto_seisundi_liik
(
	AUTO_SEISUNDI_LIIGI_KOOD smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	CONSTRAINT PK_Auto_seisundi_liik PRIMARY KEY (AUTO_SEISUNDI_LIIGI_KOOD),
	CONSTRAINT UC_Auto_seisundi_liigi_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Auto_seisundi_liigi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);