CREATE OR REPLACE VIEW tootajad AS

    SELECT
        isik.eesnimi || ' ' || isik.perenimi AS "nimi",
        isik.e_meil AS "e-meil",
        seisund.nimetus AS "olek",
        amet.nimetus AS "amet",
        i.eesnimi || ' ' || i.perenimi AS "mentor"

    FROM tootaja
    INNER JOIN isik USING (isik_id)
    INNER JOIN tootaja_seisundi_liik seisund USING (tootaja_seisundi_liigi_kood)
    INNER JOIN amet USING (ameti_kood)
    LEFT JOIN isik i ON mentor=i.isik_id
;