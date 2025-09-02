-- Crear la base de datos
DROP DATABASE IF EXISTS nba_mbd;
CREATE DATABASE nba_mbd;
\c nba_mbd;

-- Tabla de jugadores
CREATE TABLE players (
    personId INT PRIMARY KEY,
    firstName TEXT,
    lastName TEXT,
    birthdate DATE,
    lastAttended TEXT,
    country TEXT,
    height FLOAT,         -- <- antes INT
    bodyWeight FLOAT,     -- <- antes INT
    guard BOOLEAN,
    forward BOOLEAN,
    center BOOLEAN,
    draftYear FLOAT,
    draftRound FLOAT,
    draftNumber FLOAT
);

-- Tabla de historial de equipos
CREATE TABLE team_histories (
    teamId INT,
    teamCity TEXT,
    teamName TEXT,
    teamAbbrev TEXT,
    seasonFounded FLOAT,
    seasonActiveTill FLOAT,
    league TEXT
    -- sin PK estricta porque hay duplicados
);

-- Tabla de juegos
CREATE TABLE games (
    gameId TEXT PRIMARY KEY,
    gameDate TIMESTAMP,
    hometeamCity TEXT,
    hometeamName TEXT,
    hometeamId INT,
    awayteamCity TEXT,
    awayteamName TEXT,
    awayteamId INT,
    homeScore FLOAT,
    awayScore FLOAT,
    winner INT,
    gameType TEXT,
    attendance FLOAT,      -- <- antes INT
    arenaId TEXT,
    gameLabel TEXT,
    gameSubLabel TEXT,
    seriesGameNumber FLOAT -- <- antes INT
);

-- Estadísticas de equipos por partido
CREATE TABLE team_statistics (
    gameId TEXT,
    gameDate TIMESTAMP,
    teamCity TEXT,
    teamName TEXT,
    teamId INT,
    opponentTeamCity TEXT,
    opponentTeamName TEXT,
    opponentTeamId INT,
    home BOOLEAN,
    win BOOLEAN,
    teamScore FLOAT,
    opponentScore FLOAT,
    assists FLOAT,         -- <- antes INT
    blocks FLOAT,
    steals FLOAT,
    fieldGoalsAttempted FLOAT,
    fieldGoalsMade FLOAT,
    fieldGoalsPercentage FLOAT,
    threePointersAttempted FLOAT,
    threePointersMade FLOAT,
    threePointersPercentage FLOAT,
    freeThrowsAttempted FLOAT,
    freeThrowsMade FLOAT,
    freeThrowsPercentage FLOAT,
    reboundsDefensive FLOAT,
    reboundsOffensive FLOAT,
    reboundsTotal FLOAT,
    foulsPersonal FLOAT,
    turnovers FLOAT,
    plusMinusPoints FLOAT,
    numMinutes FLOAT,
    q1Points FLOAT,
    q2Points FLOAT,
    q3Points FLOAT,
    q4Points FLOAT,
    benchPoints FLOAT,
    biggestLead FLOAT,
    biggestScoringRun FLOAT,
    leadChanges FLOAT,
    pointsFastBreak FLOAT,
    pointsFromTurnovers FLOAT,
    pointsInThePaint FLOAT,
    pointsSecondChance FLOAT,
    timesTied FLOAT,
    timeoutsRemaining FLOAT,
    seasonWins FLOAT,
    seasonLosses FLOAT,
    coachId INT
);

-- Estadísticas de jugadores por partido
CREATE TABLE player_statistics (
    firstName TEXT,
    lastName TEXT,
    personId INT,
    gameId TEXT,
    gameDate TIMESTAMP,
    playerteamCity TEXT,
    playerteamName TEXT,
    opponentteamCity TEXT,
    opponentteamName TEXT,
    gameType TEXT,
    gameLabel TEXT,
    gameSubLabel TEXT,
    seriesGameNumber FLOAT,   -- <- antes INT
    win BOOLEAN,
    home BOOLEAN,
    numMinutes FLOAT,
    points FLOAT,
    assists FLOAT,
    blocks FLOAT,
    steals FLOAT,
    fieldGoalsAttempted FLOAT,
    fieldGoalsMade FLOAT,
    fieldGoalsPercentage FLOAT,
    threePointersAttempted FLOAT,
    threePointersMade FLOAT,
    threePointersPercentage FLOAT,
    freeThrowsAttempted FLOAT,
    freeThrowsMade FLOAT,
    freeThrowsPercentage FLOAT,
    reboundsDefensive FLOAT,
    reboundsOffensive FLOAT,
    reboundsTotal FLOAT,
    foulsPersonal FLOAT,
    turnovers FLOAT,
    plusMinusPoints FLOAT
);

-- ======================
-- Cargar CSVs
-- ======================
\copy players FROM 'C:/Tu/Ruta/Downloads/archive/Players.csv' CSV HEADER;
\copy team_histories FROM 'C:/Tu/Ruta/Downloads/archive/TeamHistories.csv' CSV HEADER;
\copy games FROM 'C:/Tu/Ruta/Downloads/archive/Games.csv' CSV HEADER;
\copy team_statistics FROM 'C:/Tu/Ruta/Downloads/archive/TeamStatistics.csv' CSV HEADER;
\copy player_statistics FROM 'C:/Tu/Ruta/Downloads/archive/PlayerStatistics.csv' CSV HEADER;
