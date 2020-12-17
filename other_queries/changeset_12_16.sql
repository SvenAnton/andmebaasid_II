-- drop unused jhi and auth tables/columns
DROP TABLE jhi.jhi_user;

ALTER TABLE isik
DROP COLUMN registreerija_id,
DROP COLUMN viimati_muudetud_id,
DROP COLUMN viimati_muudetud_aeg,
DROP COLUMN on_aktiivne,
DROP COLUMN kasutajanimi;

DROP SEQUENCE public.sequence_generator;

-- refactor username column
ALTER TABLE isik ADD COLUMN kasutajanimi varchar(50);
UPDATE isik SET kasutajanimi = split_part(e_meil, '@', 1);
ALTER TABLE isik ALTER COLUMN kasutajanimi SET NOT NULL;

ALTER TABLE isik ADD CONSTRAINT uc_isik_kasutajanimi UNIQUE (kasutajanimi);

INSERT INTO isiku_seisundi_liik(isiku_seisundi_liigi_kood, nimetus)
VALUES (3, 'Aktiivne'),
       (4, 'Mitteaktiivne');

-- fix constraints, inconsistent names, etc
ALTER TABLE public.isik ADD CONSTRAINT ck_isik_pildi_aadress CHECK (pildi_aadress!~'^[[:space:]]*$');
ALTER TABLE public.isik ADD CONSTRAINT ck_isik_keelekood CHECK (keelekood!~'^[[:space:]]*$');
ALTER TABLE public.isik ADD CONSTRAINT ck_isik_aktiveerimise_voti CHECK (aktiveerimise_voti!~'^[[:space:]]*$');
ALTER TABLE public.isik ADD CONSTRAINT ck_isik_reset_voti CHECK (reset_voti!~'^[[:space:]]*$');
ALTER TABLE public.isik ADD CONSTRAINT ck_isik_kasutajanimi CHECK (kasutajanimi!~'^[[:space:]]*$');
ALTER TABLE jhi.jhi_authority ADD CONSTRAINT ck_jhi_authority_name CHECK (name!~'^[[:space:]]*$');
ALTER TABLE jhi.jhi_persistent_audit_event ADD CONSTRAINT ck_jhi_persistent_audit_event_principal CHECK (principal!~'^[[:space:]]*$');
ALTER TABLE jhi.jhi_persistent_audit_event ADD CONSTRAINT ck_jhi_persistent_audit_event_event_type CHECK (event_type!~'^[[:space:]]*$');
ALTER TABLE jhi.jhi_persistent_audit_evt_data ADD CONSTRAINT ck_jhi_persistent_audit_evt_data_name CHECK (name!~'^[[:space:]]*$');
ALTER TABLE jhi.jhi_persistent_audit_evt_data ADD CONSTRAINT ck_jhi_persistent_audit_evt_data_value CHECK (value!~'^[[:space:]]*$');


