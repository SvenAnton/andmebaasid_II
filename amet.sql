DROP TABLE IF EXISTS Amet CASCADE
;

CREATE TABLE Amet
(
	AMETI_KOOD smallint NOT NULL,
	nimetus varchar(255)	 NOT NULL,
	kirjeldus text,
	CONSTRAINT PK_Amet PRIMARY KEY (AMETI_KOOD),
	CONSTRAINT UC_Amet_nimetus UNIQUE (nimetus),
	CONSTRAINT CK_Amet_kirjeldus CHECK (kirjeldus !~ '^[[:space:]]*$'),
  CONSTRAINT CK_Amet_nimetus CHECK (nimetus !~ '^[[:space:]]*$')
)
;
