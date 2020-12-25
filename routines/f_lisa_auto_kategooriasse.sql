-- OP7 Lisa Auto kategooriasse
CREATE OR REPLACE FUNCTION f_lisa_auto_kategooriasse(p_auto_kood integer, p_auto_kategooria_kood integer)
    RETURNS integer
    LANGUAGE sql
AS
$$
INSERT INTO auto_kategooria_omamine(auto_kood, auto_kategooria_kood)
SELECT p_auto_kood, p_auto_kategooria_kood
FROM auto
WHERE auto_kood = p_auto_kood
  AND auto_seisundi_liigi_kood IN (1, 3)
RETURNING auto_kood;
$$
    SECURITY DEFINER
    SET search_path = public, pg_temp
;

COMMENT ON FUNCTION f_lisa_auto_kategooriasse(p_auto_kood integer, p_auto_kategooria_kood integer) IS 'OP7 Lisa Auto kategooriasse.Auto haldur saab ükshaaval kõikide kategooriasse kuulumiste andmed salvestada.'