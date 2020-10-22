DROP TABLE IF EXISTS Kytuse_tyyp CASCADE;

CREATE TABLE Kytuse_tyyp
(
	KYTUSE_TYYBI_KOOD smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	CONSTRAINT PK_Kytuse_tyyp PRIMARY KEY (KYTUSE_TYYBI_KOOD),
	CONSTRAINT UC_Kytuse_tyybi_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Kytuse_tyybi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);