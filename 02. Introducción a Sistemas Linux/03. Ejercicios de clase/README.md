# Ejercicios Linux: Pipes, Tuberías y Redirecciones

## Ejercicio 1 – Contar líneas
Archivo `texto.txt`:
```
Hola mundo
Este es un archivo de prueba
Contiene varias líneas
Para practicar Linux
```
Cuenta el número de líneas y guarda el resultado en `lineas.txt`.

---
## Ejercicio 2 – Filtrar palabras
Archivo `texto.txt`:
```
Inicio del sistema
Error al cargar módulo
Usuario conectado
Error de permisos
Final del proceso
```
Muestra las líneas que contengan la palabra "Error".

---
## Ejercicio 3 – Contar ocurrencias
Archivo `texto.txt` (mismo que el anterior). Cuenta cuántas veces aparece "Error".

---
## Ejercicio 4 – Ordenar y eliminar duplicados
Archivo `nombres.txt`:
```
Ana
Pedro
Luis
Ana
Maria
Pedro
Luis
```
Muestra la lista de nombres ordenada alfabéticamente sin duplicados.

---
## Ejercicio 5 – Primeras líneas
Archivo `log.txt`:
```
[INFO] Inicio del sistema
[WARN] Memoria baja
[INFO] Usuario conectado
[ERROR] Falla en módulo
[INFO] Proceso completado
[INFO] Cierre del sistema
```
Muestra las primeras 5 líneas.

---
## Ejercicio 6 – Últimas líneas
Archivo `log.txt` (mismo que el anterior). Muestra las últimas 3 líneas y guárdalas en `ultimos.txt`.

---
## Ejercicio 7 – Combinando comandos
Archivo `documento.txt`:
```
Línea corta
Esta línea es un poco más larga
Línea mediana
La línea más larga de todas en este archivo
Pequeña
```
Muestra las 2 líneas más largas.

---
## Ejercicio 8 – Extraer columnas
Archivo CSV `datos.csv`:
```
Nombre,Edad,País
Ana,23,España
Luis,30,México
Maria,28,Chile
Pedro,35,Argentina
```
Muestra solo la segunda columna (Edad) y guarda en `columna2.txt`.

---
## Ejercicio 9 – Contar palabras únicas
Archivo `palabras.txt`:
```
manzana
pera
naranja
manzana
pera
banana
```
Cuenta cuántas palabras diferentes contiene.

---
## Ejercicio 10 – Pipeline completo
Archivo `animales.txt`:
```
2025-09-01,gato
2025-09-01,perro
2025-09-02,gato
2025-09-02,conejo
2025-09-03,perro
2025-09-03,perro
2025-09-03,gato
```
Genera `recuento.txt` con el número de veces que aparece cada animal ordenado alfabéticamente.

