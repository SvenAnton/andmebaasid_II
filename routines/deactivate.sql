-- OP4 Muuda Auto mitteaktiivseks
create or replace function deaktiveeri_auto(p_auto_kood integer)
    returns integer
    language plpgsql
AS
$$
declare
    result integer;
begin
    select auto_kood into result
    from auto
    where auto_kood = p_auto_kood
      and auto_seisundi_liigi_kood = 2
        for update;

    update auto
    set auto_seisundi_liigi_kood = 3
    where auto_kood = p_auto_kood
      and auto_seisundi_liigi_kood = 2;

    return result;
end
$$
;

comment on function deaktiveeri_auto(p_auto_kood integer) is 'OP4 Muuda Auto mitteaktiivseks';