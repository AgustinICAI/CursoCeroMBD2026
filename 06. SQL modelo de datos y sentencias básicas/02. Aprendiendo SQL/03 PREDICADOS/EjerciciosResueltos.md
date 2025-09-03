/*NUM JUGADORES QUE NO SON DE EEUU O NO SE SABE*/
select count(*)
from PLAYERS
where country != 'USA' or country is null

/*NUM JUGADORES DISTINTOS QUE NO SON DE EEUU O NO SE SABE*/
select count( distinct firstname || lastname)
from PLAYERS
where country != 'USA' or country is null
/*Filtrar jugadores que comiencen con “A” y ordenar descendente, mostrando solo nombres distintos.*/
select distinct firstname
from players
where firstname like 'A%'
order by firstname desc
/*Seleccionar la posición de los jugadores draftados después de 2010*/
select firstname, lastname, guard, forward, center
from players
where draftyear > 2010
/*Seleccionar la posición de los jugadores draftados después de 2010 en un único campo con un CASE*/
SELECT 
    firstname,
    lastname,
    CASE
        WHEN guard = true THEN 'Guard'
        WHEN forward = true THEN 'Forward'
        WHEN center = true THEN 'Center'
        ELSE 'Unknown'
    END AS position
FROM players
WHERE draftyear > 2010;


/*Obtener el número de jugadores que son de Europa*/
SELECT *
FROM players
WHERE country IN ('Italy', 'Czech Republic', 'Sweden', 'United Kingdom', 'Montenegro', 'Ireland', 'Germany', 'Macedonia', 'Finland', 'Ukraine', 'Latvia', 'Slovenia', 'Greece', 'France', 'Estonia', 'Israel', 'Denmark', 'Bosnia and Herzegovina', 'Turkey', 'Switzerland', 'Hungary', 'Russia', 'Norway', 'Scotland', 'Netherlands', 'Romania', 'Serbia', 'Lithuania', 'Bulgaria', 'Spain', 'Croatia', 'Georgia', 'Belgium', 'Poland');


/*Obtener el número de jugadores que comparten país con "Pau Gasol"*/
select *
from players
where country = (select country 
				 from players
				 where firstname = 'Pau' and lastname = 'Gasol')
	and personId != (select personId 
				 from players
				 where firstname = 'Pau' and lastname = 'Gasol')

				 
/* Obtener jugadores que no son centers y que miden más de la altura promedio.*/
select *
from players
where center = false 
and height >  (select avg(height )
				from players)
				

			 