# Cláusula GROUP BY
- Permite formar grupos de filas según un criterio, para luego poder aplicar las funciones colectivas.
- Es una cláusula opcional de la SELECT para agrupar filas se escribe detrás de la cláusula WHERE.
- Esta cláusula agrupa las filas de la tabla por grupos con igual valor en las columnas del GROUP BY
- Los valores nulos se incluyen en un grupo.
- Una vez formado los grupos se evalúa la SELECT. Cada grupo dará como resultado una fila resultante.
- Los atributos que se evalúan en la SELECT podrán ser, aquellos que participan en la agrupación dentro de la cláusula GROUP BY y si no son de agrupamiento, solo podrán figurar como argumento de funciones colectivas.

## Ejemplo 
Promedio de altura y peso de los jugadores por posición
```sql
SELECT 
    CASE 
        WHEN guard = true THEN 'Guard'
        WHEN forward = true THEN 'Forward'
        WHEN center = true THEN 'Center'
    END AS position,
    AVG(height) AS avg_height,
    AVG(bodyWeight) AS avg_weight
FROM players
GROUP BY position
ORDER BY position;
```

Promedio de puntos y asistencias por jugador en player_statistics
```sql
SELECT playerId, AVG(points) AS avg_points, AVG(assists) AS avg_assists
FROM player_statistics
GROUP BY playerId
ORDER BY playerId;
```


# Cláusula HAVING
- Es una cláusula opcional de la SELECT asociada a GROUP BY.
- Permite descartar grupos de filas que no cumplan una condición.
- La separación en grupos se hace mediante la cláusula GROUP BY, sino existe esta cláusula, se forma un único
grupo con todas las filas.
- Las condiciones del HAVING pueden ser predicados simples o compuestos.
– Los atributos que “participen” deberan ser todos o alguno de los que participen en el agrupamiento.
– Si las atributos no son de agrupamiento, solo podrán figurar como argumento de funciones colectivas.

Existe agrupamiento cuando se hace uso de la cláusula GROUP BY, o bien se utilizan funciones colectivas, o bien
se dan ambos casos.
- El resultado de ejecución de la una SELECT con las siguientes clausulas, sería:
1. Ejecuta clausula FROM.
2. Ejecuta clausula WHERE.
3. Ejecuta clausula GROUP BY.
4. Ejecuta clausula HAVING.
5. Ejecuta clausula SELECT.
6. Ejecuta clausula ORDER BY.

## Ejemplo: Obtener los jugadores que promedian más de 20 puntos por partido.

```sql
SELECT playerId, AVG(points) AS avg_points
FROM player_statistics
GROUP BY playerId
HAVING AVG(points) > 20
ORDER BY avg_points DESC;
```
