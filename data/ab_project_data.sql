insert into
    Isiku_seisundi_liik(isiku_seisundi_liigi_kood, nimetus)
values
    (1, 'Elus'),
    (2, 'Surnud');

insert into
    Riik(riigi_kood, nimetus)
values
    ('EST', 'Eesti'),
    ('LAT', 'Läti'),
    ('FIN', 'Soome');

insert into
    Isik(e_meil, parool, eesnimi, perenimi, elukoht, isikukood, isikukoodi_riik, synni_kp, isiku_seisundi_liigi_kood)
values
    ('test@test.com', 'test', 'Heli', 'Kopter', 'Tartu', '38001010101', 'EST', TO_DATE('1980-01-01', 'YYYY-MM-DD'), '1'),
    ('test1@test.com', 'test', 'Mari', 'Kopter', 'Tallinn', '38101010101', 'EST', TO_DATE('1981-01-01', 'YYYY-MM-DD'), '1'),
    ('test2@test.com', 'test', 'John', 'Rambo', 'Saue', '38201010101', 'FIN', TO_DATE('1982-01-01', 'YYYY-MM-DD'), '1');

insert into
    Tootaja_seisundi_liik(tootaja_seisundi_liigi_kood, nimetus)
values
    (1, 'Tööl'),
    (2, 'Puhkusel'),
    (3, 'Haiguslehel'),
    (4, 'Töösuhe peatatud'),
    (5, 'Vallandatud'),
    (6, 'Katseajal'),
    (7, 'Töösuhe lõpetatud omal soovil');

insert into
    Amet(ameti_kood, nimetus, kirjeldus)
values
    (1, 'Juhataja', 'Põhiline boss'),
    (2, 'Autode haldur', 'Teeb kõike seoses autodega'),
    (3, 'Raamatupidaja', 'Hoiab paberid korras');

insert into
    Tootaja(isik_id, mentor, ameti_kood, tootaja_seisundi_liigi_kood)
values
    (1, 2, 1, 1),
    (2, null, 2, 2);

insert into
    Mark(margi_kood, nimetus)
values
    (1, 'Nissan'),
    (2, 'Opel');

insert into
    Mudel(mudeli_kood, nimetus, margi_kood)
values
    (1, 'Tesla Model X', 1),
    (2, 'Alpha Romeo Spider', 2);

insert into
    Kytuse_tyyp(kytuse_tyybi_kood, nimetus)
values
    (1, 'sisepõlemismootor'),
    (2, 'elektrimootor'),
    (3, 'hübriid');

insert into
    keretyyp(keretyybi_kood, nimetus)
values
    (1, 'universaal'),
    (2, 'sedaan'),
    (3, 'kabriolett');

insert into
    auto_seisundi_liik(auto_seisundi_liigi_kood, nimetus)
values
    (1, 'Ootel'),
    (2, 'Aktiivne'),
    (3, 'Mitteaktiivne'),
    (4, 'Lõpetatud');

insert into
    auto_kategooria_tyyp(auto_kategooria_tyybi_kood, nimetus)
values
    (1, 'Auto kasutusvaldkond'),
    (2, 'Lõpusõit'),
    (3, 'Sport'),
    (4, 'Matkamine'),
    (5, 'Tööasjad');

insert into
    auto_kategooria(auto_kategooria_kood, nimetus, auto_kategooria_tyybi_kood)
values
    (1, 'Üldkasutus', 1),
    (2, 'Lõpp', 2),
    (3, 'Sportimine', 3),
    (4, 'Matkab', 4),
    (5, 'Teeb tood', 5);

insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood) values ('1', '2');
insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood) values ('2', '3');
insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood) values ('1', '4');
insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood) values ('3', '2');
insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood) values ('4', '1');

insert into AUTO(auto_kood, vin_kood, acriss_kood, kohtade_arv, mudeli_kood, kytuse_tyybi_kood, keretyybi_kood, auto_seisundi_liigi_kood, registreerija_id)
values ('1', 'KM8SC13DX6U081851', 'IDMR', 3, '1', '2','1', '1', '1');
insert into AUTO(auto_kood, vin_kood, acriss_kood, kohtade_arv, mudeli_kood, kytuse_tyybi_kood, keretyybi_kood, auto_seisundi_liigi_kood, registreerija_id)
values ('2', '1GKS1KE09ER265615', 'MDMR', 4, '2', '1','2', '1', '2');
insert into AUTO(auto_kood, vin_kood, acriss_kood, kohtade_arv, mudeli_kood, kytuse_tyybi_kood, keretyybi_kood, auto_seisundi_liigi_kood, registreerija_id)
values ('3', '1FMHK8F80CGA27344', 'NDMR', 5, '1', '2','2', '2', '1');
insert into AUTO(auto_kood, vin_kood, acriss_kood, kohtade_arv, mudeli_kood, kytuse_tyybi_kood, keretyybi_kood, auto_seisundi_liigi_kood, registreerija_id)
values ('4', '4A3AA46G41E148991', 'MDMR', 4, '1', '3','3', '4', '2');

insert into kliendi_seisundi_liik(kliendi_seisundi_liigi_kood, nimetus)
VALUES (1, 'Aktiivne'), (2, 'Mitte-aktiivne');

insert into klient(isik_id, kliendi_seisundi_liigi_kood, on_nous_tylitamisega)
VALUES (1, 1, true), (2, 2, false);
