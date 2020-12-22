CREATE OR REPLACE VIEW v_isik AS
SELECT i.isik_id,
       i.kasutajanimi,
       i.parool,
       i.eesnimi AS isiku_eesnimi,
       i.perenimi AS isiku_perenimi,
       i.e_meil,
       i.isikukood,
       i.isikukoodi_riik,
       i.synni_kp,
       isl.nimetus AS isiku_seisundi_liigi_nimetus,
       i.keelekood,
       i.pildi_aadress,
       i.aktiveerimise_voti,
       i.reset_voti,
       i.reset_aeg
FROM isik i
         INNER JOIN isiku_seisundi_liik isl ON i.isiku_seisundi_liigi_kood = isl.isiku_seisundi_liigi_kood;

COMMENT ON VIEW v_isik IS 'Isiku vaade, mis rakendus kasutab autentimise jaoks.';

