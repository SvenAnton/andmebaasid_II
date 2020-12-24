-- OP2 Unusta Auto
CREATE OR REPLACE FUNCTION f_unusta_auto(p_auto_kood integer)
    RETURNS integer
    LANGUAGE sql
AS
$$
DELETE FROM auto
WHERE auto_kood = p_auto_kood
    AND auto_seisundi_liigi_kood = 1
RETURNING auto_kood;
$$
    SECURITY DEFINER
    SET search_path = public, pg_temp
;

COMMENT ON FUNCTION f_unusta_auto(p_auto_kood integer) IS 'OP2 Unusta Auto.Auto haldur vaatab ootel Autode nimekirja, valib sealt Autot ja kustutab selle andmebaasist.'