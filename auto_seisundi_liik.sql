DROP TABLE IF EXISTS Auto_seisundi_liik CASCADE;

CREATE TABLE Auto_seisundi_liik
(
	auto_seisundi_liigi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Auto_seisundi_liik PRIMARY KEY (auto_seisundi_liigi_kood),
	CONSTRAINT UC_Auto_seisundi_liik_nimetus UNIQUE (nimetus)
);