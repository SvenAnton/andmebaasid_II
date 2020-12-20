CREATE OR REPLACE VIEW v_auto AS
SELECT a.auto_kood,
       a.acriss_kood,
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
       i.e_meil     AS registeerija_e_meil,
       string_agg(ak.nimetus || ' | ' || akt.nimetus, ',') as auto_kategooriad
FROM auto a
         INNER JOIN mudel md USING (mudeli_kood)
         INNER JOIN mark mk USING (margi_kood)
         INNER JOIN keretyyp krt USING (keretyybi_kood)
         INNER JOIN kytuse_tyyp kt USING (kytuse_tyybi_kood)
         INNER JOIN auto_seisundi_liik aslk USING (auto_seisundi_liigi_kood)
         INNER JOIN isik i ON a.registreerija_id = i.isik_id
         LEFT JOIN auto_kategooria_omamine ako on a.auto_kood = ako.auto_kood
         LEFT JOIN auto_kategooria ak on ako.auto_kategooria_kood = ak.auto_kategooria_kood
         LEFT JOIN auto_kategooria_tyyp akt on ak.auto_kategooria_tyybi_kood = akt.auto_kategooria_tyybi_kood
GROUP BY a.auto_kood, a.acriss_kood, a.vin_kood, a.kohtade_arv, a.reg_aeg, mk.nimetus, md.nimetus, krt.nimetus, kt.nimetus, aslk.nimetus, i.eesnimi, i.perenimi, i.e_meil;

COMMENT ON VIEW v_auto IS 'Auto detaili vaade';

