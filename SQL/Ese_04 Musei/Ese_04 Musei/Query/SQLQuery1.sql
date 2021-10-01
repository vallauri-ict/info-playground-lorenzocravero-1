
/* per ciascun museo di londra il numero di opere di artisti italiani */
SELECT m.NomeM,COUNT (*) as numeroOpere
FROM Artisti a, Musei m,Opere o 
WHERE m.Citta='Parigi' AND 
a.Nazionalita='Ita' AND 
a.NomeA=o.NomeA AND m.NomeM=o.NomeM 
GROUP BY m.NomeM

/* il nome dei musei di londra che non hanno opere di tiziano */
SELECT m.NomeM
FROM Musei m, Opere o, Artisti a
WHERE m.NomeM = 'Londra'
AND 

/* stessa query in maniera diversa */
SELECT m.NomeM
FROM Musei m
WHERE m.Citta = 'Londra'
AND NOT EXISTS (SELECT *
				FROM Opere o
				WHERE o.NomeA = 'Tiziano'
				AND o.NomeM = m.NomeM)