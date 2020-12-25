CREATE OR REPLACE FUNCTION f_mitteaktiivse_auto_uuendamine() RETURNS trigger AS $f_mitteaktiivse_auto_uuendamine$
    BEGIN
        RAISE EXCEPTION 'Autot, mille staatus ei ole aktiivne või mitteaktiivne olekus, ei saa muuta.';
    END;
$f_mitteaktiivse_auto_uuendamine$ LANGUAGE plpgsql;

COMMENT ON FUNCTION f_mitteaktiivse_auto_uuendamine() IS
    'Takista auto väärtuste muutmine, kui auto on aktiivne või mitteaktiivne.';
ALTER FUNCTION f_mitteaktiivse_auto_uuendamine() OWNER TO t200582;

DROP trigger mitteaktiivse_auto_uuendamine ON auto;

CREATE trigger mitteaktiivse_auto_uuendamine BEFORE UPDATE ON auto
    FOR EACH ROW
    WHEN (OLD.auto_seisundi_liigi_kood NOT IN (2, 3))
    EXECUTE FUNCTION f_mitteaktiivse_auto_uuendamine();