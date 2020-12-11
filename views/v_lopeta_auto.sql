CREATE OR REPLACE VIEW v_lopeta_auto AS

SELECT auto.acriss_kood as acriss_kood,
       auto.vin_kood    as vin_kood,
       auto.kohtade_arv as kohtade_arv,
       mk.nimetus       as margi_nimetus,
       md.nimetus       as mudeli_nimetus,
       krt.nimetus      as keretyybi_nimetus,
       kt.nimetus       as kytuse_tyybi_nimetus,
       asl.nimetus      as staatus

FROM auto
         inner join mudel md using (mudeli_kood)
         inner join mark mk using (margi_kood)
         inner join keretyyp krt using (keretyybi_kood)
         inner join kytuse_tyyp kt using (kytuse_tyybi_kood)
         inner join auto_seisundi_liik asl using (auto_seisundi_liigi_kood)

WHERE 1 = 1
  AND asl.auto_seisundi_liigi_kood IN (2, 3);

COMMENT ON VIEW v_lopeta_auto IS 'Juhataja vaatab aktiivsete või mitteaktiivsete Autode nimekirja, valib sealt Auto ja lõpetab selle. Subjekt saab nimekirja sorteerida ja filtreerida.';