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

comment on function f_mitteaktiivse_auto_uuendamine() is
    'Takista auto väärtuste muutmine, kui auto on aktiivne või ootal.';
alter function f_mitteaktiivse_auto_uuendamine() owner to t200582;

drop trigger mitteaktiivse_auto_uuendamine on auto;

create trigger mitteaktiivse_auto_uuendamine BEFORE UPDATE ON auto
    FOR EACH ROW EXECUTE FUNCTION f_mitteaktiivse_auto_uuendamine();