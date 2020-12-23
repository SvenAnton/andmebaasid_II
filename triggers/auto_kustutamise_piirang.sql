create or replace function f_auto_kustutamise_piirang() RETURNS trigger AS $f_auto_kustutamise_piirang$
    BEGIN
        RAISE EXCEPTION 'Autot, mille staatus ei ole ootel või mitteaktiivne olekus, ei saa kustutada.';
    END;
    $f_auto_kustutamise_piirang$ LANGUAGE plpgsql;

COMMENT ON FUNCTION f_auto_kustutamise_piirang() IS 'Takista auto kustutamine, kui auto staatus ei ole ootel või mitteaktiivne';
ALTER FUNCTION f_auto_kustutamise_piirang() OWNER TO t200582;

DROP trigger auto_kustutamise_piirang ON AUTO;

CREATE trigger auto_kustutamise_piirang BEFORE DELETE ON AUTO
    FOR EACH ROW
    WHEN (OLD.auto_seisundi_liigi_kood NOT IN (1, 3))
    EXECUTE FUNCTION f_auto_kustutamise_piirang();