Como apoyo la explicación de los distintos conceptos de SQL, vamos a instalar en nuestro ordenador local una instancia de base de datos. Esta instancia de base de datos correrá con la tecnología "PostgreSQL". 



## Instalación

[Postgre download](https://www.postgresql.org/download/)

- Será necesario para trabajar instalar Postgre y PGAdmin (Postgre Admin) que se puede descargar e instalar del anterior enlace.
- Para lanzar queries usaremos otro cliente de la comunidad que se llama DBeaver. [Dbeaver download](https://dbeaver.io/download/)

- En windows (seguramente en MAC también aunque no lo he probado) la primera vez es necesario realizar el siguiente cambio para conectar:
  ```
  File: C:\Program Files\PostgreSQL\16\data\pg_hba.conf

  Cambiar linea:
  host    all             all             127.0.0.1/32            scram-sha-256

  cambiar scram-sha-256 por trust
  
  host    all             all             127.0.0.1/32            trust

  
  ``` 


## Importar base de de datos

Para el curso vamos a usar un Dataset publicado en Kaggle.com

[Kaggle historical-nba-data-and-player-box-scores](https://www.kaggle.com/datasets/eoinamoore/historical-nba-data-and-player-box-scores)

Aunque este dataset está preparado para sqlserver, dejo un script para hacer la importación de estos datasets en un postgreSQL.

[Script importación](./import_script.sql)
1. Descargar el dataset y descomprimirlo.

2. Para lanzar la importación será necesario lanzar el siguiente comando desde un terminal (powershell, cmd (windows) o shell (linux,mac)):

  ```
  psql.exe -U postgres -p 5432 -f "C:\Users\tu\ruta\archive\import_script.sql"
  
  ```

3. Problamente el anterior comando fallará, es necesario previamente lanzar el comando "psql" desde la ruta donde esté instalado o añadiendo su path en las variables de entorno del sistema (más info, preguntad a chatgpt).
