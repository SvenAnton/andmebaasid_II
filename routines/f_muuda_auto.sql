-- OP6 Muuda Auto
CREATE OR REPLACE FUNCTION f_muuda_auto(p_auto_kood_vana integer,
                                        p_auto_kood_uus integer,
                                        p_acriss_kood varchar,
                                        p_kohtade_arv smallint,
                                        p_vin_kood varchar,
                                        p_keretyybi_kood smallint,
                                        p_kytuse_tyybi_kood smallint,
                                        p_mudeli_kood smallint)
    RETURNS integer
    LANGUAGE sql
AS
$$
UPDATE auto
SET auto_kood         = p_auto_kood_uus,
    acriss_kood       = p_acriss_kood,
    kohtade_arv       = p_kohtade_arv,
    vin_kood          = p_vin_kood,
    keretyybi_kood    = p_keretyybi_kood,
    kytuse_tyybi_kood = p_kytuse_tyybi_kood,
    mudeli_kood       = p_mudeli_kood
WHERE auto_kood = p_auto_kood_vana
  AND auto_seisundi_liigi_kood IN (1, 3)
RETURNING auto_kood;
$$
security definer
set search_path = public, pg_temp
;

COMMENT ON FUNCTION f_muuda_auto(p_auto_kood_vana integer, p_auto_kood_uus integer, p_acriss_kood varchar, p_kohtade_arv smallint, p_vin_kood varchar, p_keretyybi_kood smallint, p_kytuse_tyybi_kood smallint, p_mudeli_kood smallint) IS 'OP6 Muuda Auto. Auto haldur vaatab ootel või mitteaktiivsete Autode nimekirja, valib sealt Auto ja muudab selle andmeid.';