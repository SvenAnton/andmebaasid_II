-- OP3 Aktiveeri Auto
CREATE OR REPLACE FUNCTION f_aktiveeri_auto(p_auto_kood integer)
    RETURNS integer
    LANGUAGE sql
AS
$$
UPDATE auto
SET auto_seisundi_liigi_kood = 2
WHERE auto_kood = p_auto_kood
    AND auto_seisundi_liigi_kood IN (1, 3)
RETURNING auto_kood;
$$
SECURITY DEFINER
SET search_path = public, pg_temp;
;

COMMENT ON FUNCTION f_aktiveeri_auto(p_auto_kood integer) IS 'OP3 Aktiveeri Auto.Auto haldur vaatab ootel või mitteaktiivsete Autode nimekirja, valib sealt Auto ja muudab selle aktiivseks.';


