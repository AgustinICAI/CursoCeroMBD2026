# Tipos de Predicados
- Un predicado expresa una condición entre valores, según sean estos, el resultado puede ser Verdadero, Falso o Desconocido.
- Las condiciones de las SELECT se definen como predicados.
- Se especifican en la clausula WHERE y otras…
- Se clasifican en Predicados Simples y Compuestos.

## Predicados básicos
- Son Predicados Simples o de comparación.
- Expresan condiciones de comparación entre dos valores.
- Utilizando los signos: <, >, = y sus combinaciones.
- Si alguno o ambos comparandos son NULL el predicado toma valor “Desconocido”.
- El segundo comparando puede ser otra expresión o el resultado de otra sentencia SELECT (Select Subordinada).


## Predicado NULL
- Permite saber si el valor de un atributo o expresión, en una fila determinada, es o no NULO.
- Tomará valor Verdadero o Falso, pero nunca Desconocido.

### Ejemplo
Ejemplos para ver la "calidad" de los datos con los que trabajamos

```sql
SELECT *
FROM player_statistics
WHERE points IS NULL;
```
O, si quieres ver jugadores que no tienen altura registrada en players:

```sql
SELECT *
FROM players
WHERE height IS NULL;
```

## Predicado LIKE
Sirve para buscar combinaciones de caracteres que cumplan ciertas condiciones.
- Se usan caracteres comodines. Estos comodines son:
    - '%': contiene cualquier carácter alfanumérico
    - '_': contiene 1 caracter


## Ejemplos para hacer en clase

1) Filtrar los jugadores cuya columna country sea “USA”.
2) Filtrar jugadores que comiencen con “A” y ordenar descendente, mostrando solo nombres distintos.
3) Sacar los partidos de baja puntuación, aquellos de menos de 100 puntos
4) Seleccionar la posición de los jugadores draftados después de 2010

## Más ejemplos 
5) Listar los jugadores más altos de más de 2.10 metros.
6) Obtener jugadores que no tienen peso registrado.
7) Listar los jugadores que han jugado como guard y forward al mismo tiempo.
8) Obtener los partidos jugados después del 1 de enero de 2020.
9) Listar jugadores con más de 20 puntos en un partido.
10) Obtener los equipos que anotaron más de 120 puntos en algún partido.
11) Listar jugadores que participaron en más de 50 partidos.
12) Mostrar los nombres completos de jugadores cuyo nombre contiene “John”.
13) Obtener jugadores cuyo draftYear sea nulo.
14) Listar partidos con victoria del equipo local.
15) Obtener los jugadores que nacieron en un país distinto a Estados Unidos.
16) Listar los jugadores draftados antes de 1990.
17) Obtener partidos donde el equipo visitante anotó más de 100 puntos.
18) Listar jugadores que tengan más de 2 posiciones activas (por ejemplo, guard, forward, center).
19) Obtener jugadores que no tienen registrado ningún partido en player_statistics.
20) Listar los equipos que han jugado más de 80 partidos en total.
21) Obtener los jugadores que fueron draftados en la primera ronda.
22) Listar jugadores que miden menos de 1.80 metros.
23) Obtener jugadores que han jugado en más de un equipo según player_statistics.
24) Listar partidos donde la diferencia de puntos entre equipos fue menor a 5.

## Predicado IN
El predicado es cierto cuando la expresión o expresiones están dentro de una lista de valores o constantes.
obtener jugadores que son de un conjunto de países específicos, por ejemplo “USA” y “Canada”.

```sql
SELECT *
FROM players
WHERE country IN (
    SELECT country
    FROM players
    WHERE country LIKE 'USA%' OR country LIKE 'Canada%'
);
```
Como aquí estamos usando la misma tabla, también se podría simplificar:

```sql
SELECT *
FROM players
WHERE country IN ('USA', 'Canada');
```


## Ejemplos para clase

1) Seleccionar jugadores cuyo país comience por “C”
2) Obtener el número de jugadores que son de Europa
3) Obtener el número de jugadores que comparten país con "Pau Gasol"

## Predicados compuestos
- Son combinaciones de otro predicados, simples o compuestos.
- Usando los operadores AND, OR, NOT, para combinar los predicados.

## Ejemplos para clase

1) Jugadores que son guards y miden más de 2 m / 78 pulgadas
2) Obtener jugadores que no son centers y que miden más de la altura promedio.
