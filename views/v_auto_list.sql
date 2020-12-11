CREATE OR REPLACE VIEW v_auto_list AS

SELECT auto.acriss_kood as acriss_kood,
       auto.vin_kood    as vin_kood,
       auto.kohtade_arv as kohtade_arv,
       mk.nimetus       as margi_nimetus,
       md.nimetus       as mudeli_nimetus,
       krt.nimetus      as keretyybi_nimetus,
       kt.nimetus       as kytuse_tyybi_nimetus,
       aslk.nimetus     as staatus

FROM auto
         inner join mudel md using (mudeli_kood)
         inner join mark mk using (margi_kood)
         inner join keretyyp krt using (keretyybi_kood)
         inner join kytuse_tyyp kt using (kytuse_tyybi_kood)
         inner join auto_seisundi_liik aslk using (auto_seisundi_liigi_kood);

COMMENT ON VIEW v_auto_list IS 'Subjekt saab vaadata Autode nimekirja. Subjekt saab nimekirja sorteerida ja filtreerida. Samuti saab ta iga Auto korral vaadata selle kõiki detailseid andmeid, sh hetkeseisund, registreerimise aeg ja registreerinud töötaja.';