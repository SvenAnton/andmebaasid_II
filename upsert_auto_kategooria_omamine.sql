-- Primary key on (auto_kood, auto_kategooria_kood).
-- Seega peab iga rida olema unikaalne ning kui soovitakse lisade
-- rida, mis on juba olemas, tuleb tegevus vahele jätta, sest
-- rida on juba olemas ning midagi pole vaja uuendada ega muuta.
insert into auto_kategooria_omamine(auto_kood, auto_kategooria_kood)
SELECT * from f_test_genereeri_auto_kategooria_omamine(5000)
ON CONFLICT ON CONSTRAINT pk_auto_kategooria_omamine DO NOTHING
;