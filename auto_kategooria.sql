DROP TABLE IF EXISTS Auto_kategooria CASCADE
;

CREATE TABLE Auto_kategooria
(
	Auto_kategooria_kood smallint NOT NULL,
	nimetus varchar(50)	 NOT NULL,
	Auto_kategooria_tyybi_kood smallint NOT NULL,
	CONSTRAINT PK_Auto_kategooria PRIMARY KEY (Auto_kategooria_kood),
	CONSTRAINT UC_Auto_kategooria_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Auto_kategooria_nimetus CHECK (nimetus !~ '^[[:space:]]*$'),
	CONSTRAINT FK_Auto_kategooria_Auto_kategooria_tyyp FOREIGN KEY (Auto_kategooria_tyybi_kood) REFERENCES Auto_kategooria_tyyp (AUTO_KATEGOORIA_TYYBI_KOOD) ON DELETE Cascade ON UPDATE Cascade
)
;

CREATE INDEX IXFK_Auto_kategooria_Auto_kategooria_tyyp ON Auto_kategooria (Auto_kategooria_tyybi_kood ASC);
