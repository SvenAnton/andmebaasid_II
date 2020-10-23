DROP TABLE IF EXISTS Auto_kategooria_omamine CASCADE;

CREATE TABLE Auto_kategooria_omamine
(
	Auto_kood integer NOT NULL,
	auto_kategooria_kood smallint NOT NULL,
	CONSTRAINT PK_Auto_kategooria_omamine PRIMARY KEY (Auto_kood,auto_kategooria_kood),
	CONSTRAINT FK_AUTO_KATEGOORIA_OMAMINE_KATEGOORIA FOREIGN KEY (auto_kategooria_kood) REFERENCES Auto_kategooria (auto_kategooria_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Auto_kategooria_omamine_Auto FOREIGN KEY (Auto_kood) REFERENCES Auto (Auto_kood) ON DELETE No Action ON UPDATE Cascade
);

CREATE INDEX IXFK_AUTO_KATEGOORIA_OMAMINE_KATEGOORIA ON Auto_kategooria_omamine (auto_kategooria_kood ASC);
CREATE INDEX IXFK_AUTO_KATEGOORIA_OMAMINE_AUTO ON Auto_kategooria_omamine (Auto_kood ASC);