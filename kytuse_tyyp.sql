DROP TABLE IF EXISTS Kytuse_tyyp CASCADE;

CREATE TABLE Kytuse_tyyp
(
	kytuse_tyybi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Kytuse_tyyp PRIMARY KEY (kytuse_tyybi_kood),
	CONSTRAINT UC_Kytuse_tyyp_nimetus UNIQUE (nimetus)
);