# Ejercicios SQL

## Jugadores españoles con más de 10 partidos

```sql
SELECT firstname, lastname, personid, AVG(points), COUNT(*), SUM(points)
FROM player_statistics
WHERE personid IN (
    SELECT personid
    FROM players
    WHERE country LIKE 'Spain'
)
GROUP BY personid, firstname, lastname
HAVING COUNT(*) > 10
ORDER BY COUNT(*) DESC;
```

## Ejercicio 27 — Jugadores con más de 100 partidos

```sql
SELECT firstname, lastname, COUNT(*)
FROM player_statistics
GROUP BY firstname, lastname
HAVING COUNT(*) > 100;
```

## Ejercicio 28 — Jugadores con más de 3 equipos

```sql
SELECT firstname, lastname, COUNT(DISTINCT playerteamid)
FROM player_statistics
GROUP BY firstname, lastname
HAVING COUNT(DISTINCT playerteamid) >= 10;
```

## Ejercicio 28 — Jugadores con más de 3 equipos

```sql
SELECT firstname, lastname, playerteamname, COUNT(*)
FROM player_statistics
WHERE personid IN (
    SELECT personid
    FROM player_statistics
    GROUP BY personid, firstname, lastname
    HAVING COUNT(DISTINCT playerteamid) >= 10
)
GROUP BY firstname, lastname, playerteamname
ORDER BY firstname, lastname;
```

## Ejercicio 29 — Equipos con más jugadores

```sql
SELECT playerteamname, COUNT(DISTINCT personid) AS cuenta
FROM player_statistics
WHERE playerteamname IS NOT NULL
GROUP BY playerteamname
HAVING COUNT(DISTINCT personid) > 100
ORDER BY cuenta DESC
LIMIT 5;
```

## Conteo de registros

```sql
SELECT COUNT(*)
FROM player_statistics ps, players p
WHERE ps.personid = p.personid;
```

```sql
SELECT COUNT(*)
FROM player_statistics ps;
```

## Jugador con mayor cantidad de rebotes ofensivos en una temporada

**Conceptos:** agrupación (`GROUP BY`), agregación (`SUM`), ordenamiento.

```sql
SELECT *
FROM
    (
        SELECT
            season,
            MAX(suma_rebotes) AS max_suma_rebotes
        FROM
            (
                SELECT
                    game_season.season,
                    ps.personid,
                    SUM(ps.reboundsoffensive) AS suma_rebotes
                FROM
                    player_statistics ps,
                    (
                        SELECT
                            gameid,
                            CASE
                                WHEN EXTRACT(MONTH FROM gamedate) >= 10
                                    THEN CONCAT(
                                        EXTRACT(YEAR FROM gamedate)::int,
                                        '-',
                                        RIGHT(
                                            (EXTRACT(YEAR FROM gamedate)::int + 1)::text,
                                            2
                                        )
                                    )
                                ELSE CONCAT(
                                    EXTRACT(YEAR FROM gamedate)::int - 1,
                                    '-',
                                    RIGHT(
                                        EXTRACT(YEAR FROM gamedate)::text,
                                        2
                                    )
                                )
                            END AS season
                        FROM games
                    ) game_season
                WHERE ps.gameid = game_season.gameid
                GROUP BY
                    game_season.season,
                    ps.personid
            ) season_person_sum
        GROUP BY season
    ) season_maxrebotes,
    (
        SELECT
            game_season.season,
            ps.personid,
            SUM(ps.reboundsoffensive) AS suma_rebotes
        FROM
            player_statistics ps,
            (
                SELECT
                    gameid,
                    CASE
                        WHEN EXTRACT(MONTH FROM gamedate) >= 10
                            THEN CONCAT(
                                EXTRACT(YEAR FROM gamedate)::int,
                                '-',
                                RIGHT(
                                    (EXTRACT(YEAR FROM gamedate)::int + 1)::text,
                                    2
                                )
                            )
                        ELSE CONCAT(
                            EXTRACT(YEAR FROM gamedate)::int - 1,
                            '-',
                            RIGHT(
                                EXTRACT(YEAR FROM gamedate)::text,
                                2
                            )
                        )
                    END AS season
                FROM games
            ) game_season
        WHERE ps.gameid = game_season.gameid
        GROUP BY
            game_season.season,
            ps.personid
    ) season_rebotes_player
WHERE
    season_maxrebotes.season = season_rebotes_player.season
    AND season_maxrebotes.max_suma_rebotes = season_rebotes_player.suma_rebotes
    AND season_maxrebotes.max_suma_rebotes != 0
ORDER BY season_rebotes_player.season;
```

## Ejercicio 35 — Jugador que anotó más del 50% de los puntos de su equipo

```sql
SELECT ts.teamname, ts.teamscore, ps.firstname, ps.lastname, ps.points
FROM team_statistics ts, player_statistics ps
WHERE ts.gameid = ps.gameid
    AND ps.points > ts.teamscore * 0.5
ORDER BY ts.gameid;
```

### Alternativa usando una subconsulta

```sql
SELECT
    ps.firstname,
    ps.lastname,
    ps.gameid,
    ps.points,
    game_team_points.puntos
FROM
    player_statistics ps,
    (
        SELECT
            gameid,
            playerteamname,
            SUM(points) AS puntos
        FROM player_statistics
        GROUP BY gameid, playerteamname
    ) game_team_points
WHERE
    ps.gameid = game_team_points.gameid
    AND ps.playerteamname = game_team_points.playerteamname
    AND ps.points > game_team_points.puntos * 0.5;
```
