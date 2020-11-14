CREATE EXTENSION IF NOT EXISTS postgres_fdw;
/*Lisan andmebaasi väliste andmete pakendamise laienduse, mis
võimaldab PostgreSQL andmebaasis lugeda andmeid teisest
PostgreSQL andmebaasist (võib olla samas serveris või teises
serveris) ja neid seal ka muuta (seda viimast pole antud
ülesandes vaja teha).
https://robots.thoughtbot.com/postgres-foreign-data-wrapper
PostgreSQL väliste tabelite mehhanism võimaldab juurdepääsu
erinevat tüüpi failide sisule, aga ka juurdepääsu andmetele, mis
  on teistes andmebaasides (võimalik, et teine
andmebaasisüsteem/andmemudel), veebis, infokataloogides jne.
Vaadake PostgreSQL erinevaid väliste andmete pakendajaid:
https://wiki.postgresql.org/wiki/Foreign_data_wrappers */

CREATE SERVER minu_testandmete_server_apex FOREIGN DATA WRAPPER
postgres_fdw OPTIONS (host 'apex.ttu.ee', dbname 'testandmed',
port '5432');
/*Testandmed on apex.ttu.ee serveris andmebaasis testandmed.
Viite loomine väliste andmete asukohale. Seda lauset pole vaja
muuta!*/


CREATE USER MAPPING FOR t202680 SERVER
minu_testandmete_server_apex OPTIONS (user 't202680', password
'p11sonPIISON');
/*Vastavuse defineerimine kohaliku andmebaasi kasutaja ning
selles käskude käivitaja ja välise andmebaasi kasutaja vahel.
Kui teete rühmatööd, siis võite luua ühe sellise vastavuse iga
rühma liikme kohta. Kohaliku ja välise kasutaja nimi langevad
praegu kokku, sest andmebaasid on samas serveris. Siin lauses
kasutage oma apex.ttu.ee kasutajanime ja parooli!*/
CREATE SCHEMA valine;
/*Panen välised tabelid eraldi skeemi.*/
CREATE FOREIGN TABLE valine.Riik_sisend (
riik JSONB )
SERVER minu_testandmete_server_apex OPTIONS (schema_name
'public', table_name 'riik_jsonb', updatable 'false');
/*Loon skeemis valine välise tabeli, mis viitab välises
andmebaasis skeemis public olevale tabelile riik_jsonb, kus
riikide andmed on JSON formaadis. Lähteandmed pärinevad:
https://gist.github.com/jeremybuis/4997305
psqlis on väliste tabelite nimekirja nägemiseks käsk \det
Välises tabelis ei ole lubatud andmeid muuta – omaduse
updatable väärtus on false.
Milliseid omadusi (options) saab välise tabeli juures määrata
sõltub kasutatavast väliste andmete pakendajast.
*/
SELECT * FROM valine.Riik_sisend;

INSERT INTO Riik (riigi_kood, nimetus)
SELECT riik->>'Alpha-3 code' AS riik_kood,
riik->>'English short name lower case' AS nimetus
FROM valine.Riik_sisend;
/*Loen välisest tabelist JSON formaadis andmed, teisendan need
sobivale kujule ja laadin enda andmebaasi tabelisse Riik.
Koodinäiteid ja viiteid PostgreSQLis JSON formaadis andmetega
töötamise kohta vaadake slaidikomplektist "Andmebaasisüsteemide
Oracle ja PostgreSQL kasutamine" – otsige sealt sõna JSON.
https://maurus.ttu.ee/download.php?aine=379&document=35762&tyyp=do
*/
SELECT * FROM Riik;
/*Veendun, et andmed on lisatud.*/


CREATE FOREIGN TABLE valine.Isik_sisend (
isik JSONB )
SERVER minu_testandmete_server_apex OPTIONS (schema_name
'public', table_name 'isik_jsonb', updatable 'false');
SELECT * FROM valine.Isik_sisend;
/*Sellesse tabelisse andmete genereerimiseks kasutasin:
https://www.json-generator.com/ */
INSERT INTO Isik(isikukoodi_riik, isikukood, eesnimi, perenimi,
e_meil, synni_kp, isiku_seisundi_liigi_kood, parool, elukoht)
SELECT riik_kood, isikukood, eesnimi, perenimi, e_meil,
synni_kp::date, isiku_seisundi_liik_kood::smallint, parool,
elukoht
FROM (SELECT isik->>'riik' AS riik_kood,
jsonb_array_elements(isik->'isikud')->>'isikukood' AS isikukood,
jsonb_array_elements(isik->'isikud')->>'eesnimi' AS eesnimi,
jsonb_array_elements(isik->'isikud')->>'perekonnanimi' AS
perenimi,
jsonb_array_elements(isik->'isikud')->>'email' AS e_meil,
jsonb_array_elements(isik->'isikud')->>'synni_aeg' AS synni_kp,
jsonb_array_elements(isik->'isikud')->>'seisund' AS
isiku_seisundi_liik_kood,
jsonb_array_elements(isik->'isikud')->>'parool' AS parool,
jsonb_array_elements(isik->'isikud')->>'aadress' AS elukoht
FROM valine.Isik_sisend) AS lahteandmed
WHERE isiku_seisundi_liik_kood::smallint=1;
/*Loen välisest tabelist JSON formaadis andmed, teisendan need
käigult sobivale kujule ja laadin enda andmebaasi tabelisse
Isik. Loen andmeid ainult isikute kohta, kes on seisundis
koodiga 1 e elus.*/
SELECT * FROM Isik;
/*Veendun, et andmed on lisatud.*/
/*
NB! Alternatiiviks väliste tabelite ükshaaval loomisele on
välise skeemi importimine. skeemi_nimi asemele tuleb kirjutada
skeemi nimi kohalikus andmebaasis, kus soovitakse välised
tabelid luua. Importimisel saab määrata, et soovitakse kõiki
skeemi tabeleid, soovitakse mingeid kindlaid tabeleid või
soovitakse kõiki tabeleid, v.a. mingid kindlad tabelid.
IMPORT FOREIGN SCHEMA public LIMIT TO (riik_jsonb, isik_jsonb)
FROM SERVER minu_testandmete_server_apex INTO skeemi_nimi;