CREATE OR REPLACE FUNCTION f_isiku_kustutamise_piirang() RETURNS trigger AS $f_isiku_kustutamise_piirang$
    BEGIN
        -- Kontrolli, et isiku seisundi liik oleks mitteaktiivne
        IF old.isiku_seisundi_liigi_kood <> 4 THEN
            RAISE EXCEPTION 'Isikut, mille staatus ei ole mitteaktiivne, ei saa kustutada.';
        END IF;
        RETURN old;
    END;
    $f_isiku_kustutamise_piirang$ LANGUAGE plpgsql;

COMMENT ON FUNCTION f_isiku_kustutamise_piirang() IS 'Takista isiku kustutamine, kui isiku staatus ei ole mitteaktiivne';

CREATE trigger isiku_kustutamise_piirang BEFORE DELETE ON isik
    FOR EACH ROW EXECUTE FUNCTION f_isiku_kustutamise_piirang();

DROP TRIGGER isiku_kustutamise_piirang ON isik;     