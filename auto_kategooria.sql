DROP TABLE IF EXISTS Auto_kategooria CASCADE
;

CREATE TABLE Auto_kategooria
(
	auto_kategooria_kood smallint NOT NULL,
	nimetus nimetus,
	auto_kategooria_tyybi_kood smallint NOT NULL,
	CONSTRAINT PK_Auto_kategooria PRIMARY KEY (auto_kategooria_kood),
	CONSTRAINT UC_Auto_kategooria_nimetus UNIQUE (nimetus),
	CONSTRAINT FK_Auto_kategooria_Auto_kategooria_tyyp FOREIGN KEY (auto_kategooria_tyybi_kood)
      REFERENCES Auto_kategooria_tyyp (auto_kategooria_tyybi_kood) ON DELETE Cascade ON UPDATE Cascade
)
;

CREATE INDEX IXFK_Auto_kategooria_Auto_kategooria_tyyp ON Auto_kategooria (auto_kategooria_tyybi_kood ASC);
