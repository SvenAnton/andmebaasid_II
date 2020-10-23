DROP TABLE IF EXISTS Mark CASCADE;

CREATE TABLE Mark
(
	margi_kood smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Mark PRIMARY KEY (margi_kood),
	CONSTRAINT UC_Mark_nimetus UNIQUE (nimetus)
);