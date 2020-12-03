-- OP6 Muuda Auto
create or replace function f_muuda_auto(p_auto_kood_vana integer,
                                        p_auto_kood_uus integer,
                                        p_acriss_kood varchar,
                                        p_kohtade_arv smallint,
                                        p_vin_kood varchar,
                                        p_keretyybi_kood smallint,
                                        p_kytuse_tyybi_kood smallint,
                                        p_mudeli_kood smallint)
    returns integer
    language sql
AS
$$
update auto
set auto_kood         = p_auto_kood_uus,
    acriss_kood       = p_acriss_kood,
    kohtade_arv       = p_kohtade_arv,
    vin_kood          = p_vin_kood,
    keretyybi_kood    = p_keretyybi_kood,
    kytuse_tyybi_kood = p_kytuse_tyybi_kood,
    mudeli_kood       = p_mudeli_kood
where auto_kood = p_auto_kood_vana
    and auto_seisundi_liigi_kood in (1, 3)
returning auto_kood;
$$
;

comment on function f_muuda_auto(p_auto_kood_vana integer, p_auto_kood_uus integer, p_acriss_kood varchar, p_kohtade_arv smallint, p_vin_kood varchar, p_keretyybi_kood smallint, p_kytuse_tyybi_kood smallint, p_mudeli_kood smallint) is 'OP6 Muuda Auto';