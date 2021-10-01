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

/* i musei che conservano almeno 20 opere italiane */
SELECT m.NomeM
FROM Musei m
WHERE 5 < (SELECT COUNT(*)
FROM Artisti a, Opere m
WHERE a.Nazionalita = 'Ita'
AND m.NomeA = a.NomeA)

/* per tutte le opere che non hanno personaggi il titolo dell'opera ed il nome dei personaggi */
SELECT DISTINCT o.Titolo, a.NomeA
FROM Opere o, Artisti a, Personaggi p
WHERE o.Codice NOT IN (3,4,5,2)

/* 