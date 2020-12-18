CREATE OR REPLACE VIEW v_auto_list AS
SELECT auto.auto_kood,
       auto.acriss_kood,
       auto.vin_kood,
       auto.kohtade_arv,
       auto.reg_aeg,
       mk.nimetus  AS margi_nimetus,
       md.nimetus  AS mudeli_nimetus,
       krt.nimetus AS keretyybi_nimetus,
       kt.nimetus  AS kytuse_tyybi_nimetus,
       asl.nimetus AS auto_seisundi_liigi_nimetus
FROM auto
         JOIN mudel md USING (mudeli_kood)
         JOIN mark mk USING (margi_kood)
         JOIN keretyyp krt USING (keretyybi_kood)
         JOIN kytuse_tyyp kt USING (kytuse_tyybi_kood)
         JOIN auto_seisundi_liik asl USING (auto_seisundi_liigi_kood);

COMMENT ON VIEW V_AUTO_LIST IS 'Subjekt saab vaadata Autode nimekirja. Subjekt saab nimekirja sorteerida ja filtreerida. Samuti saab ta iga Auto korral vaadata selle kõiki detailseid andmeid, sh hetkeseisund, registreerimise aeg ja registreerinud töötaja.';
