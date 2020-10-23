DROP TABLE IF EXISTS Mudel CASCADE;

CREATE TABLE Mudel
(
	MUDELI_KOOD smallint NOT NULL,
	nimetus nimetus,
	margi_kood smallint NOT NULL,
	CONSTRAINT PK_Mudel PRIMARY KEY (MUDELI_KOOD),
	CONSTRAINT UC_MUDELI_NIMETUS UNIQUE (nimetus),
	CONSTRAINT FK_Mudel_margi_kood FOREIGN KEY (margi_kood) REFERENCES Mark (margi_kood) ON DELETE No Action ON UPDATE Cascade
);

CREATE INDEX IXFK_Mudel_margi_kood ON Mudel (margi_kood ASC);