DROP TABLE IF EXISTS Keretyyp CASCADE;

CREATE TABLE Keretyyp
(
	keretyybi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Keretyyp PRIMARY KEY (keretyybi_kood),
	CONSTRAINT UC_Keretyyp_nimetus UNIQUE (nimetus)
);