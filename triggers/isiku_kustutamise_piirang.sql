CREATE OR REPLACE FUNCTION f_isiku_kustutamise_piirang() RETURNS trigger AS $f_isiku_kustutamise_piirang$
    BEGIN
            RAISE EXCEPTION 'Isikut, mille staatus ei ole mitteaktiivne, ei saa kustutada.';
    END;
    $f_isiku_kustutamise_piirang$ LANGUAGE plpgsql;

COMMENT ON FUNCTION f_isiku_kustutamise_piirang() IS 'Takista isiku kustutamine, kui isiku staatus ei ole mitteaktiivne';

drop trigger isiku_kustutamise_piirang on isik;

CREATE trigger isiku_kustutamise_piirang BEFORE DELETE ON isik
    FOR EACH ROW
    WHEN ( old.isiku_seisundi_liigi_kood != 4 )
    EXECUTE FUNCTION f_isiku_kustutamise_piirang();   