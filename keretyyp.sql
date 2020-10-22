DROP TABLE IF EXISTS Keretyyp CASCADE;

CREATE TABLE Keretyyp
(
	KERETYYBI_KOOD smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	CONSTRAINT PK_Keretyyp PRIMARY KEY (KERETYYBI_KOOD),
	CONSTRAINT UC_Keretyybi_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Keretyybi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);