create or replace function f_test_genereeri_autod(rows int)
returns table (auto_kood int, vin_kood varchar(17), acriss_kood varchar(4),
    kohtade_arv smallint, mudeli_kood smallint, kytuse_tyybi_kood smallint,
    keretyybi_kood smallint, auto_seisundi_liigi_kood smallint, registreerija_id int)
as
    $$
    SELECT
        i::int,
        upper(left(md5(random()::text), 17)),
        array_to_string(array(
            SELECT substr('ABCDEFGHIJKLMNOPQRSTUVWXYZ',(((random() * 10)::int % 10 + 1)::integer),1)
            FROM generate_series(1,4 + s.i*0  )),''),
        (random() * 10)::int % 10 + 1::int,
        (random() * 2)::int % 2 + 1::int,
        (random() * 3)::int % 3 + 1::int,
        (random() * 3)::int % 3 + 1::int,
        (random() * 4)::int % 4 + 1::int,
        (SELECT array_agg(isik_id) FROM tootaja)[(
            ((SELECT count(*) FROM tootaja) * random())::int % (SELECT count(*) FROM tootaja) + 1
            )::int]
    FROM generate_series(1, rows) s(i)
    $$
LANGUAGE sql
SECURITY DEFINER
SET search_path = public, pg_temp;

comment on function f_test_genereeri_autod(rows int) is 'Create test data for table auto with given number of rows';



-- ABIFUNKTSIOONID

insert into AUTO(auto_kood, vin_kood, acriss_kood, kohtade_arv, mudeli_kood, kytuse_tyybi_kood,
                 keretyybi_kood, auto_seisundi_liigi_kood, registreerija_id)
select * from create_rand_cars(10000);

-- Check number of autos
select count(*) from auto;

-- For deletion of autos
update auto set auto_seisundi_liigi_kood=4;
delete from auto;