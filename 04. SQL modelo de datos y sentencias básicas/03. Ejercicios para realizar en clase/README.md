# Ejercicios de SQL — Dataset NBA

Ejercicios prácticos para aprender SQL utilizando el dataset histórico de la NBA.

Los ejercicios están ordenados **de menor a mayor dificultad** y siguen el mismo orden de conceptos utilizado en el curso:

1. Introducción
2. SELECT y expresiones
3. Predicados
4. Consultas con agregación
5. Consultas sobre varias tablas
6. JOINS

> **Recomendación:** intenta resolver cada ejercicio por tu cuenta antes de consultar una solución. No es necesario utilizar conceptos que todavía no se hayan explicado en clase.

---

# 01. INTRODUCCIÓN

En esta primera sección el objetivo es familiarizarse con la base de datos y con las tablas que contiene.

---

## Ejercicio 1 — Explorar la base de datos

Realiza consultas sobre las distintas tablas de la base de datos para observar:

- Qué tablas existen.
- Qué columnas tiene cada tabla.
- Qué información contiene cada una.
- Algunos ejemplos de registros.

Utiliza `SELECT` y `LIMIT`.

**Objetivo:** familiarizarse con la estructura de la base de datos y entender qué información contiene cada tabla.

---

## Ejercicio 2 — Conocer a los jugadores

Obtén algunos registros de la tabla `players` mostrando únicamente:

- `personId`
- `firstName`
- `lastName`
- `country`
- `fromYear`
- `toYear`

**Objetivo:** practicar la selección de columnas concretas.

---

## Ejercicio 3 — Buscar a Kobe Bryant

Obtén toda la información disponible sobre Kobe Bryant en la tabla `players`.

**Objetivo:** realizar una primera consulta utilizando un criterio de búsqueda.

---

## Ejercicio 4 — El identificador de Kobe

Obtén únicamente el `personId` de Kobe Bryant.

A continuación, utiliza ese identificador para obtener todas sus estadísticas disponibles en `player_statistics`.

**Objetivo:** entender el concepto de identificador y cómo utilizarlo para localizar los registros relacionados con un jugador.

```sql
select count(*) as num_partidos
from player_statistics
where personid = (select personid
				  FROM players
				  where firstname = 'Kobe' and lastname = 'Bryant'
				  ) 
```


---

# 02. SELECT Y EXPRESIONES

En esta sección comenzamos a realizar cálculos y transformaciones utilizando los datos.

---

## Ejercicio 5 — Nombre completo

Obtén el nombre y apellido de todos los jugadores en una única columna llamada `nombre_completo`.

Por ejemplo:

```text
LeBron James
Michael Jordan
Kobe Bryant
```

**Objetivo:** practicar expresiones con texto y alias de columnas.

---

## Ejercicio 6 — Altura en centímetros

En la tabla `players`, `heightInches` representa la altura en pulgadas.

Obtén:

- Nombre.
- Apellido.
- Altura en pulgadas.
- Altura en centímetros.

Utiliza la conversión:

> centímetros = pulgadas × 2.54

**Objetivo:** practicar operaciones matemáticas dentro de un `SELECT`.

---

## Ejercicio 7 — Puntos por partido

Obtén para cada jugador:

- Nombre.
- Apellido.
- Número de partidos jugados.
- Puntos totales.
- Puntos por partido.

Ordena de mayor a menor promedio de puntos por partido.

**Objetivo:** practicar expresiones calculadas, división y `ORDER BY`.

---

## Ejercicio 8 — Máxima anotación

Obtén los jugadores que consiguieron las mayores anotaciones en un único partido.

Muestra:

- Nombre.
- Apellido.
- Equipo.
- Puntos.
- Fecha del partido.

Ordena de mayor a menor puntuación y muestra los 10 primeros resultados.

**Objetivo:** combinar selección de columnas, expresiones, ordenación y límite de resultados.

---

## Ejercicio 9 — Porcentaje de puntos del equipo

Para cada registro de `player_statistics`, calcula qué porcentaje de los puntos de su equipo representan los puntos del jugador.

Utiliza:

> porcentaje = puntos del jugador / puntos del equipo × 100

En este ejercicio puedes utilizar la información de `team_statistics` cuando corresponda.

**Objetivo:** practicar expresiones matemáticas y porcentajes.

---

# 03. PREDICADOS

Ahora comenzamos a filtrar los registros utilizando `WHERE` y diferentes tipos de predicados.

---

## Ejercicio 10 — Jugadores españoles

Obtén todos los jugadores cuyo país sea España.

Muestra:

- Nombre.
- Apellido.
- País.
- Año de inicio en la NBA.

**Objetivo:** practicar `WHERE` y comparación de valores.

---

## Ejercicio 11 — Jugadores nacidos después de 1990

Obtén los jugadores cuya fecha de nacimiento sea posterior al 1 de enero de 1990.

Muestra:

- Nombre.
- Apellido.
- Fecha de nacimiento.

Ordena por fecha de nacimiento.

**Objetivo:** practicar comparaciones con fechas.

---

## Ejercicio 12 — Jugadores de más de 2 metros

Obtén los jugadores cuya altura sea superior a 2 metros.

Recuerda que `heightInches` está expresado en pulgadas.

**Objetivo:** combinar una expresión matemática con un predicado.

---

## Ejercicio 13 — Partidos de más de 120 puntos

Obtén los partidos en los que el equipo local haya conseguido más de 120 puntos.

Muestra:

- Fecha.
- Equipo local.
- Equipo visitante.
- Puntos locales.
- Puntos visitantes.

Ordena de mayor a menor puntuación local.

**Objetivo:** practicar `WHERE` y `ORDER BY`.

---

## Ejercicio 14 — Grandes anotaciones

Obtén todos los jugadores que hayan conseguido al menos 40 puntos en un partido.

Muestra:

- Jugador.
- Equipo.
- Puntos.
- Fecha.

Ordena de mayor a menor puntuación.

**Objetivo:** practicar condiciones numéricas y ordenación.

---

## Ejercicio 15 — Partidos completos

Obtén los jugadores que hayan conseguido simultáneamente:

- Al menos 30 puntos.
- Al menos 10 rebotes.
- Al menos 10 asistencias.

**Objetivo:** practicar `AND` y combinar varios predicados.

---

## Ejercicio 16 — Posiciones iniciales

Obtén los jugadores cuyo `startingPosition` sea:

- `G`
- `F`
- `C`

Utiliza `IN`.

**Objetivo:** practicar el predicado `IN`.

---

## Ejercicio 17 — Buscar jugadores por apellido

Obtén todos los jugadores cuyo apellido contenga la cadena `son`.

No debe importar si aparece en mayúsculas o minúsculas.

**Objetivo:** practicar `LIKE` y búsquedas parciales de texto.

---

## Ejercicio 18 — Datos desconocidos

Obtén los jugadores para los que no conocemos el país.

A continuación, obtén los jugadores para los que sí conocemos el país.

**Objetivo:** entender la diferencia entre comparar con un valor y comprobar `NULL` mediante `IS NULL`.

---

## Ejercicio 19 — Partidos de Playoffs

Obtén todos los registros de jugadores correspondientes a partidos de Playoffs.

Muestra:

- Jugador.
- Equipo.
- Puntos.
- Fecha.
- Tipo de partido.

**Objetivo:** practicar filtros sobre campos de texto.

---

# 04. CONSULTAS CON AGREGACIÓN

En esta sección comenzamos a trabajar con `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `DISTINCT` y `HAVING`.

---

## Ejercicio 20 — ¿Cuántos jugadores tenemos?

Obtén el número total de jugadores existentes en la tabla `players`.

**Objetivo:** introducir `COUNT()`.

---

## Ejercicio 21 — Jugadores por país

Obtén el número de jugadores de cada país.

Muestra:

- País.
- Número de jugadores.

Ordena de mayor a menor.

**Objetivo:** practicar `GROUP BY` y `COUNT()`.

---

## Ejercicio 22 — Países que más jugadores han aportado

Obtén los países que más jugadores han aportado a la NBA.

No tengas en cuenta Estados Unidos.

Muestra:

- País.
- Número de jugadores.

Ordena de forma descendente.

**Objetivo:** combinar `WHERE`, `GROUP BY`, `COUNT()` y `ORDER BY`.

---

## Ejercicio 23 — Partidos registrados por jugador

Obtén el número de partidos registrados para cada jugador.

Muestra:

- `personId`.
- Número de partidos.

Ordena de mayor a menor.

**Objetivo:** practicar agrupaciones y `COUNT()`.

---

## Ejercicio 24 — Jugador con más partidos

Obtén el jugador que aparece en más partidos.

Muestra:

- Nombre.
- Apellido.
- Número de partidos.

**Objetivo:** combinar `GROUP BY`, `COUNT()` y ordenación.

---

## Ejercicio 25 — Puntos totales por jugador

Obtén los puntos totales anotados por cada jugador a lo largo de los partidos registrados.

Muestra:

- Nombre.
- Apellido.
- Puntos totales.

Ordena de mayor a menor.

**Objetivo:** practicar `SUM()` y agrupaciones.

---

## Ejercicio 26 — Promedio de puntos

Obtén el promedio de puntos por partido de cada jugador.

Muestra:

- Nombre.
- Apellido.
- Promedio de puntos.

Ordena de mayor a menor.

**Objetivo:** practicar `AVG()` y `GROUP BY`.

---

## Ejercicio 27 — Jugadores con más de 100 partidos

Obtén los jugadores que hayan disputado más de 100 partidos.

Muestra:

- Nombre.
- Apellido.
- Número de partidos.

Ordena de mayor a menor.

**Objetivo:** introducir `HAVING` para filtrar resultados agrupados.

---

## Ejercicio 28 — Jugadores con más de 3 equipos

Obtén los jugadores que hayan jugado en más de 3 equipos diferentes a lo largo de su carrera.

Muestra:

- `personId`.
- Número de equipos diferentes.

**Pista:** utiliza `COUNT(DISTINCT ...)`.

**Objetivo:** practicar `DISTINCT`, `GROUP BY` y `HAVING`.

---

## Ejercicio 29 — Equipos con más jugadores

Obtén los equipos que han tenido más jugadores diferentes.

Muestra:

- Equipo.
- Número de jugadores diferentes.

**Objetivo:** combinar `COUNT(DISTINCT ...)`, `GROUP BY` y `ORDER BY`.

---

## Ejercicio 30 — Máxima anotación de cada jugador

Obtén la máxima cantidad de puntos que consiguió cada jugador en un único partido.

Muestra:

- `personId`.
- Nombre.
- Apellido.
- Máxima anotación.

Ordena de mayor a menor.

**Objetivo:** practicar `MAX()` y agrupaciones.

---

# 05. CONSULTAS SOBRE VARIAS TABLAS

En esta sección empezamos a combinar información procedente de diferentes tablas y a utilizar subconsultas.

---

## Ejercicio 31 — Jugadores y sus estadísticas

Obtén el nombre y apellido de un jugador a partir de la tabla `players` y sus estadísticas a partir de `player_statistics`.

Utiliza el `personId` para relacionar ambas tablas.

**Objetivo:** empezar a trabajar con información procedente de varias tablas.

---

## Ejercicio 32 — Datos de Kobe y sus partidos

A partir del `personId` de Kobe Bryant, obtén:

- Fecha del partido.
- Equipo.
- Rival.
- Puntos.
- Rebotes.
- Asistencias.

**Objetivo:** combinar información del jugador con sus estadísticas.

---

## Ejercicio 33 — Jugadores por encima de la media

Calcula el promedio general de puntos por partido.

Obtén después los jugadores cuyo promedio de puntos por partido sea superior a ese promedio general.

Muestra:

- Jugador.
- Promedio de puntos.

**Objetivo:** utilizar una subconsulta para comparar un resultado con una agregación.

---

## Ejercicio 34 — Jugadores que superan su mejor promedio

Obtén los jugadores cuyo promedio de puntos por partido sea superior al promedio de puntos de todos los jugadores.

Ordena de mayor a menor promedio.

**Objetivo:** practicar subconsultas y agregaciones combinadas.

---

## Ejercicio 35 — Jugador que anotó más del 50% de los puntos de su equipo

Obtén los jugadores que anotaron más del 50% de los puntos de su equipo en un partido.

Muestra:

- Jugador.
- Equipo.
- Puntos del jugador.
- Puntos del equipo.
- Porcentaje de los puntos del equipo anotados por el jugador.

Ordena de mayor a menor porcentaje.

**Objetivo:** relacionar estadísticas individuales y estadísticas de equipo.

---

## Ejercicio 36 — Jugador con más minutos que el promedio de su equipo

Para cada partido y equipo, calcula la media de minutos jugados por sus jugadores.

Obtén los jugadores cuyo número de minutos sea superior a la media de minutos de los jugadores de su equipo en ese partido.

Muestra:

- Jugador.
- Equipo.
- Minutos del jugador.
- Minutos medios del equipo.

**Objetivo:** practicar subconsultas con `GROUP BY` y comparar registros individuales con resultados agregados.

---

## Ejercicio 37 — Jugadores que han jugado en más de 3 equipos

Obtén los jugadores que hayan jugado en más de 3 equipos diferentes a lo largo de su carrera.

Muestra:

- Nombre.
- Apellido.
- Número de equipos diferentes.

**Objetivo:** combinar una subconsulta con la información de la tabla `players`.

---

## Ejercicio 38 — Mostrar los equipos por los que pasó cada jugador

A partir del ejercicio anterior, muestra para cada jugador:

- Nombre.
- Apellido.
- Equipo.
- Número de registros/partidos con ese equipo.

Solo deben aparecer jugadores que hayan jugado en más de 3 equipos diferentes.

**Objetivo:** combinar subconsultas, agrupaciones y varias tablas.

---

# 06. JOINS

En esta sección sustituimos las relaciones implícitas entre tablas por `JOIN` explícitos y aprendemos a combinar varias fuentes de información.

---

## Ejercicio 39 — Jugadores y estadísticas

Relaciona `players` y `player_statistics` mediante `personId`.

Muestra:

- Nombre.
- Apellido.
- País.
- Equipo.
- Puntos.
- Rebotes.
- Asistencias.

**Objetivo:** practicar el `INNER JOIN`.

---

## Ejercicio 40 — Jugadores y partidos

Relaciona `player_statistics` con `games`.

Muestra:

- Jugador.
- Fecha.
- Equipo local.
- Equipo visitante.
- Puntos.
- Resultado.

**Objetivo:** aprender a relacionar estadísticas de jugadores con información del partido mediante `gameId`.

---

## Ejercicio 41 — Estadísticas del jugador y de su equipo

Relaciona `player_statistics` con `team_statistics`.

Para cada jugador y partido muestra:

- Jugador.
- Equipo.
- Puntos del jugador.
- Puntos del equipo.
- Puntos del rival.
- Si el equipo ganó o perdió.

**Objetivo:** practicar `JOIN` utilizando más de una condición de relación.

---

## Ejercicio 42 — Jugador que anotó más del 50% del equipo

Repite el ejercicio 35 utilizando únicamente `JOIN` explícitos para relacionar las tablas.

Muestra:

- Jugador.
- Equipo.
- Puntos del jugador.
- Puntos del equipo.
- Porcentaje de los puntos del equipo.

**Objetivo:** resolver un problema real utilizando `JOIN` y expresiones calculadas.

---

## Ejercicio 43 — Mejor anotador de cada partido

Para cada partido, obtén el jugador que más puntos consiguió.

Muestra:

- Fecha.
- Equipo.
- Jugador.
- Puntos.

**Reto:** intenta resolverlo sin utilizar `LIMIT` para toda la consulta.

**Objetivo:** combinar `JOIN`, `GROUP BY`, subconsultas y funciones de agregación.

---

## Ejercicio 44 — Triple-dobles

Utilizando `player_statistics_extended`, obtén el jugador que ha conseguido más triples-dobles.

Muestra:

- Nombre.
- Apellido.
- Número de triples-dobles.

**Objetivo:** practicar agregaciones sobre una tabla de estadísticas extendidas.

---

## Ejercicio 45 — Equipos que han sufrido los triples-dobles

A partir del jugador con mayor número de triples-dobles, identifica contra qué equipos consiguió esos triples-dobles.

Muestra:

- Jugador.
- Equipo del jugador.
- Equipo rival.
- Número de triples-dobles contra ese equipo.

**Objetivo:** combinar subconsultas, `JOIN`, `GROUP BY` y `COUNT()`.

---

## Ejercicio 46 — Carrera completa de un jugador

Selecciona un jugador y construye una consulta que muestre un resumen de su carrera.

Debe incluir:

- Nombre.
- Apellido.
- País.
- Número de partidos.
- Puntos totales.
- Promedio de puntos.
- Máxima anotación.
- Número de equipos diferentes.
- Número de triples-dobles.

**Objetivo:** integrar `JOIN`, funciones de agregación y subconsultas en una única consulta.

---

# RETOS FINALES

Los siguientes ejercicios no introducen necesariamente conceptos nuevos, sino que obligan a combinar los conocimientos adquiridos.

---

## Reto 47 — El partido perfecto

Busca partidos en los que un jugador haya conseguido:

- Al menos 30 puntos.
- Al menos 10 rebotes.
- Al menos 10 asistencias.
- Al menos 2 robos.
- Al menos 2 tapones.

Muestra toda la información relevante.

**Objetivo:** combinar múltiples condiciones y diferentes estadísticas.

---

## Reto 48 — Dominio absoluto

Obtén los partidos en los que un jugador haya anotado más del 40% de los puntos de su equipo y además haya conseguido al menos 10 rebotes y 10 asistencias.

Ordena por porcentaje de puntos aportados.

**Objetivo:** combinar `JOIN`, predicados, expresiones y ordenación.

---

## Reto 49 — El mejor partido de la carrera

Selecciona un jugador y encuentra su mejor partido según la siguiente puntuación:

> puntos + rebotes + asistencias + robos + tapones

Muestra:

- Fecha.
- Equipo.
- Rival.
- Puntos.
- Rebotes.
- Asistencias.
- Robos.
- Tapones.
- Puntuación final.

**Objetivo:** combinar expresiones, ordenación, filtros y varias columnas estadísticas.

---

## Reto 50 — Análisis completo de un jugador

Selecciona cualquier jugador y responde mediante SQL a las siguientes preguntas:

1. ¿Cuántos partidos ha jugado?
2. ¿Cuántos puntos ha anotado?
3. ¿Cuál es su promedio de puntos?
4. ¿Cuál ha sido su máxima anotación?
5. ¿Cuántos equipos diferentes ha tenido?
6. ¿Cuál ha sido su equipo con más partidos?
7. ¿Cuántos triples-dobles ha conseguido?
8. ¿Contra qué equipo ha anotado más puntos?
9. ¿Cuál ha sido su mejor partido según la puntuación propuesta?
10. ¿Cuál ha sido su partido con más puntos?

**Objetivo:** integrar todos los conceptos aprendidos durante el curso y resolver un problema de análisis utilizando varias tablas.

---

# RESUMEN DE CONCEPTOS

| Bloque | Ejercicios | Conceptos |
|---|---:|---|
| 01. Introducción | 1–4 | Explorar tablas, `SELECT`, identificadores |
| 02. SELECT y expresiones | 5–9 | Expresiones, alias, cálculos, `ORDER BY`, `LIMIT` |
| 03. Predicados | 10–19 | `WHERE`, `AND`, `IN`, `LIKE`, `IS NULL`, fechas |
| 04. Agregación | 20–30 | `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`, `GROUP BY`, `HAVING`, `DISTINCT` |
| 05. Varias tablas | 31–38 | Subconsultas, agregaciones y relaciones |
| 06. JOINS | 39–46 | `INNER JOIN`, múltiples condiciones, varias tablas |
| Retos | 47–50 | Integración de conceptos |

---

## Progresión recomendada

La dificultad está pensada para crecer de forma gradual:

**1–4 →** aprender a consultar la base de datos  
**5–9 →** seleccionar y calcular información  
**10–19 →** aprender a filtrar  
**20–30 →** agrupar y obtener estadísticas  
**31–38 →** empezar a pensar en varias consultas y tablas  
**39–46 →** dominar `JOIN`  
**47–50 →** resolver problemas completos combinando conceptos
