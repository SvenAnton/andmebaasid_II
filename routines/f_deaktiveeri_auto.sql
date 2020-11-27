-- OP4 Muuda Auto mitteaktiivseks
create or replace function f_deaktiveeri_auto(p_auto_kood integer)
    returns integer
    language sql
AS
$$
declare
    result integer;
begin
    update auto
    set auto_seisundi_liigi_kood = 3
    where auto_kood = p_auto_kood
      and auto_seisundi_liigi_kood = 2
    returning result;
end
$$
;

comment on function f_deaktiveeri_auto(p_auto_kood integer) is 'OP4 Muuda Auto mitteaktiivseks';