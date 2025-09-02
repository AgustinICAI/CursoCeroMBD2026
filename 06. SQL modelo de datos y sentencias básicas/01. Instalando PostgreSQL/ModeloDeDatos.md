# Diccionario de Datos – Base de Datos NBA

## 🏀 Fichero: `Games.csv`

| Campo            | Traducción           | Explicación                                                                 |
|------------------|----------------------|-----------------------------------------------------------------------------|
| gameId           | ID del partido       | Identificador único del partido.                                            |
| gameDate         | Fecha del partido    | Fecha en la que se jugó el partido.                                         |
| hometeamCity     | Ciudad local         | Ciudad del equipo que jugó como local.                                      |
| hometeamName     | Nombre equipo local  | Nombre del equipo local.                                                    |
| hometeamId       | ID equipo local      | Identificador único del equipo local.                                       |
| awayteamCity     | Ciudad visitante     | Ciudad del equipo visitante.                                                |
| awayteamName     | Nombre equipo visitante | Nombre del equipo visitante.                                             |
| awayteamId       | ID equipo visitante  | Identificador único del equipo visitante.                                   |
| homeScore        | Puntos local         | Puntuación del equipo local.                                                |
| awayScore        | Puntos visitante     | Puntuación del equipo visitante.                                            |
| winner           | Ganador              | Nombre del equipo que ganó el partido.                                      |
| gameType         | Tipo de partido      | Tipo de encuentro (ej. Regular Season, Playoffs).                           |
| attendance       | Asistencia           | Número de asistentes al partido.                                            |
| arenaId          | ID pabellón          | Identificador único del pabellón donde se jugó.                             |
| gameLabel        | Etiqueta partido     | Descripción corta del partido.                                              |
| gameSubLabel     | Sub-etiqueta partido | Detalle adicional sobre el partido.                                         |
| seriesGameNumber | Número de serie      | Número de partido dentro de una serie (ej. en Playoffs).                    |

---

## 📅 Fichero: `LeagueSchedule24_25.csv`

| Campo            | Traducción               | Explicación                                                                 |
|------------------|--------------------------|-----------------------------------------------------------------------------|
| gameId           | ID del partido           | Identificador único del partido.                                            |
| gameDateTimeEst  | Fecha/hora EST           | Fecha y hora del partido (zona horaria Este).                               |
| gameDay          | Día                      | Día de la semana en que se juega el partido.                                |
| arenaCity        | Ciudad del pabellón      | Ciudad donde se ubica el pabellón.                                          |
| arenaState       | Estado del pabellón      | Estado (región) donde está el pabellón.                                     |
| arenaName        | Nombre del pabellón      | Nombre del pabellón.                                                        |
| gameLabel        | Etiqueta partido         | Descripción corta del partido.                                              |
| gameSubLabel     | Sub-etiqueta partido     | Detalle adicional del partido.                                              |
| gameSubtype      | Subtipo de partido       | Clasificación adicional (ej. amistoso, regular, especial).                   |
| gameSequence     | Secuencia                | Orden o número de partido en el calendario.                                 |
| seriesGameNumber | Número de serie          | Número de partido dentro de una serie.                                      |
| seriesText       | Texto serie              | Descripción de la serie (ej. "Finals Game 2").                              |
| weekNumber       | Número de semana         | Semana de la temporada.                                                     |
| hometeamId       | ID equipo local          | Identificador del equipo local.                                             |
| awayteamId       | ID equipo visitante      | Identificador del equipo visitante.                                         |

---

## 👤 Fichero: `Players.csv`

| Campo        | Traducción           | Explicación                                                                 |
|--------------|----------------------|-----------------------------------------------------------------------------|
| personId     | ID jugador           | Identificador único del jugador.                                            |
| firstName    | Nombre               | Nombre del jugador.                                                         |
| lastName     | Apellido             | Apellido del jugador.                                                       |
| birthdate    | Fecha de nacimiento  | Fecha de nacimiento del jugador.                                            |
| lastAttended | Última universidad   | Última institución o universidad a la que asistió.                          |
| country      | País                 | País de origen del jugador.                                                 |
| height       | Altura               | Altura del jugador (en pulgadas o cm).                                      |
| bodyWeight   | Peso                 | Peso del jugador (en libras o kg).                                          |
| guard        | Posición escolta     | Indica si juega en posición de escolta (booleano).                          |
| forward      | Posición alero       | Indica si juega en posición de alero (booleano).                            |
| center       | Posición pívot       | Indica si juega en posición de pívot (booleano).                            |
| draftYear    | Año draft            | Año en que fue seleccionado en el draft.                                    |
| draftRound   | Ronda draft          | Ronda en la que fue seleccionado.                                           |
| draftNumber  | Número draft         | Posición exacta en la que fue seleccionado en el draft.                     |

---

## 📊 Fichero: `PlayerStatistics.csv`

| Campo                  | Traducción                  | Explicación                                                                 |
|-------------------------|-----------------------------|-----------------------------------------------------------------------------|
| firstName              | Nombre                     | Nombre del jugador.                                                         |
| lastName               | Apellido                   | Apellido del jugador.                                                       |
| personId               | ID jugador                 | Identificador único del jugador.                                            |
| gameId                 | ID partido                 | Identificador del partido.                                                  |
| gameDate               | Fecha partido              | Fecha en que se jugó el partido.                                            |
| playerteamCity         | Ciudad equipo jugador      | Ciudad del equipo del jugador.                                              |
| playerteamName         | Nombre equipo jugador      | Nombre del equipo del jugador.                                              |
| opponentteamCity       | Ciudad equipo rival        | Ciudad del equipo oponente.                                                 |
| opponentteamName       | Nombre equipo rival        | Nombre del equipo oponente.                                                 |
| gameType               | Tipo de partido            | Regular season, playoffs, etc.                                              |
| gameLabel              | Etiqueta partido           | Nombre corto del partido.                                                   |
| gameSubLabel           | Sub-etiqueta partido       | Detalle adicional del partido.                                              |
| seriesGameNumber       | Número de serie            | Número de partido dentro de una serie.                                      |
| win                    | Victoria                   | Indica si el jugador ganó el partido (booleano).                            |
| home                   | Local                      | Indica si el jugador jugó como local (booleano).                            |
| numMinutes             | Minutos jugados            | Total de minutos jugados.                                                   |
| points                 | Puntos                     | Puntos anotados.                                                            |
| assists                | Asistencias                | Total de asistencias.                                                       |
| blocks                 | Tapones                    | Total de tapones realizados.                                                |
| steals                 | Robos                      | Total de robos de balón.                                                    |
| fieldGoalsAttempted    | Tiros de campo intentados  | Número de intentos de tiro de campo.                                        |
| fieldGoalsMade         | Tiros de campo convertidos | Número de tiros de campo anotados.                                          |
| fieldGoalsPercentage   | % tiros de campo           | Porcentaje de acierto en tiros de campo.                                    |
| threePointersAttempted | Triples intentados         | Número de intentos de triple.                                               |
| threePointersMade      | Triples convertidos        | Número de triples anotados.                                                 |
| threePointersPercentage| % triples                  | Porcentaje de acierto en triples.                                           |
| freeThrowsAttempted    | Tiros libres intentados    | Número de intentos de tiro libre.                                           |
| freeThrowsMade         | Tiros libres convertidos   | Número de tiros libres anotados.                                            |
| freeThrowsPercentage   | % tiros libres             | Porcentaje de acierto en tiros libres.                                      |
| reboundsDefensive      | Rebotes defensivos         | Total de rebotes defensivos.                                                |
| reboundsOffensive      | Rebotes ofensivos          | Total de rebotes ofensivos.                                                 |
| reboundsTotal          | Rebotes totales            | Total de rebotes (defensivos + ofensivos).                                  |
| foulsPersonal          | Faltas personales          | Total de faltas cometidas.                                                  |
| turnovers              | Pérdidas                   | Total de pérdidas de balón.                                                 |
| plusMinusPoints        | +/-                        | Diferencia de puntos del equipo mientras estaba en pista.                    |

---

## 🏟️ Fichero: `TeamHistories.csv`

| Campo          | Traducción         | Explicación                                                                 |
|----------------|--------------------|-----------------------------------------------------------------------------|
| teamId         | ID equipo          | Identificador único del equipo.                                             |
| teamCity       | Ciudad equipo      | Ciudad donde está ubicado el equipo.                                        |
| teamName       | Nombre equipo      | Nombre del equipo.                                                          |
| teamAbbrev     | Abreviatura equipo | Abreviatura oficial del equipo (ej. LAL para Lakers).                       |
| seasonFounded  | Temporada fundado  | Año/temporada de fundación del equipo.                                      |
| seasonActiveTill | Temporada activo | Última temporada en la que el equipo estuvo activo.                         |
| league         | Liga               | Liga a la que pertenece (ej. NBA).                                          |

---

## 📈 Fichero: `TeamStatistics.csv`

| Campo                | Traducción                  | Explicación                                                                 |
|-----------------------|-----------------------------|-----------------------------------------------------------------------------|
| gameId               | ID partido                 | Identificador único del partido.                                            |
| gameDate             | Fecha partido              | Fecha en que se jugó el partido.                                            |
| teamCity             | Ciudad equipo              | Ciudad del equipo.                                                          |
| teamName             | Nombre equipo              | Nombre del equipo.                                                          |
| teamId               | ID equipo                  | Identificador único del equipo.                                             |
| opponentTeamCity     | Ciudad equipo rival        | Ciudad del equipo contrario.                                                |
| opponentTeamName     | Nombre equipo rival        | Nombre del equipo contrario.                                                |
| opponentTeamId       | ID equipo rival            | Identificador único del equipo rival.                                       |
| home                 | Local                      | Indica si jugó en casa (booleano).                                          |
| win                  | Victoria                   | Indica si el equipo ganó el partido.                                        |
| teamScore            | Puntos equipo              | Puntos anotados por el equipo.                                              |
| opponentScore        | Puntos rival               | Puntos anotados por el rival.                                               |
| assists              | Asistencias                | Total de asistencias del equipo.                                            |
| blocks               | Tapones                    | Total de tapones.                                                           |
| steals               | Robos                      | Total de robos de balón.                                                    |
| fieldGoalsAttempted  | Tiros de campo intentados  | Número de intentos de tiro de campo.                                        |
| fieldGoalsMade       | Tiros de campo convertidos | Número de tiros de campo anotados.                                          |
| fieldGoalsPercentage | % tiros de campo           | Porcentaje de acierto en tiros de campo.                                    |
| threePointersAttempted | Triples intentados       | Número de intentos de triple.                                               |
| threePointersMade    | Triples convertidos        | Número de triples anotados.                                                 |
| threePointersPercentage | % triples               | Porcentaje de acierto en triples.                                           |
| freeThrowsAttempted  | Tiros libres intentados    | Intentos de tiro libre.                                                     |
| freeThrowsMade       | Tiros libres convertidos   | Tiros libres anotados.                                                      |
| freeThrowsPercentage | % tiros libres             | Porcentaje de acierto en tiros libres.                                      |
| reboundsDefensive    | Rebotes defensivos         | Total de rebotes defensivos.                                                |
| reboundsOffensive    | Rebotes ofensivos          | Total de rebotes ofensivos.                                                 |
| reboundsTotal        | Rebotes totales            | Total de rebotes (def + off).                                               |
| foulsPersonal        | Faltas personales          | Total de faltas cometidas.                                                  |
| turnovers            | Pérdidas                   | Pérdidas de balón.                                                          |
| plusMinusPoints      | +/- equipo                 | Diferencia de puntos mientras jugaba el equipo.                             |
| numMinutes           | Minutos totales            | Minutos totales del partido.                                                |
| q1Points             | Puntos 1º cuarto           | Puntos anotados en el primer cuarto.                                        |
| q2Points             | Puntos 2º cuarto           | Puntos anotados en el segundo cuarto.                                       |
| q3Points             | Puntos 3º cuarto           | Puntos anotados en el tercer cuarto.                                        |
| q4Points             | Puntos 4º cuarto           | Puntos anotados en el cuarto cuarto.                                        |
| benchPoints          | Puntos banquillo           | Puntos anotados por los suplentes.                                          |
| biggestLead          | Mayor ventaja              | Máxima diferencia de puntos conseguida.                                     |
| biggestScoringRun    | Mayor parcial              | Parcial más largo de puntos consecutivos.                                   |
| leadChanges          | Cambios de liderazgo       | Número de veces que cambió el equipo en ventaja.                            |
| pointsFastBreak      | Puntos contraataque        | Puntos en transiciones rápidas.                                             |
| pointsFromTurnovers  | Puntos tras pérdidas       | Puntos generados a partir de pérdidas del rival.                            |
| pointsInThePaint     | Puntos en la pintura       | Puntos conseguidos dentro de la zona.                                       |
| pointsSecondChance   | Puntos segunda oportunidad | Puntos tras rebotes ofensivos.                                              |
| timesTied            | Empates                    | Número de veces que estuvieron empatados.                                   |
| timeoutsRemaining    | Tiempos muertos restantes  | Tiempos muertos disponibles al final.                                       |
| seasonWins           | Victorias temporada        | Total de victorias acumuladas en la temporada.                              |
| seasonLosses         | Derrotas temporada         | Total de derrotas acumuladas en la temporada.                               |
| coachId              | ID entrenador              | Identificador único del entrenador.                                         |
