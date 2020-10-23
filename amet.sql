DROP TABLE IF EXISTS Amet CASCADE
;

CREATE TABLE Amet
(
	ameti_kood smallint NOT NULL,
	nimetus nimetus,
	kirjeldus text,
	CONSTRAINT PK_Amet PRIMARY KEY (ameti_kood),
	CONSTRAINT UC_Amet_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Amet_kirjeldus CHECK (kirjeldus !~ '^[[:space:]]*$')
)
;
