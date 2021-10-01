/* nome dei musei che conservano solo opere di tiziano */
SELECT m.NomeM
FROM Musei m, Opere o, Artisti a
WHERE m.Citta = 'Londra'
AND a.NomeA = 'Tiziano'
AND m.NomeM = o.NomeM
AND a.NomeA = o.NomeA

/* per ogni artista il nome e le sue opere alla galleria degli uffizi */
SELECT a.NomeA, o.Titolo
FROM Musei m, Artisti a, Opere o
WHERE m.NomeM = 'Uffizi'
AND a.NomeA = o.NomeA
AND o.NomeM = m.NomeM

/* Per ciascun museo di Londra il numero di opere di artisti italiani ivi conservate*/
SELECT m.NomeMuseo, count(*) as NumeroOpere
FROM Musei m, Artisti a, Opere o
WHERE a.NomeA = o.NomeA
AND m.NomeMuseo = o.NomeMuseo 
AND a.Nazionalita = 'ITA'
AND m.citta = 'Londra'
GROUP BY m.NomeMuseo

/* Il nome dei musei di Londra che non hanno opere di Tiziano */
SELECT m.NomeMuseo
FROM Musei m
WHERE m.Citta = 'Londra'
AND NOT EXISTS (SELECT * FROM Opere o WHERE O.NomeA ='Tiziano' AND o.NomeMuseo = m.NomeMuseo)

/* Il nome dei musei di Londra che hanno solo opere di Tiziano */
SELECT m.NomeMuseo
FROM Musei m
WHERE m.Citta = 'Londra'
AND EXISTS (SELECT * FROM Opere o WHERE O.NomeA ='Tiziano' AND o.NomeMuseo = m.NomeMuseo)

/* Per ogni artista, il suo nome e il numero di opere presenti alla Galleria degli Uffizi */
SELECT o.NomeA, count(*) as NumeroOpere
FROM Opere o, Artisti a
WHERE o.NomeA = a.NomeA AND o.NomeMuseo = 'Galleria degli Uffizi'
GROUP BY a.NomeA

/* I musei che conservano almeno 20 opere di artisti italiani */
SELECT DISTINCT o.NomeMuseo
FROM Opere o, Artisti a
WHERE o.NomeA = a.NomeA
AND a.Nazionalita = 'ITA' 
HAVING COUNT(*)>19

/* Titolo dell'opera e nome dell'artista per ogni opera di un artista italiano senza personaggio */
SELECT a.NomeA, o.Titolo
FROM Artisti a, Opere o, Personaggi p
WHERE a.Nazionalita='IT'
AND a.NomeA=o.NomeA
AND NOT EXISTS(SELECT * FROM Personaggi p,Opere o WHERE p.Codice=o.Codice)

/* *Il nome dei musei di londra che non hanno opere di artisti italiani, eccetto Tiziano */
SELECT m.NomeM
FROM Musei m
WHERE  m.Citta='Londra'
AND NOT EXISTS(SELECT * FROM Opere o,Artisti a WHERE a.Nazionalita='IT' OR o.NomeA<>'Tiziano' AND o.NomeM=m.NomeM)

/* Per ogni museo, il numero di opere divise per nazionalità dell'artista*/
SELECT o.NomeMuseo, count(*) as NumeroOpere
FROM Opere o, Artisti a
WHERE o.Nome = a.NomeA
GROUP BY a.Nazionalita