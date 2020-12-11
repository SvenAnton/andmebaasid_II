-- OP4 Muuda Auto mitteaktiivseks
CREATE OR REPLACE FUNCTION f_deaktiveeri_auto(p_auto_kood integer)
    RETURNS integer
    LANGUAGE sql
AS
$$
UPDATE auto
SET auto_seisundi_liigi_kood = 3
WHERE auto_kood = p_auto_kood
  AND auto_seisundi_liigi_kood = 2
RETURNING auto_kood;
$$
;

COMMENT ON FUNCTION f_deaktiveeri_auto(p_auto_kood integer) is 'OP4 Muuda Auto mitteaktiivseks. Auto haldur vaatab aktiivsete Autode nimekirja, valib sealt Auto ja muudab selle mitteaktiivseks.';