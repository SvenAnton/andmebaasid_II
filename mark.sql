DROP TABLE IF EXISTS Mark CASCADE;

CREATE TABLE Mark
(
	MARGI_KOOD smallint NOT NULL,
	nimetus nimetus,
	CONSTRAINT PK_Mark PRIMARY KEY (MARGI_KOOD),
	CONSTRAINT UC_Mark_nimetus UNIQUE (nimetus)
);