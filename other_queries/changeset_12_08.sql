-- add back fk constraints (not sure why they were deleted ¯\_(ツ)_/¯)
ALTER TABLE tootaja ADD CONSTRAINT FK_Tootaja_Isik FOREIGN KEY (isik_id) REFERENCES Isik (isik_id) ON DELETE Cascade ON UPDATE No ACTIO
ALTER TABLE klient ADD CONSTRAINT FK_Klient_Isik FOREIGN KEY (isik_id) REFERENCES Isik (isik_id) ON DELETE CASCADE ON UPDATE No Action;

-- drop jhipster schema and move tables
CREATE SCHEMA jhi;                                       
ALTER TABLE jhi_user SET SCHEMA jhi;                     
ALTER TABLE jhi_authority SET SCHEMA jhi;                
ALTER TABLE jhi_user_authority SET SCHEMA jhi;           
ALTER TABLE jhi_persistent_audit_event SET SCHEMA jhi;   
ALTER TABLE jhi_persistent_audit_evt_data SET SCHEMA jhi;

-- remove on deleted cascade from auto_kategooria
ALTER TABLE auto_kategooria DROP CONSTRAINT fk_auto_kategooria_auto_kategooria_tyyp;                                                                                                                                           
ALTER TABLE auto_kategooria ADD CONSTRAINT FK_Auto_kategooria_Auto_kategooria_tyyp FOREIGN KEY (auto_kategooria_tyybi_kood) REFERENCES Auto_kategooria_tyyp (auto_kategooria_tyybi_kood) ON DELETE NO ACTION ON UPDATE Cascade;