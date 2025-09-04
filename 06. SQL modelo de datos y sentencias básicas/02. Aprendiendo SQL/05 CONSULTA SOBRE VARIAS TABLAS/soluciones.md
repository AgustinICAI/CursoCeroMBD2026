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