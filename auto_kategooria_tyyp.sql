DROP TABLE IF EXISTS Auto_kategooria_tyyp CASCADE;

CREATE TABLE Auto_kategooria_tyyp
(
	AUTO_KATEGOORIA_TYYBI_KOOD smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	CONSTRAINT PK_Auto_kategooria_tyyp PRIMARY KEY (AUTO_KATEGOORIA_TYYBI_KOOD),
	CONSTRAINT UC_Auto_kategooria_tyybi_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Auto_kategooria_tyybi_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
);