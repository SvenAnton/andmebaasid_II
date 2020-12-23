create or replace function f_test_genereeri_tootajad(rows integer)
    returns table(isik_id bigint, mentor bigint, ameti_kood int, tootaja_seisundi_liigi_kood int) as
    $$
    SELECT
      (SELECT array_agg(isik_id) FROM isik)[(
        ((SELECT count(*) FROM isik) * random())::int % (SELECT count(*) FROM isik) + 1
        )::int],
        (SELECT '{null, 1, 2, 3}'::int[])[(random()*6)::int % 6 + 1],
        2,
        (random() * 7)::int % 7 + 1
    FROM generate_series(6, rows+6)
    $$
language sql
SECURITY DEFINER
SET search_path = public, pg_temp;

comment on function f_test_genereeri_tootajad(rows integer) is 'Funktsioon genereerib töötajate testandmed, mida on võimalik lisada tabelisse tootaja. Sisend on soovitud ridade arv.';


-- INSERT THREE EMPOLYEES THAT WILL BE MENTORS
insert into
    Tootaja(isik_id, mentor, ameti_kood, tootaja_seisundi_liigi_kood)
values
    (1, 2, 1, 1),
    (2, null, 2, 2),
    (3, null, 1, 1);

insert into
    Tootaja(isik_id, mentor, ameti_kood, tootaja_seisundi_liigi_kood)
select * from f_test_genereeri_tootajad(5000)
ON CONFLICT DO NOTHING;

select count(*) from tootaja;