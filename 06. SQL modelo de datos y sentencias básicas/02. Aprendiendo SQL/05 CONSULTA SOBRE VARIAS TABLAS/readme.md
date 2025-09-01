# Consulta sobre varias tablas

Es posible manejar varias tablas en una sentencia Select. Básicamente se puede manejar de dos formas:
- Mediante producto cartesiano: Bastaría con poner los nombres de las tablas en la clausula FROM.
- Mediante Selects Subordinadas: Haciendo referencia a campos de otras tablas en Select subordinadas a la principal.

## Calificación de nombres
- Los nombres de columna dentro de una tabla son diferentes, cuando operamos sobre el campo de una tabla basta con designarla.
- Por el contrario al intervenir varias tablas puede ocurrir que existan columnas con el mismo nombre.
- Para diferenciarlas hay que indicar a que tabla pertenece dicho atributo o columna referida. Se califican los nombres.

Supongamos que queremos comparar los puntos del jugador con el promedio de puntos del equipo en team_statistics. Aquí sí necesitamos calificar nombres porque points aparece en ambas tablas:
```sql
SELECT ps.firstName, ps.lastName, ps.points AS player_points, ts.points AS team_points
FROM player_statistics ps
JOIN team_statistics ts 
  ON ps.playerteamName = ts.teamName
  AND ps.gameId = ts.gameId;
``` 

ps.points → puntos del jugador
ts.points → puntos totales del equipo
Sin calificar, points sería ambiguo.


## Sentencias subordinadas
Son sentencias subordinadas en las que se especifica algún atributo de alguna tabla mencionada en la cláusula FROM de la sentencia antecedente.

- Dentro de una sentencia SELECT se pueden describir otras. (sentencias subordinadas).
-  Se pueden especificar en las cláusulas WHERE y HAVING como parte de los predicados:
    - Predicados Básicos. (comparación)
    - Predicados Cuantificados. (ANY, SOME, ALL)
    - Predicados IN.
    - Predicados EXISTS.

- Se llama sentencia externa, a la que no esta subordinada a ninguna. O también sentencia de primer nivel.


## Producto Cartesiano
En la cláusula FROM se especifica las lista de tablas separadas por coma.
- La siguiente cláusula (normalmente WHERE) se aplicará a una tabla que resulta de todas las combinaciones posibles entre las filas de las distintas tablas y las columnas serán la suma de ellas.

## Ejemplo: Jugadores y estadísticas de equipo (producto cartesiano)

Descripción: Combinar todos los jugadores con todas las estadísticas de un partido (sin condicionar por equipo ni partido).
```sql
SELECT p.firstName, p.lastName, ts.teamName, ts.points
FROM players p, team_statistics ts;
```

Cada jugador se combina con cada registro de estadísticas de equipo.
Esto genera muchas filas y puede servir para explicar por qué es importante siempre usar condiciones de join.

## Ejemplo: jugadores con más triples que su equipo en un partido 
```sql
SELECT ps.firstName, ps.lastName, ps.gameId, ps.threePointersMade AS player_triples, ts.threePointersMade AS team_triples
FROM player_statistics ps, team_statistics ts
WHERE ps.playerteamName = ts.teamName
  AND ps.gameId = ts.gameId
  AND ps.threePointersMade > ts.threePointersMade
ORDER BY ps.threePointersMade DESC
LIMIT 10;
```

# Ejercicios para realizar en clase:

1️⃣ Jugador con mayor número de puntos en un partido

Conceptos: filtrado, ordenamiento (ORDER BY)

2️⃣ Jugador con más partidos jugados (nombre y puntos totales)

Conceptos: COUNT, SUM, GROUP BY, ORDER BY

3️⃣ Jugador que anotó más de 50 puntos en un partido

Conceptos: filtrado condicional (WHERE), ordenamiento

4️⃣ Jugador con más triples dobles

Conceptos: filtrado compuesto (AND), agregación (COUNT), GROUP BY, ORDER BY

5️⃣ Jugador con más partidos en su año de draft, mostrando puntos totales y número de partidos

Conceptos: filtrado (WHERE), agrupación (GROUP BY), agregación (SUM, COUNT), ordenamiento

6️⃣ Jugador con mayor porcentaje de triples en partidos con más de 5 intentos

Conceptos: filtrado condicional (WHERE), cálculo de porcentaje

7️⃣ Jugador con más minutos que el promedio de su equipo en un partido

Conceptos: producto cartesiano, filtrado en WHERE, comparación de valores

8️⃣ Jugador que anotó más del 50% de los puntos de su equipo en un partido

Conceptos: producto cartesiano, filtrado condicional, comparación de valores

9️⃣ Jugador con más rebotes ofensivos que su equipo promedio por partido

Conceptos: producto cartesiano, filtrado condicional, comparación de valores

🔟 Jugador cuyo promedio de puntos por partido es mayor que el promedio de su equipo en la misma temporada

Conceptos: producto cartesiano, agregación (AVG), filtrado (HAVING)

1️⃣1️⃣ Jugador con mayor cantidad de rebotes ofensivos en una temporada

Conceptos: agrupación (GROUP BY), agregación (SUM), ordenamiento

1️⃣2️⃣ Jugador cuyo plus-minus promedio en playoffs sea positivo y mayor que 10

Conceptos: filtrado (WHERE), agregación (AVG), HAVING

1️⃣3️⃣ Jugador que ha jugado en más de 3 equipos diferentes a lo largo de su carrera

Conceptos: COUNT(DISTINCT), agrupación (GROUP BY), filtrado (HAVING)

1️⃣4️⃣ Partidos donde un jugador anotó más del 30% de los puntos de su equipo en una temporada

Conceptos: producto cartesiano, agregación (SUM), filtrado (HAVING), comparación de valores

1️⃣5️⃣ Jugador con mayor número de minutos jugados en su año de draft, junto con total de puntos ese año

Conceptos: filtrado por año (WHERE), agrupación (GROUP BY), agregación (SUM), ordenamiento