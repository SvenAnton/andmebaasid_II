-- OP3 Aktiveeri Auto
create or replace function f_aktiveeri_auto(p_auto_kood integer)
    returns integer
    language sql
AS
$$
update auto
set auto_seisundi_liigi_kood = 2
where auto_kood = p_auto_kood
    and auto_seisundi_liigi_kood in (1, 3)
returning auto_kood;
$$
;

comment on function f_eaktiveeri_auto(p_auto_kood integer) is 'OP3 Aktiveeri Auto';