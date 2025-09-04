## Jugador con más minutos que el promedio de minutos de su equipo en un partido


```sql

select ps.firstname, ps.lastname, gt_minutes.playerteamname,
       ps.numminutes as minutos_medios_jugador, 
       gt_minutes.numminutes as minutos_medios_equipo
from player_statistics ps,
	 (select gameid, playerteamname, avg(numminutes) as numminutes
 	  from player_statistics ps2
 	  group by gameid, playerteamname) gt_minutes
where 
	ps.gameid = gt_minutes.gameid  and
	ps.playerteamname = gt_minutes.playerteamname and
	ps.numminutes > gt_minutes.numminutes 
```

## Jugador que anotó más del 50% de los puntos de su equipo en un partido

```sql
select ps.points , ts.teamscore, ps.* 
from player_statistics ps , team_statistics ts 
where ps.gameid = ts.gameid and 
      ps.playerteamname = ts.teamname and 
      ps.points > ts.teamscore * 0.5
order by ps.points / ts.teamscore desc
	
```

## Jugador que ha jugado en más de 3 equipos diferentes a lo largo de su carrera

```sql
select numTeams, p.*
from players p, (
	select personid, count(distinct playerteamname) as numTeams
	from player_statistics ps
	group by personid 
	having count(distinct playerteamname) > 3) as different_teams
where p.personid = different_teams.personid
order by numTeams desc
```

Jugador que ha jugado en más de 3 equipos diferentes a lo largo de su carrera y muestralos por pantalla
