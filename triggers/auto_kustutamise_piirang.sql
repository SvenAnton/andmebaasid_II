create or replace function f_auto_kustutamise_piirang() RETURNS trigger AS $f_auto_kustutamise_piirang$
    BEGIN
        -- Kontrolli, et auto seisundi liik oleks lõpetatud
        IF old.auto_seisundi_liigi_kood <> 4 THEN
            RAISE EXCEPTION 'Autot, mille staatus ei ole lõpetatud olekus, ei saa kustutada.';
        END IF;
        RETURN old;
    END;
    $f_auto_kustutamise_piirang$ LANGUAGE plpgsql;

COMMENT ON FUNCTION f_auto_kustutamise_piirang() IS 'Takista auto kustutamine, kui auto staatus ei ole lõpetatud';
ALTER FUNCTION f_auto_kustutamise_piirang() OWNER TO t200582;

DROP trigger auto_kustutamise_piirang ON AUTO;

CREATE trigger auto_kustutamise_piirang BEFORE DELETE ON AUTO
    for each ROW EXECUTE FUNCTION f_auto_kustutamise_piirang();