/* query per esercitarsi */

/* titolo e codice delle opere di tiziano al national gallery */
select o.Codice, o.Titolo
from Opere o
where o.NomeA = 'Tiziano' and o.NomeM='National Gallery'

/* nome artista e titolo opere che si trovano o agli uffizi o alla national gallery */
select o.NomeA, o.Titolo
from Opere o 
where o.NomeM = 'Uffizi' or o.NomeM = 'National gallery'

/* nome artista e titolo opere conservate nei musei di firenze */
select o.NomeA, o.Titolo
from Opere o, Musei m
where m.Citta = 'Firenze' and m.NomeM = o.NomeM

/* città in cui sono conservate le opere di picasso */
select m.Citta
from Opere o, Musei m
where o.NomeA = 'Picasso' and o.NomeM = m.NomeM

/* codice e titolo delle opere di tiziano conservate nei musei di londra */
select o.Codice, o.Titolo
from Opere o, Musei m
where o.NomeA = 'Tiziano' and o.NomeM = m.NomeM and m.Citta = 'Londra'

/* il nome degli artisti spagnoli e il titolo delle loro opere conservate a firenze */
select o.NomeA, o.Titolo
from Opere o, Musei m, Artisti a
where m.Citta = 'Firenze' and m.NomeM = o.NomeM and o.NomeA = a.NomeA and a.Nazionalita = 'Spa'

/* codice e titolo delle opere di artisti italiani conservate a londra e in cui c'è la madonna */
select o.Codice, o.Titolo
from Opere o, Musei m, Artisti a, Personaggi p
where p.Personaggio = 'Madonna' and p.Codice = o.Codice and o.NomeM = m.NomeM and o.NomeA = a.NomeA and m.Citta = 'Londra' and exists (select * from Artisti a where a.Nazionalita = 'Ita')