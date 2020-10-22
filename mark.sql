DROP TABLE IF EXISTS Mark CASCADE;

CREATE TABLE Mark
(
	MARGI_KOOD smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	CONSTRAINT PK_Mark PRIMARY KEY (MARGI_KOOD),
	CONSTRAINT UC_Margi_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Margi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);