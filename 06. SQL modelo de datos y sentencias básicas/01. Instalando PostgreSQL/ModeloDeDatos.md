# Diccionario de datos NBA

## Tabla: `players` (Jugadores)

| Campo         | Tipo   | Traducción        | Explicación |
|---------------|--------|-------------------|-------------|
| personId      | INT    | ID Jugador        | Identificador único del jugador |
| firstName     | TEXT   | Nombre            | Nombre del jugador |
| lastName      | TEXT   | Apellido          | Apellido del jugador |
| birthdate     | DATE   | Fecha de nacimiento | Fecha de nacimiento del jugador |
| lastAttended  | TEXT   | Última institución | Universidad/Instituto donde jugó antes de la NBA |
| country       | TEXT   | País              | País de origen |
| height        | FLOAT  | Altura (pulgadas) | Altura en pulgadas |
| bodyWeight    | FLOAT  | Peso (libras)     | Peso en libras |
| guard         | BOOLEAN| ¿Es base?         | Indica si juega de guardia/base |
| forward       | BOOLEAN| ¿Es alero?        | Indica si juega de alero |
| center        | BOOLEAN| ¿Es pívot?        | Indica si juega de pívot |
| draftYear     | FLOAT  | Año Draft         | Año en que fue elegido en el draft |
| draftRound    | FLOAT  | Ronda Draft       | Ronda del draft en la que fue seleccionado |
| draftNumber   | FLOAT  | Número Draft      | Número global en el draft |

---

## Tabla: `team_histories` (Historial de equipos)

| Campo           | Tipo   | Traducción          | Explicación |
|-----------------|--------|---------------------|-------------|
| teamId          | INT    | ID Equipo           | Identificador del equipo |
| teamCity        | TEXT   | Ciudad              | Ciudad del equipo |
| teamName        | TEXT   | Nombre equipo       | Nombre completo del equipo |
| teamAbbrev      | TEXT   | Abreviatura equipo  | Siglas oficiales del equipo |
| seasonFounded   | FLOAT  | Año fundación       | Año en que fue fundado |
| seasonActiveTill| FLOAT  | Año último activo   | Última temporada registrada |
| league          | TEXT   | Liga                | Liga en la que participó (ej. NBA, ABA) |

---

## Tabla: `games` (Partidos)

| Campo           | Tipo      | Traducción          | Explicación |
|-----------------|-----------|---------------------|-------------|
| gameId          | TEXT      | ID Partido          | Identificador del partido |
| gameDate        | TIMESTAMP | Fecha partido       | Fecha y hora del partido |
| hometeamCity    | TEXT      | Ciudad local        | Ciudad del equipo local |
| hometeamName    | TEXT      | Nombre local        | Nombre del equipo local |
| hometeamId      | INT       | ID equipo local     | Identificador del equipo local |
| awayteamCity    | TEXT      | Ciudad visitante    | Ciudad del equipo visitante |
| awayteamName    | TEXT      | Nombre visitante    | Nombre del equipo visitante |
| awayteamId      | INT       | ID equipo visitante | Identificador del equipo visitante |
| homeScore       | FLOAT     | Puntos local        | Puntuación del equipo local |
| awayScore       | FLOAT     | Puntos visitante    | Puntuación del equipo visitante |
| winner          | INT       | ID ganador          | ID del equipo ganador |
| gameType        | TEXT      | Tipo partido        | Tipo de encuentro (ej. Regular, Playoffs) |
| attendance      | FLOAT     | Asistencia          | Número de espectadores |
| arenaId         | TEXT      | ID pabellón         | Identificador del estadio |
| gameLabel       | TEXT      | Etiqueta partido    | Texto descriptivo del partido |
| gameSubLabel    | TEXT      | Sub-etiqueta        | Información adicional |
| seriesGameNumber| FLOAT     | Nº partido serie    | Número de partido dentro de una serie (Playoffs) |

---

## Tabla: `team_statistics` (Estadísticas de equipos por partido)

| Campo                | Tipo      | Traducción              | Explicación |
|----------------------|-----------|-------------------------|-------------|
| gameId               | TEXT      | ID Partido              | Identificador del partido |
| gameDate             | TIMESTAMP | Fecha partido           | Fecha y hora |
| teamCity             | TEXT      | Ciudad equipo           | Ciudad del equipo |
| teamName             | TEXT      | Nombre equipo           | Nombre completo del equipo |
| teamId               | INT       | ID Equipo               | Identificador |
| opponentTeamCity     | TEXT      | Ciudad rival            | Ciudad del equipo rival |
| opponentTeamName     | TEXT      | Nombre rival            | Nombre completo del equipo rival |
| opponentTeamId       | INT       | ID Equipo rival         | Identificador del rival |
| home                 | BOOLEAN   | ¿Local?                 | Si jugaba como local |
| win                  | BOOLEAN   | ¿Victoria?              | Si ganó el partido |
| teamScore            | FLOAT     | Puntos equipo           | Puntos anotados por el equipo |
| opponentScore        | FLOAT     | Puntos rival            | Puntos recibidos |
| assists              | FLOAT     | Asistencias             | Nº asistencias del equipo |
| blocks               | FLOAT     | Tapones                 | Nº tapones realizados |
| steals               | FLOAT     | Robos                   | Nº robos realizados |
| fieldGoalsAttempted  | FLOAT     | Tiros intentados        | Nº intentos de tiro de campo |
| fieldGoalsMade       | FLOAT     | Tiros encestados        | Nº tiros de campo convertidos |
| fieldGoalsPercentage | FLOAT     | % acierto tiros campo   | Porcentaje de acierto en tiros de campo |
| threePointersAttempted| FLOAT    | Triples intentados      | Nº triples lanzados |
| threePointersMade    | FLOAT     | Triples anotados        | Nº triples convertidos |
| threePointersPercentage| FLOAT   | % acierto triples       | Porcentaje de acierto en triples |
| freeThrowsAttempted  | FLOAT     | TL intentados           | Nº de tiros libres lanzados |
| freeThrowsMade       | FLOAT     | TL anotados             | Nº de tiros libres convertidos |
| freeThrowsPercentage | FLOAT     | % acierto TL            | Porcentaje de acierto en tiros libres |
| reboundsDefensive    | FLOAT     | Rebotes defensivos      | Total rebotes defensivos |
| reboundsOffensive    | FLOAT     | Rebotes ofensivos       | Total rebotes ofensivos |
| reboundsTotal        | FLOAT     | Rebotes totales         | Total rebotes capturados |
| foulsPersonal        | FLOAT     | Faltas personales       | Total de faltas cometidas |
| turnovers            | FLOAT     | Pérdidas                | Balones perdidos |
| plusMinusPoints      | FLOAT     | +/-                     | Diferencia de puntos con el jugador en pista |
| numMinutes           | FLOAT     | Minutos jugados         | Minutos jugados por el equipo |
| q1Points             | FLOAT     | Puntos Q1               | Puntos anotados en el primer cuarto |
| q2Points             | FLOAT     | Puntos Q2               | Puntos anotados en el segundo cuarto |
| q3Points             | FLOAT     | Puntos Q3               | Puntos anotados en el tercer cuarto |
| q4Points             | FLOAT     | Puntos Q4               | Puntos anotados en el último cuarto |
| benchPoints          | FLOAT     | Puntos banquillo        | Puntos anotados por los suplentes |
| biggestLead          | FLOAT     | Mayor ventaja           | Máxima diferencia lograda en el partido |
| biggestScoringRun    | FLOAT     | Racha máxima            | Racha de puntos consecutivos |
| leadChanges          | FLOAT     | Cambios de liderato     | Nº veces que el liderato cambió |
| pointsFastBreak      | FLOAT     | Puntos contraataque     | Puntos logrados en transiciones rápidas |
| pointsFromTurnovers  | FLOAT     | Puntos por pérdidas     | Puntos tras robos y pérdidas del rival |
| pointsInThePaint     | FLOAT     | Puntos en la pintura    | Puntos anotados cerca del aro |
| pointsSecondChance   | FLOAT     | Puntos segunda oportunidad | Puntos tras rebote ofensivo |
| timesTied            | FLOAT     | Empates en el marcador  | Nº veces que hubo empate en el partido |
| timeoutsRemaining    | FLOAT     | Tiempos muertos restantes | Tiempos muertos que quedaban |
| seasonWins           | FLOAT     | Victorias temporada     | Nº victorias acumuladas esa temporada |
| seasonLosses         | FLOAT     | Derrotas temporada      | Nº derrotas acumuladas esa temporada |
| coachId              | INT       | ID Entrenador           | Identificador del entrenador |

---

## Tabla: `player_statistics` (Estadísticas de jugadores por partido)

| Campo                | Tipo      | Traducción              | Explicación |
|----------------------|-----------|-------------------------|-------------|
| firstName            | TEXT      | Nombre jugador          | Nombre |
| lastName             | TEXT      | Apellido jugador        | Apellido |
| personId             | INT       | ID Jugador              | Identificador del jugador |
| gameId               | TEXT      | ID Partido              | Identificador del partido |
| gameDate             | TIMESTAMP | Fecha partido           | Fecha y hora |
| playerteamCity       | TEXT      | Ciudad equipo           | Ciudad del equipo del jugador |
| playerteamName       | TEXT      | Nombre equipo           | Nombre completo del equipo del jugador |
| opponentteamCity     | TEXT      | Ciudad rival            | Ciudad del equipo contrario |
| opponentteamName     | TEXT      | Nombre rival            | Nombre completo del equipo rival |
| gameType             | TEXT      | Tipo partido            | Regular season, playoffs, etc. |
| gameLabel            | TEXT      | Etiqueta partido        | Texto descriptivo del partido |
| gameSubLabel         | TEXT      | Sub-etiqueta            | Detalles adicionales |
| seriesGameNumber     | FLOAT     | Nº partido serie        | Número de partido dentro de una serie |
| win                  | BOOLEAN   | ¿Victoria?              | Si el jugador ganó ese partido |
| home                 | BOOLEAN   | ¿Local?                 | Si jugó como local |
| numMinutes           | FLOAT     | Minutos jugados         | Minutos en pista |
| points               | FLOAT     | Puntos                  | Puntos anotados |
| assists              | FLOAT     | Asistencias             | Nº asistencias |
| blocks               | FLOAT     | Tapones                 | Nº tapones |
| steals               | FLOAT     | Robos                   | Nº robos |
| fieldGoalsAttempted  | FLOAT     | Tiros intentados        | Nº tiros de campo intentados |
| fieldGoalsMade       | FLOAT     | Tiros encestados        | Nº tiros convertidos |
| fieldGoalsPercentage | FLOAT     | % acierto tiros campo   | Porcentaje de acierto en tiros de campo |
| threePointersAttempted| FLOAT    | Triples intentados      | Nº triples lanzados |
| threePointersMade    | FLOAT     | Triples encestados      | Nº triples convertidos |
| threePointersPercentage| FLOAT   | % acierto triples       | Porcentaje de acierto en triples |
| freeThrowsAttempted  | FLOAT     | TL intentados           | Nº tiros libres lanzados |
| freeThrowsMade       | FLOAT     | TL anotados             | Nº tiros libres convertidos |
| freeThrowsPercentage | FLOAT     | % acierto TL            | Porcentaje de acierto en tiros libres |
| reboundsDefensive    | FLOAT     | Rebotes defensivos      | Rebotes defensivos |
| reboundsOffensive    | FLOAT     | Rebotes ofensivos       | Rebotes ofensivos |
| reboundsTotal        | FLOAT     | Rebotes totales         | Total de rebotes capturados |
| foulsPersonal        | FLOAT     | Faltas personales       | Faltas cometidas |
| turnovers            | FLOAT     | Pérdidas                | Pérdidas de balón |
| plusMinusPoints      | FLOAT     | +/-                     | Diferencia de puntos mientras estuvo en pista |
