CREATE OR REPLACE FUNCTION f_mitteaktiivse_auto_uuendamine() RETURNS trigger AS $f_mitteaktiivse_auto_uuendamine$
    BEGIN
        -- Kontrolli, kas auto on mitteaktiivne voi lopetatud
        IF old.auto_seisundi_liigi_kood=2 AND new.auto_seisundi_liigi_kood=2
               OR old.auto_seisundi_liigi_kood=1 AND new.auto_seisundi_liigi_kood=1 THEN
            RAISE EXCEPTION 'Aktiivse või ootel oleva auto omadusi ei saa muuta.';
        END IF;
        RETURN new;
    END;
$f_mitteaktiivse_auto_uuendamine$ LANGUAGE plpgsql;

COMMENT ON FUNCTION f_mitteaktiivse_auto_uuendamine() IS
    'Takista auto väärtuste muutmine, kui auto on aktiivne või ootal.';
ALTER FUNCTION f_mitteaktiivse_auto_uuendamine() OWNER TO t200582;

DROP trigger mitteaktiivse_auto_uuendamine ON auto;

CREATE trigger mitteaktiivse_auto_uuendamine BEFORE UPDATE ON auto
    FOR EACH ROW EXECUTE FUNCTION f_mitteaktiivse_auto_uuendamine();