-- OP5 Lõpeta Auto
CREATE OR REPLACE FUNCTION f_lopeta_auto(p_auto_kood integer)
    RETURNS integer
    LANGUAGE sql
AS
$$
UPDATE auto
SET auto_seisundi_liigi_kood = 4
WHERE auto_kood = p_auto_kood
    AND auto_seisundi_liigi_kood IN (2, 3)
RETURNING auto_kood;
$$
;

COMMENT ON FUNCTION f_lopeta_auto(p_auto_kood integer) IS 'OP5 Lõpeta Auto.Juhataja vaatab aktiivsete või mitteaktiivsete Autode nimekirja, valib sealt Auto ja lõpetab selle';