-- OP5 Lõpeta Auto
create or replace function f_lopeta_auto(p_auto_kood integer)
    returns integer
    language sql
AS
$$
update auto
set auto_seisundi_liigi_kood = 4
where auto_kood = p_auto_kood
    and auto_seisundi_liigi_kood in (2, 3)
returning auto_kood;
$$
;

comment on function f_lopeta_auto(p_auto_kood integer) is 'OP5 Lõpeta Auto';