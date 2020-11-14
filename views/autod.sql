CREATE OR REPLACE VIEW autod AS

    SELECT
           vin_kood AS "VIN kood",
           acriss_kood AS "Acriss kood",
           kohtade_arv AS "Kohtade arv",
           mudel.nimetus AS "Mudel",
           mark.nimetus AS "Mark",
           keretyyp.nimetus AS "Kere",
           kytuse_tyyp.nimetus AS "Mootor",
           isik.eesnimi || ' ' || isik.perenimi AS "Auto registreerija",
           amet.nimetus AS "Registreerija amet",
           isik.e_meil AS "Registreerija kontakt",
           asl.nimetus AS "Auto seisund"

    FROM auto
    INNER JOIN mudel USING (mudeli_kood)
    INNER JOIN mark ON mark.margi_kood = mudel.margi_kood
    INNER JOIN keretyyp USING (keretyybi_kood)
    INNER JOIN kytuse_tyyp USING (kytuse_tyybi_kood)
    INNER JOIN tootaja t ON auto.registreerija_id = t.isik_id
    INNER JOIN isik ON isik.isik_id = t.isik_id
    INNER JOIN amet ON t.ameti_kood = amet.ameti_kood
    INNER JOIN auto_seisundi_liik asl USING (auto_seisundi_liigi_kood)
;