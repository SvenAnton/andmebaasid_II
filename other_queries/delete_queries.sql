delete from auto;
delete from tootaja;
delete from klient;
delete from isik;
delete from amet;
delete from auto_kategooria_omamine;
delete from auto_kategooria;
delete from auto_seisundi_liik;
delete from auto_kategooria_tyyp;
delete from isiku_seisundi_liik;
delete from keretyyp;
delete from kliendi_seisundi_liik;
delete from kytuse_tyyp;
delete from mudel;
delete from mark;
delete from riik;
delete from tootaja_seisundi_liik;

truncate isik, tootaja, klient, auto restart identity cascade;
