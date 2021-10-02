/* il nome dei musei che non conservano opere di tiziano */
SELECT *
FROM Musei m
WHERE m.Citta = 'Londra'
AND 'Tiziano' NOT IN (SELECT o.NomeA
					  FROM Opere o 
					  WHERE o.NomeM = m.NomeM)

/* il nome dei musei che conservano solo opere di tiziano */
SELECT *
FROM Musei m
WHERE m.Citta = 'Londra'
AND NOT EXISTS ( SELECT * 
				FROM Opere o
				WHERE o.NomeA <> 'Tiziano'
				AND o.NomeM = m.NomeM)

/* per ciascun artista il nome dell'artista e il nome delle sue opere conservate agli uffizi */
SELECT o.NomeA, COUNT(*) as nOpere
FROM Opere o
WHERE o.NomeM = 'Uffizi'
GROUP BY o.NomeA

/* titolo dell'opere e nome artista delle opere italiane senza personaggio */
SELECT o.NomeA, o.Titolo
FROM Opere o
WHERE NOT EXISTS(SELECT *
				FROM Artisti a, Personaggi p
				WHERE a.Nazionalita = 'Ita' AND o.Codice NOT IN(p.Codice))


/* 14- Il nome dei musei di Londra che non conservano opere di artisti italiani, eccettuato Tiziano */
SELECT o.Titolo, o.NomeA, o.NomeM
FROM Opere o, Musei m
WHERE o.NomeM=m.NomeM
AND m.Citta='Londra'
AND NOT EXISTS(SELECT *
			FROM Artisti a
			WHERE a.NomeA=o.NomeA
			AND a.NomeA <>'Tiziano' 
			AND a.Nazionalita='Ita')