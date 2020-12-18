CREATE OR REPLACE VIEW v_auto AS
SELECT a.acriss_kood,
       a.vin_kood,
       a.kohtade_arv,
       a.reg_aeg,
       mk.nimetus   AS margi_nimetus,
       md.nimetus   AS mudeli_nimetus,
       krt.nimetus  AS keretyybi_nimetus,
       kt.nimetus   AS kytuse_tyybi_nimetus,
       aslk.nimetus AS auto_seisundi_liigi_nimetus,
       i.eesnimi    AS registeerija_eesnimi,
       i.perenimi   AS registeerija_perenimi,
       i.e_meil     AS registeerija_e_meil
FROM auto a
         JOIN mudel md USING (mudeli_kood)
         JOIN mark mk USING (margi_kood)
         JOIN keretyyp krt USING (keretyybi_kood)
         JOIN kytuse_tyyp kt USING (kytuse_tyybi_kood)
         JOIN auto_seisundi_liik aslk USING (auto_seisundi_liigi_kood)
         JOIN isik i ON a.registreerija_id = i.isik_id;

COMMENT ON VIEW V_AUTO IS 'Auto detaili vaade';

