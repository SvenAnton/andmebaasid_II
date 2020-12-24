-- OP1 Registreeri Auto
CREATE OR REPLACE FUNCTION f_registreeri_auto(p_auto_kood integer,
                                              p_registreerija_id integer,
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
INSERT INTO auto(auto_kood,
                 vin_kood,
                 acriss_kood,
                 kohtade_arv,
                 mudeli_kood,
                 kytuse_tyybi_kood,
                 keretyybi_kood,
                 registreerija_id)
VALUES (p_auto_kood,
        p_vin_kood,
        p_acriss_kood,
        p_kohtade_arv,
        p_mudeli_kood,
        p_kytuse_tyybi_kood,
        p_keretyybi_kood,
        p_registreerija_id)
RETURNING auto_kood;
$$
    SECURITY DEFINER
    SET search_path = public, pg_temp
;

COMMENT ON FUNCTION f_registreeri_auto(p_auto_kood integer, p_registreerija_id integer, p_acriss_kood varchar, p_kohtade_arv smallint, p_vin_kood varchar, p_keretyybi_kood smallint, p_kytuse_tyybi_kood smallint, p_mudeli_kood smallint) IS 'OP1 Registreeri Auto.Auto haldur registreerib uue Auto.'