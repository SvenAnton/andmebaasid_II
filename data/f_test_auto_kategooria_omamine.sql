create or replace function f_test_genereeri_auto_kategooria_omamine(rows integer)
returns table(auto_kood integer, auto_kategooria_kood integer) as
    $$
    SELECT
        -- Select auto randomly from auto table
        (SELECT array_agg(auto_kood) FROM auto)[(
            ((SELECT count(*) FROM auto) * random())::int % (
                SELECT count(*) FROM auto) + 1)::int],
        -- Select auto_katefooria randomly from auto table
        (SELECT array_agg(auto_kategooria_kood) FROM auto_kategooria)[(
            ((SELECT count(*) FROM auto_kategooria) * random())::int % (
                SELECT count(*) FROM auto_kategooria) + 1)::int]
    FROM generate_series(1, rows)
    $$
LANGUAGE sql
SECURITY DEFINER
SET search_path = public, pg_temp;

COMMENT ON FUNCTION f_test_genereeri_auto_kategooria_omamine(rows integer)
IS 'Genereeri test tabel auto_kategooria_omamine, mida saab kasutada testandmete sisestamiseks';


insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood)
SELECT * from f_test_genereeri_auto_kategooria_omamine(5000)
on conflict do nothing ;


select count(*) from auto_kategooria_omamine;