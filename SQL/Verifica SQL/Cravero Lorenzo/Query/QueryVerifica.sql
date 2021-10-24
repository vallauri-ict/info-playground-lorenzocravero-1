/* il titolo dei film con lo stesso regista di casablanca */
select f.Titolo
from Film f
where f.regista in (select f.regista from Film f where f.Titolo = 'Casablanca')

/* il titolo dei film in cui recita Mastroianni o Loren */
select distinct f.Titolo
from Film f, Attori a, Recita r
where (a.Nome = 'Mastroianni' and a.CodAttore = r.CodAttore and r.CodFilm = f.CodFilm) or (a.Nome = 'Loren' and a.CodAttore = r.CodAttore and r.CodFilm = f.CodFilm)

/* titolo e genere dei film proiettati il girono di natale 2004 */
select f.Titolo, f.Genere
from Film f, Proiezioni p
where p.DataProiezione = '2004-12-25' and p.CodFilm = f.CodFilm

/* il titolo ed il regista dei film in cui recitano meno di 6 attori */
--select *, COUNT(*) as nAttori
--from Film f, Recita r, Attori a
--having COUNT < 6

/* i titoli dei film che non sono mai stati proiettati a pisa */
select f.Titolo
from Film f, Proiezioni p, Sale s
where s.Citta <> 'Pisa' and s.CodSala = p.CodSala and p.CodFilm = f.CodFilm

/* i nomi degli attori italiani che non hanno mai recitato in film di fellini */
select a.Nome
 from Attori a, Recita r, Film f
 where f.Regista <> 'Fellini' and f.CodFilm = r.CodFilm and r.CodAttore = a.CodAttore and a.Nazionalita = 'Ita'