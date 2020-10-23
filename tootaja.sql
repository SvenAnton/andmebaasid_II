DROP TABLE IF EXISTS Tootaja CASCADE
;

CREATE TABLE Tootaja
(
	isik_id bigint NOT NULL,
	mentor bigint,
	ameti_kood smallint NOT NULL,
	tootaja_seisundi_liigi_kood smallint NOT NULL DEFAULT 1,

	CONSTRAINT PK_Tootaja PRIMARY KEY (isik_id),
	CONSTRAINT CK_Tootaja_mentor CHECK (mentor <> isik_id),
	
	CONSTRAINT FK_Tootaja_Amet FOREIGN KEY (ameti_kood) REFERENCES Amet (ameti_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Tootaja_Tootaja_seisundi_liik FOREIGN KEY (tootaja_seisundi_liigi_kood) REFERENCES Tootaja_seisundi_liik (tootaja_seisundi_liigi_kood) ON DELETE No Action ON UPDATE Cascade,
	CONSTRAINT FK_Tootaja_Isik FOREIGN KEY (isik_id) REFERENCES Isik (isik_id) ON DELETE Cascade ON UPDATE Cascade,
	CONSTRAINT FK_Tootaja_mentor FOREIGN KEY (mentor) REFERENCES Tootaja (isik_id) ON DELETE Set Null ON UPDATE Cascade
)
;

	CREATE INDEX IXFK_Tootaja_Amet ON Tootaja (ameti_kood ASC);
	CREATE INDEX IXFK_Tootaja_Tootaja_seisundi_liik ON Tootaja (tootaja_seisundi_liigi_kood ASC);
  CREATE INDEX IX_Tootaja_Mentor ON Tootaja (mentor ASC);
