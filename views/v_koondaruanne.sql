CREATE OR REPLACE VIEW v_koondaruanne AS

SELECT asl.auto_seisundi_liigi_kood,
       upper(asl.nimetus)                as status,
       count(a.auto_seisundi_liigi_kood) as arv
from auto a
         right join auto_seisundi_liik asl on a.auto_seisundi_liigi_kood = asl.auto_seisundi_liigi_kood
group by asl.auto_seisundi_liigi_kood, upper(asl.nimetus)
order by count(a.auto_seisundi_liigi_kood) desc, upper(asl.nimetus);

COMMENT ON VIEW v_koondaruanne IS 'Juhata näeb iga Auto seisundi kohta selle koodi, nimetust ja selles seisundis olevate Autode arvu. Kui seisundiga pole seotud ühtegi Autod, siis on see arv 0.';
