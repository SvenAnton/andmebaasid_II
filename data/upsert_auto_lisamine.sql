
insert into auto(auto_kood, vin_kood, acriss_kood, kohtade_arv, mudeli_kood, kytuse_tyybi_kood,
                 keretyybi_kood, auto_seisundi_liigi_kood, registreerija_id)
select * from f_test_genereeri_autod(10100)
ON CONFLICT(auto_kood) DO UPDATE SET auto_kood=excluded.auto_kood, registreerija_id=excluded.registreerija_id
where auto.auto_seisundi_liigi_kood IN (2,3);