DROP TABLE IF EXISTS auto_kategooria_omamine CASCADE;

CREATE TABLE auto_kategooria_omamine
(
	auto_kood integer NOT NULL,
	auto_kategooria_kood smallint NOT NULL,
	CONSTRAINT PK_auto_kategooria_omamine PRIMARY KEY (auto_kood,auto_kategooria_kood),
	CONSTRAINT FK_auto_kategooria_omamine_KATEGOORIA FOREIGN KEY (auto_kategooria_kood) REFERENCES Auto_kategooria (auto_kategooria_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_auto_kategooria_omamine_Auto FOREIGN KEY (auto_kood) REFERENCES Auto (auto_kood) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX IXFK_auto_kategooria_omamine_KATEGOORIA ON auto_kategooria_omamine (auto_kategooria_kood ASC);
CREATE INDEX IXFK_auto_kategooria_omamine_AUTO ON auto_kategooria_omamine (auto_kood ASC);