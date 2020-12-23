CREATE EXTENSION pgcrypto;

-- GENERATE RANDOM PERSONS

create or replace function f_test_genereeri_isikud(rows integer)
    returns table(e_meil varchar(254), parool varchar(254), eesnimi varchar(254), perenimi varchar(254),
    elukoht varchar(254), isikukood varchar(25), isikukoodi_riik varchar(3), synni_kp date,
     isiku_seisundi_liigi_kood smallint, kasutajanimi varchar(255)) as
    $$
    SELECT
        concat_ws('', left(md5(random()::text), 20), '@test.ee'),
        crypt(md5(random()::text), gen_salt('bf', 12)),
        left(md5(random()::text), 20),
        left(md5(random()::text), 20),
        left(md5(random()::text), 20),
        left(md5(random()::text), 20),
        'EST' AS isikukoodi_riik,
        '2000-01-01'::date,
        3 AS isiku_seisundi_liigi_kood,
        concat_ws('', left(md5(random()::text), 20), '@test.ee')
    FROM generate_series(1, rows);
    $$
    language sql
SECURITY DEFINER
SET search_path = public, pg_temp;

comment on function f_test_genereeri_isikud(rows integer) is 'Funktsioon genereerib test andmed, mida saab lisada isik tabelisse. Sisendiks on soovitavate ridade arv.';


-- Andmete lisamine tabelisse
insert into
    Isik(e_meil, parool, eesnimi, perenimi, elukoht, isikukood, isikukoodi_riik,
         synni_kp, isiku_seisundi_liigi_kood, kasutajanimi)
    select * from f_test_genereeri_isikud(2000);

-- Muuda ridu, kus on samad v22rtused
update isik set isiku_seisundi_liigi_kood='LAT' where isik_id > 10 AND isik_id % 2 = 0;
update isik set isikukoodi_riik='LAT' where isik_id > 10 AND isik_id % 2 = 1;
update isik set synni_kp='1990-01-01' where isik_id > 10 AND isik_id % 3 = 1;

update isik set (keelekood, aktiveerimise_voti, reset_aeg, pildi_aadress,
  reset_voti)=('EST', '1234,', '2020-01-01', 'img.ee', '1234')
where isik_id > 10 AND isik_id % 3 = 1;

update isik set
    (keelekood, aktiveerimise_voti, reset_aeg, pildi_aadress,
    reset_voti)=('LAT', '1as234,', '2020-02-01', 'img.lt', '12as34')
where isik_id > 10 AND isik_id % 3 = 1;