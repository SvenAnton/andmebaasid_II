CREATE OR REPLACE VIEW v_auto AS

SELECT a.acriss_kood as acriss_kood,
       a.vin_kood    as vin_kood,
       a.kohtade_arv as kohtade_arv,
       a.reg_aeg     as reg_aeg,
       mk.nimetus    as margi_nimetus,
       md.nimetus    as mudeli_nimetus,
       krt.nimetus   as keretyybi_nimetus,
       kt.nimetus    as kytuse_tyybi_nimetus,
       aslk.nimetus  as staatus,
       i.eesnimi     as registeerija_eesnimi,
       i.perenimi    as registeerija_perenimi,
       i.e_meil      as registeerija_e_meil

FROM auto a
         inner join mudel md using (mudeli_kood)
         inner join mark mk using (margi_kood)
         inner join keretyyp krt using (keretyybi_kood)
         inner join kytuse_tyyp kt using (kytuse_tyybi_kood)
         inner join auto_seisundi_liik aslk using (auto_seisundi_liigi_kood)
         inner join isik i on a.registreerija_id = i.isik_id;

COMMENT ON VIEW v_auto IS 'Auto detaili vaade';