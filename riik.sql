DROP TABLE IF EXISTS Riik CASCADE;

CREATE TABLE Riik
(
	riigi_kood varchar(3)	 NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Riik PRIMARY KEY (riigi_kood),
	CONSTRAINT UC_Riik_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Riik_riigi_kood CHECK (riigi_kood ~ '^[A-Z]{3}$')
);