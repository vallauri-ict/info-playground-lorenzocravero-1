/* targa e marca delle auto di cilindrata superiore a 2000cc e di potenza superiore a 120cv */
select a.Targa, a.Marca
from Automobili a
where a.Cilindrata > 2000 and a.Potenza > 120

/* nome del prorietario e targa delle auto di cilindrata superiore o con potenza maggiore di 120cv */
select p.Nome, a.Targa
from Automobili a, Proprietari p
where (a.Cilindrata > 2000 or a.Potenza> 120) and a.CodF = p.CodF

/* nome del prorietario e targa delle auto di cilindrata superiore o con potenza maggiore di 120cv assicurate presso SARA */
select p.Nome, a.Targa
from Automobili a, Proprietari p, Assicurazioni ass
where (a.Cilindrata > 2000 or a.Potenza> 120) and a.CodF = p.CodF and a.CodAss = ass.CodAss and ass.Nome = 'SARA'

/* targa e nome del proprietario della macchina assicurata presso SARA */
select distinct au.Targa, p.Nome
from Automobili au, Autocoinvolte ac, Assicurazioni ass, Sinistri s, Proprietari p
where ass.Nome = 'SARA' and ass.CodAss = au.CodAss and au.CodF = p.CodF

/* targa e nome del proprietario della macchina assicurata presso SARA e coinvolti in un sinistro il 20/01/2002 */
select distinct au.Targa, p.Nome
from Automobili au, Autocoinvolte ac, Assicurazioni ass, Sinistri s, Proprietari p
where ass.Nome = 'SARA' and ass.CodAss = au.CodAss and au.CodF = p.CodF and s.CodS = ac.CodS and ac.Targa = au.Targa and s.Giorno = '2002-01-20'

/* cod e nome di chi possiede piu di un auto */
select p.CodF, p.Nome
from Automobili a, Proprietari p
where a.CodF = p.CodF
group by p.CodF, p.Nome
having COUNT(*) > 1

/* codice dei sinistri in cui non sono state coinvolte auto di cilindrata inferiore a 2000 */
select ac.CodS
from Automobili au, Autocoinvolte ac
where ac.Targa = au.Targa and au.Cilindrata >= 2000