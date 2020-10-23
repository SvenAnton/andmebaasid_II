DROP TABLE IF EXISTS Auto_kategooria_tyyp CASCADE;

CREATE TABLE Auto_kategooria_tyyp
(
	auto_kategooria_tyybi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Auto_kategooria_tyyp PRIMARY KEY (auto_kategooria_tyybi_kood),
	CONSTRAINT UC_Auto_kategooria_tyyp_nimetus UNIQUE (nimetus)
);