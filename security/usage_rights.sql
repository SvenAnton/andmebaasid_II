-- Tabelite kohta on ka uuendused, aga seda siin ei kajasta.

create user application with password 'andmebaasid2kursus';
grant all privileges on all tables in schema jhi, public, valine to application;

-- DOMAIN
grant usage on domain public.nimetus to application;
REVOKE usage ON domain public.nimetus  FROM PUBLIC, t202680, t200582, t185127;


-- ROUTINES
grant execute on routine public.f_aktiveeri_auto(p_auto_kood integer) to application;
grant execute on routine public.f_auto_kustutamise_piirang() to application;
grant execute on routine public.f_deaktiveeri_auto(p_auto_kood integer) to application;
grant execute on routine public.f_lopeta_auto(p_auto_kood integer) to application;
grant execute on routine public.f_mitteaktiivse_auto_uuendamine() to application;
grant execute on routine public.f_muuda_auto(p_auto_kood_vana integer, p_auto_kood_uus integer, p_acriss_kood character varying, p_kohtade_arv smallint, p_vin_kood character varying, p_keretyybi_kood smallint, p_kytuse_tyybi_kood smallint, p_mudeli_kood smallint) to application;


REVOKE EXECUTE ON ROUTINE public.f_aktiveeri_auto(p_auto_kood integer) FROM PUBLIC, t202680, t200582, t185127;
REVOKE EXECUTE ON ROUTINE public.f_isiku_kustutamise_piirang() FROM PUBLIC, t202680, t200582, t185127, application;
REVOKE EXECUTE ON ROUTINE public.f_auto_kustutamise_piirang() FROM PUBLIC, t202680, t200582, t185127, application;
REVOKE EXECUTE ON ROUTINE public.f_deaktiveeri_auto(p_auto_kood integer) FROM PUBLIC, t202680, t200582, t185127;
REVOKE EXECUTE ON ROUTINE public.f_lopeta_auto(p_auto_kood integer) FROM PUBLIC, t202680, t200582, t185127;
REVOKE EXECUTE ON ROUTINE public.f_mitteaktiivse_auto_uuendamine() FROM PUBLIC, t202680, t200582, t185127, application;
REVOKE EXECUTE ON ROUTINE public.f_muuda_auto(p_auto_kood_vana integer, p_auto_kood_uus integer, p_acriss_kood character varying, p_kohtade_arv smallint, p_vin_kood character varying, p_keretyybi_kood smallint, p_kytuse_tyybi_kood smallint, p_mudeli_kood smallint) from PUBLIC, t202680, t200582, t185127;


-- ALL ROUTINES IN PUBLIC
revoke execute on all functions in schema public from PUBLIC, t202680, t200582, t185127;

-- VIEWS
revoke select on v_auto, v_auto_koondaruanne, v_auto_list, v_lopeta_auto from PUBLIC, t202680, t200582, t185127;
grant select on v_auto, v_auto_koondaruanne, v_auto_list, v_lopeta_auto to application;


ALTER VIEW public.v_auto SET (security_barrier);

-- 22-12-2020
GRANT SELECT ON v_isik to application;
REVOKE SELECT ON isik, isiku_seisundi_liik FROM application;

-- 23-12-2020
REVOKE EXECUTE ON ROUTINE public.f_eemalda_auto_kategooriast(p_auto_kood integer, p_auto_kategooria_kood integer) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_lisa_auto_kategooriasse(p_auto_kood integer, p_auto_kategooria_kood integer) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_registreeri_auto(p_auto_kood integer, p_registreerija_id integer, p_acriss_kood character varying, p_kohtade_arv smallint, p_vin_kood character varying, p_keretyybi_kood smallint, p_kytuse_tyybi_kood smallint, p_mudeli_kood smallint) FROM PUBLIC;
REVOKE EXECUTE ON ROUTINE public.f_unusta_auto(p_auto_kood integer) FROM PUBLIC;
