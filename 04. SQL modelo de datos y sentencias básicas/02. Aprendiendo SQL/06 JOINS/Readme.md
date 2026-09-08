# JOINs en PostgreSQL

 Un `JOIN` permite combinar información de dos o más tablas utilizando una relación entre ellas.

 Por ejemplo, tenemos estas dos tablas:

 ### `customers`

 | id | name |
| --- | --- |
| 1 | Ana |
| 2 | Luis |
| 3 | Marta |

 ### `orders`

 | id | customer\_id | amount |
| --- | --- | --- |
| 101 | 1 | 50 |
| 102 | 1 | 30 |
| 103 | 2 | 80 |
| 104 | 4 | 20 |

 La columna `orders.customer_id` hace referencia al cliente al que pertenece cada pedido.

---

 ## INNER JOIN

 Devuelve únicamente las filas que tienen correspondencia en **ambas tablas**.

```
SELECT
    customers.name,
    orders.amount
FROM customers
INNER JOIN orders
    ON customers.id = orders.customer_id;
```

 Resultado:

 | name | amount |
| --- | --- |
| Ana | 50 |
| Ana | 30 |
| Luis | 80 |

 El pedido `104` no aparece porque `customer_id = 4` no existe en `customers`.

 De forma visual:

```
customers       orders

   A   ─────────── A
   B   ─────────── B
   C
```

 **INNER JOIN = solo las coincidencias.**

---

 ## LEFT JOIN

 Devuelve **todas las filas de la tabla izquierda** y las coincidencias de la tabla derecha.

```
SELECT
    customers.name,
    orders.amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;
```

 Resultado:

 | name | amount |
| --- | --- |
| Ana | 50 |
| Ana | 30 |
| Luis | 80 |
| Marta | NULL |

 Marta no tiene pedidos, pero aparece igualmente porque `customers` es la tabla de la izquierda.

```
customers       orders

   A   ─────────── A
   B   ─────────── B
   C
```

 **LEFT JOIN = todo lo de la izquierda + coincidencias de la derecha.**

 Una aplicación muy habitual es buscar registros que **no tienen correspondencia**:

```
SELECT customers.name
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
WHERE orders.id IS NULL;
```

 Resultado:

```
Marta
```

---

 ## RIGHT JOIN

 Es el equivalente inverso al `LEFT JOIN`.

 Devuelve **todas las filas de la tabla derecha** y las coincidencias de la tabla izquierda.

```
SELECT
    customers.name,
    orders.amount
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
```

 Resultado:

 | name | amount |
| --- | --- |
| Ana | 50 |
| Ana | 30 |
| Luis | 80 |
| NULL | 20 |

 El pedido `104` aparece aunque no exista un cliente con `id = 4`.

 **RIGHT JOIN = todo lo de la derecha + coincidencias de la izquierda.**

 > En la práctica, `LEFT JOIN` suele ser más habitual. Muchas consultas que podrían escribirse con `RIGHT JOIN` pueden resultar más fáciles de leer intercambiando el orden de las tablas y utilizando `LEFT JOIN`.

---

 ## FULL OUTER JOIN

 Devuelve **todas las filas de ambas tablas**, haciendo coincidir las que tengan relación.

```
SELECT
    customers.name,
    orders.amount
FROM customers
FULL OUTER JOIN orders
    ON customers.id = orders.customer_id;
```

 Resultado:

 | name | amount |
| --- | --- |
| Ana | 50 |
| Ana | 30 |
| Luis | 80 |
| Marta | NULL |
| NULL | 20 |

 Tenemos:

 - Las coincidencias: Ana y Luis.
- Un registro que solo existe en `customers`: Marta.
- Un registro que solo existe en `orders`: el pedido `104`.

 Visualmente:

```
        ┌───────────────┐
        │     FULL      │
        │     JOIN      │
        └───────────────┘

customers ────────┬──────── orders
                   │
        coincidencias

   + registros     + registros
   sin match       sin match
```

 **FULL OUTER JOIN = todo de ambas tablas.**

---

 # Resumen

 | JOIN | ¿Qué devuelve? |
| --- | --- |
| `INNER JOIN` | Solo las coincidencias de ambas tablas |
| `LEFT JOIN` | Todo de la izquierda + coincidencias de la derecha |
| `RIGHT JOIN` | Todo de la derecha + coincidencias de la izquierda |
| `FULL OUTER JOIN` | Todo de ambas tablas |

 Una forma sencilla de recordarlos:

```
INNER       → coincidencias

LEFT        → todo ← izquierda
              + coincidencias

RIGHT       → derecha → todo
              + coincidencias

FULL        → TODO + TODO

```

 ## La parte importante: `ON`

 En la mayoría de `JOINs`, la condición `ON` indica **cómo se relacionan las filas**:

```
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
```

 Aquí estamos diciendo:

 > "Relaciona un cliente con un pedido cuando el `id` del cliente sea igual al `customer_id` del pedido."

 También es habitual utilizar aliases para hacer las consultas más legibles:

```
SELECT
    c.name,
    o.amount
FROM customers AS c
JOIN orders AS o
    ON c.id = o.customer_id;
```

 ## Regla mental rápida

 Cuando tengas dudas sobre qué `JOIN` utilizar, piensa primero:

 **¿Quiero quedarme solo con las coincidencias?**

 → `INNER JOIN`

 **¿Quiero conservar todos los registros de mi tabla principal aunque no tengan coincidencia?**

 → `LEFT JOIN`

 **¿Quiero conservar absolutamente todo de las dos tablas?**

 → `FULL OUTER JOIN`
