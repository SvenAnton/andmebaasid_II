DROP TABLE IF EXISTS Klient CASCADE;

CREATE TABLE Klient
(
	isik_id bigint NOT NULL,
	kliendi_seisundi_liigi_kood smallint NOT NULL DEFAULT 1,
	on_nous_tylitamisega boolean NOT NULL DEFAULT false,
	CONSTRAINT PK_Klient PRIMARY KEY (isik_id),
	CONSTRAINT FK_Klient_Kliendi_seisundi_liik FOREIGN KEY (kliendi_seisundi_liigi_kood) REFERENCES Kliendi_seisundi_liik (kliendi_seisundi_liigi_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Klient_Isik FOREIGN KEY (isik_id) REFERENCES Isik (isik_id) ON DELETE CASCADE ON UPDATE No Action
)
WITH (
    FILLFACTOR=90
)
;

CREATE INDEX IXFK_Klient_Kliendi_seisundi_liik ON Klient (kliendi_seisundi_liigi_kood ASC);
