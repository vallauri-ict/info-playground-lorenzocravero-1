/* query a caso */

/* 1- film di fellini */
SELECT titolo 
FROM Film 
WHERE Regista = 'Fellini'

/* 2- film fantascienza usa prodotti dopo il 2006 */
SELECT titolo
FROM Film
WHERE Nazionalita = 'usa' AND [Anno Produzione]>2006

/* 3- titolo e durata dei film italiani prodotti dopo il 2005 */
SELECT titolo, durata
FROM Film
WHERE Nazionalita = 'Ita' AND [Anno Produzione]>2005

/* tutti i film con regista quello di casablanca */
SELECT titolo
FROM Film f
WHERE f.Regista = (SELECT Regista FROM Film f1 WHERE f1.titolo = 'Casablanca')

/* il titolo ed il genere dei film proiettati nel 2020 */
SELECT f.Titolo, f.Genere
FROM Film f, Proiezioni p
WHERE f.CodFilm = p.CodFilm AND p.DataProiezione = 2020

/* tutti i film proiettati a pisa*/
SELECT f.Titolo
FROM Film f, Proiezioni p, Sale s
WHERE s.Citta = 'Pisa' AND s.CodSala = p.CodSala AND p.CodFilm = f.CodFilm

/* tutti i film di mastroiannni */
SELECT f.Titolo
FROM Film f, Recita r, Attori a
WHERE a.CodAttore = r.CodAttore AND r.CodFilm = f.CodFilm AND a.Nome = 'Mastroianni'

/* tutti i film di mastroianni e loren */
SELECT DISTINCT f.Titolo
FROM Film f, Recita r, Attori a, Recita r1, Attori a1
WHERE a1.Nome = 'Loren' AND a.CodAttore = r.CodAttore AND r.CodFilm = f1.CodFilm AND a1.Nome = 'Mastroianni' AND r1.CodAttore = a1.CodAttore AND r1.CodFilm = f.CodFilm