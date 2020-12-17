CREATE OR REPLACE VIEW v_auto_koondaruanne AS
SELECT asl.auto_seisundi_liigi_kood,
       upper(asl.nimetus::text)          AS auto_seisundi_liigi_nimetus,
       count(a.auto_seisundi_liigi_kood) AS arv
FROM auto a
         RIGHT JOIN auto_seisundi_liik asl ON a.auto_seisundi_liigi_kood = asl.auto_seisundi_liigi_kood
GROUP BY asl.auto_seisundi_liigi_kood, (upper(asl.nimetus::text))
ORDER BY (count(a.auto_seisundi_liigi_kood)) DESC, (upper(asl.nimetus::text));

COMMENT ON VIEW V_AUTO_KOONDARUANNE IS 'Juhata näeb iga Auto seisundi kohta selle koodi, nimetust ja selles seisundis olevate Autode arvu. Kui seisundiga pole seotud ühtegi Autod, siis on see arv 0.';