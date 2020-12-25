-- OP8 Eemalda Auto kategooriast
CREATE OR REPLACE FUNCTION f_eemalda_auto_kategooriast(p_auto_kood integer, p_auto_kategooria_kood integer)
    RETURNS integer
    LANGUAGE sql
AS
$$
DELETE FROM auto_kategooria_omamine ako
USING auto a
WHERE a.auto_kood = p_auto_kood
  AND a.auto_seisundi_liigi_kood IN (1, 3)
  AND ako.auto_kategooria_kood = p_auto_kategooria_kood
RETURNING a.auto_kood;
$$
    SECURITY DEFINER
    SET search_path = public, pg_temp
;

COMMENT ON FUNCTION f_eemalda_auto_kategooriast(p_auto_kood integer, p_auto_kategooria_kood integer) IS 'OP8 Eemalda Auto kategooriast. Auto haldur saab ükshaaval kõikide kategooriasse kuulumiste andmed kustutada.'