-- ============================================================
-- NBA DATASET - PostgreSQL
-- ============================================================

-- ============================================================
-- 1. ELIMINAR Y CREAR LA BASE DE DATOS
-- ============================================================

\connect postgres

DROP DATABASE IF EXISTS nba_mbd WITH (FORCE);

CREATE DATABASE nba_mbd;

\connect nba_mbd

SET client_encoding = 'LATIN1';

-- ============================================================
-- 2. JUGADORES
-- ============================================================

CREATE TABLE players (
personId INT PRIMARY KEY,
firstName TEXT,
lastName TEXT,
birthDate DATE,
school TEXT,
country TEXT,
heightInches DOUBLE PRECISION,
bodyWeightLbs DOUBLE PRECISION,
jersey TEXT,
guard INT,
forward INT,
center INT,
dleagueFlag INT,
nbaFlag INT,
gamesPlayedFlag INT,
draftYear DOUBLE PRECISION,
draftRound DOUBLE PRECISION,
draftNumber DOUBLE PRECISION,
fromYear INT,
toYear INT
);

-- ============================================================
-- 3. HISTORIAL DE EQUIPOS
-- ============================================================

CREATE TABLE team_histories (
teamId INT,
teamCity TEXT,
teamName TEXT,
teamAbbrev TEXT,
seasonFounded DOUBLE PRECISION,
seasonActiveTill DOUBLE PRECISION,
league TEXT
);

-- ============================================================
-- 4. PARTIDOS
-- ============================================================

CREATE TABLE games (
gameId TEXT PRIMARY KEY,
gameDateTimeEst TIMESTAMP,
hometeamCity TEXT,
hometeamName TEXT,
hometeamId INT,
awayteamCity TEXT,
awayteamName TEXT,
awayteamId INT,
homeScore INT,
awayScore INT,
winner INT,
gameType TEXT,
gameSubtype TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
seriesGameNumber TEXT,
attendance INT,
arenaId TEXT,
arenaName TEXT,
arenaCity TEXT,
arenaState TEXT,
officials TEXT,
gameDate TIMESTAMP
);

-- ============================================================
-- 5. ESTADÍSTICAS DE EQUIPOS
-- ============================================================

CREATE TABLE team_statistics (
gameId TEXT,
gameDateTimeEst TIMESTAMP,
teamCity TEXT,
teamName TEXT,
teamId INT,
opponentTeamCity TEXT,
opponentTeamName TEXT,
opponentTeamId INT,
home BOOLEAN,
win BOOLEAN,
teamScore DOUBLE PRECISION,
opponentScore DOUBLE PRECISION,
assists DOUBLE PRECISION,
blocks DOUBLE PRECISION,
steals DOUBLE PRECISION,
fieldGoalsAttempted DOUBLE PRECISION,
fieldGoalsMade DOUBLE PRECISION,
fieldGoalsPercentage DOUBLE PRECISION,
threePointersAttempted DOUBLE PRECISION,
threePointersMade DOUBLE PRECISION,
threePointersPercentage DOUBLE PRECISION,
freeThrowsAttempted DOUBLE PRECISION,
freeThrowsMade DOUBLE PRECISION,
freeThrowsPercentage DOUBLE PRECISION,
reboundsDefensive DOUBLE PRECISION,
reboundsOffensive DOUBLE PRECISION,
reboundsTotal DOUBLE PRECISION,
foulsPersonal DOUBLE PRECISION,
turnovers DOUBLE PRECISION,
plusMinusPoints DOUBLE PRECISION,
numMinutes DOUBLE PRECISION,
q1Points DOUBLE PRECISION,
q2Points DOUBLE PRECISION,
q3Points DOUBLE PRECISION,
q4Points DOUBLE PRECISION,
benchPoints DOUBLE PRECISION,
biggestLead DOUBLE PRECISION,
biggestScoringRun DOUBLE PRECISION,
leadChanges DOUBLE PRECISION,
pointsFastBreak DOUBLE PRECISION,
pointsFromTurnovers DOUBLE PRECISION,
pointsInThePaint DOUBLE PRECISION,
pointsSecondChance DOUBLE PRECISION,
timesTied DOUBLE PRECISION,
timeoutsRemaining DOUBLE PRECISION,
seasonWins DOUBLE PRECISION,
seasonLosses DOUBLE PRECISION,
coachId INT,
gameType TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
seriesGameNumber TEXT,
seed INT,
reboundsTeam DOUBLE PRECISION,
turnoversTeam DOUBLE PRECISION,
ot1Points DOUBLE PRECISION,
ot2Points DOUBLE PRECISION,
otAllPoints DOUBLE PRECISION,
gameDate TIMESTAMP
);

-- ============================================================
-- 6. ESTADÍSTICAS DE JUGADORES
-- ============================================================

-- numMinutes es TEXT porque el dataset contiene tanto:
-- 39.166666666666664
-- como:
-- 6:05

CREATE TABLE player_statistics (
firstName TEXT,
lastName TEXT,
personId INT,
gameId TEXT,
gameDateTimeEst TIMESTAMP,
playerteamCity TEXT,
playerteamName TEXT,
opponentteamCity TEXT,
opponentteamName TEXT,
gameType TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
seriesGameNumber TEXT,
win BOOLEAN,
home BOOLEAN,
numMinutes TEXT,
points DOUBLE PRECISION,
assists DOUBLE PRECISION,
blocks DOUBLE PRECISION,
steals DOUBLE PRECISION,
fieldGoalsAttempted DOUBLE PRECISION,
fieldGoalsMade DOUBLE PRECISION,
fieldGoalsPercentage DOUBLE PRECISION,
threePointersAttempted DOUBLE PRECISION,
threePointersMade DOUBLE PRECISION,
threePointersPercentage DOUBLE PRECISION,
freeThrowsAttempted DOUBLE PRECISION,
freeThrowsMade DOUBLE PRECISION,
freeThrowsPercentage DOUBLE PRECISION,
reboundsDefensive DOUBLE PRECISION,
reboundsOffensive DOUBLE PRECISION,
reboundsTotal DOUBLE PRECISION,
foulsPersonal DOUBLE PRECISION,
turnovers DOUBLE PRECISION,
plusMinusPoints DOUBLE PRECISION,
playerteamId INT,
opponentteamId INT,
comment TEXT,
startingPosition TEXT,
gameDate TIMESTAMP
);

-- ============================================================
-- 7. ESTADÍSTICAS EXTENDIDAS DE JUGADORES
-- ============================================================

CREATE TABLE player_statistics_extended (
firstName TEXT,
lastName TEXT,
personId INT,
gameId TEXT,
gameDateTimeEst TIMESTAMP,
gameType TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
seriesGameNumber TEXT,
win BOOLEAN,
home BOOLEAN,
playerteamId INT,
playerteamCity TEXT,
playerteamName TEXT,
opponentteamId INT,
opponentteamCity TEXT,
opponentteamName TEXT,
comment TEXT,
startingPosition TEXT,
numMinutes TEXT,
points DOUBLE PRECISION,
assists DOUBLE PRECISION,
reboundsTotal DOUBLE PRECISION,
reboundsOffensive DOUBLE PRECISION,
reboundsDefensive DOUBLE PRECISION,
fieldGoalsMade DOUBLE PRECISION,
fieldGoalsAttempted DOUBLE PRECISION,
fieldGoalsPercentage DOUBLE PRECISION,
threePointersMade DOUBLE PRECISION,
threePointersAttempted DOUBLE PRECISION,
threePointersPercentage DOUBLE PRECISION,
freeThrowsMade DOUBLE PRECISION,
freeThrowsAttempted DOUBLE PRECISION,
freeThrowsPercentage DOUBLE PRECISION,
steals DOUBLE PRECISION,
blocks DOUBLE PRECISION,
blocksAgainst DOUBLE PRECISION,
turnovers DOUBLE PRECISION,
foulsPersonal DOUBLE PRECISION,
foulsAgainst DOUBLE PRECISION,
plusMinusPoints DOUBLE PRECISION,
doubleDouble INT,
tripleDouble INT,
estimatedOffensiveRating DOUBLE PRECISION,
offensiveRating DOUBLE PRECISION,
spWorkOffensiveRating DOUBLE PRECISION,
estimatedDefensiveRating DOUBLE PRECISION,
defensiveRating DOUBLE PRECISION,
spWorkDefensiveRating DOUBLE PRECISION,
estimatedNetRating DOUBLE PRECISION,
netRating DOUBLE PRECISION,
spWorkNetRating DOUBLE PRECISION,
assistPercentage DOUBLE PRECISION,
assistToTurnoverRatio DOUBLE PRECISION,
assistRatio DOUBLE PRECISION,
offensiveReboundPercentage DOUBLE PRECISION,
defensiveReboundPercentage DOUBLE PRECISION,
reboundPercentage DOUBLE PRECISION,
teamTurnoverPercentage DOUBLE PRECISION,
estimatedTurnoverPercentage DOUBLE PRECISION,
effectiveFieldGoalPercentage DOUBLE PRECISION,
trueShootingPercentage DOUBLE PRECISION,
usagePercentage DOUBLE PRECISION,
estimatedUsagePercentage DOUBLE PRECISION,
estimatedPace DOUBLE PRECISION,
pace DOUBLE PRECISION,
pacePer40 DOUBLE PRECISION,
spWorkPace DOUBLE PRECISION,
playerImpactEstimate DOUBLE PRECISION,
possessions DOUBLE PRECISION,
pointsOffTurnovers DOUBLE PRECISION,
pointsSecondChance DOUBLE PRECISION,
pointsFastBreak DOUBLE PRECISION,
pointsInPaint DOUBLE PRECISION,
opponentPointsOffTurnovers DOUBLE PRECISION,
opponentPointsSecondChance DOUBLE PRECISION,
opponentPointsFastBreak DOUBLE PRECISION,
opponentPointsInPaint DOUBLE PRECISION,
percentFieldGoalAttempts2Point DOUBLE PRECISION,
percentFieldGoalAttempts3Point DOUBLE PRECISION,
percentPoints2Point DOUBLE PRECISION,
percentPoints2PointMidRange DOUBLE PRECISION,
percentPoints3Point DOUBLE PRECISION,
percentPointsFastBreak DOUBLE PRECISION,
percentPointsFreeThrow DOUBLE PRECISION,
percentPointsOffTurnovers DOUBLE PRECISION,
percentPointsInPaint DOUBLE PRECISION,
percentAssisted2PointMade DOUBLE PRECISION,
percentUnassisted2PointMade DOUBLE PRECISION,
percentAssisted3PointMade DOUBLE PRECISION,
percentUnassisted3PointMade DOUBLE PRECISION,
percentAssistedFieldGoalsMade DOUBLE PRECISION,
percentUnassistedFieldGoalsMade DOUBLE PRECISION,
percentTeamFieldGoalsMade DOUBLE PRECISION,
percentTeamFieldGoalsAttempted DOUBLE PRECISION,
percentTeamThreePointersMade DOUBLE PRECISION,
percentTeamThreePointersAttempted DOUBLE PRECISION,
percentTeamFreeThrowsMade DOUBLE PRECISION,
percentTeamFreeThrowsAttempted DOUBLE PRECISION,
percentTeamOffensiveRebounds DOUBLE PRECISION,
percentTeamDefensiveRebounds DOUBLE PRECISION,
percentTeamRebounds DOUBLE PRECISION,
percentTeamAssists DOUBLE PRECISION,
percentTeamTurnovers DOUBLE PRECISION,
percentTeamSteals DOUBLE PRECISION,
percentTeamBlocks DOUBLE PRECISION,
percentTeamBlocksAgainst DOUBLE PRECISION,
percentTeamFoulsPersonal DOUBLE PRECISION,
percentTeamFoulsDrawn DOUBLE PRECISION,
percentTeamPoints DOUBLE PRECISION
);

-- ============================================================
-- 8. ESTADÍSTICAS EXTENDIDAS DE EQUIPOS
-- ============================================================

CREATE TABLE team_statistics_extended (
gameId TEXT,
gameDateTimeEst TIMESTAMP,
gameType TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
seriesGameNumber TEXT,
teamId INT,
teamCity TEXT,
teamName TEXT,
opponentTeamId INT,
opponentTeamCity TEXT,
opponentTeamName TEXT,
home BOOLEAN,
win BOOLEAN,
teamScore DOUBLE PRECISION,
opponentScore DOUBLE PRECISION,
seed INT,
numMinutes DOUBLE PRECISION,
assists DOUBLE PRECISION,
steals DOUBLE PRECISION,
blocks DOUBLE PRECISION,
blocksAgainst DOUBLE PRECISION,
fieldGoalsMade DOUBLE PRECISION,
fieldGoalsAttempted DOUBLE PRECISION,
fieldGoalsPercentage DOUBLE PRECISION,
threePointersMade DOUBLE PRECISION,
threePointersAttempted DOUBLE PRECISION,
threePointersPercentage DOUBLE PRECISION,
freeThrowsMade DOUBLE PRECISION,
freeThrowsAttempted DOUBLE PRECISION,
freeThrowsPercentage DOUBLE PRECISION,
reboundsOffensive DOUBLE PRECISION,
reboundsDefensive DOUBLE PRECISION,
reboundsTotal DOUBLE PRECISION,
reboundsTeam DOUBLE PRECISION,
foulsPersonal DOUBLE PRECISION,
personalFoulsDrawn DOUBLE PRECISION,
turnovers DOUBLE PRECISION,
turnoversTeam DOUBLE PRECISION,
plusMinusPoints DOUBLE PRECISION,
q1Points DOUBLE PRECISION,
q2Points DOUBLE PRECISION,
q3Points DOUBLE PRECISION,
q4Points DOUBLE PRECISION,
ot1Points DOUBLE PRECISION,
ot2Points DOUBLE PRECISION,
otAllPoints DOUBLE PRECISION,
benchPoints DOUBLE PRECISION,
biggestLead DOUBLE PRECISION,
biggestScoringRun DOUBLE PRECISION,
leadChanges DOUBLE PRECISION,
pointsFastBreak DOUBLE PRECISION,
pointsFromTurnovers DOUBLE PRECISION,
pointsInThePaint DOUBLE PRECISION,
pointsSecondChance DOUBLE PRECISION,
timesTied DOUBLE PRECISION,
timeoutsRemaining DOUBLE PRECISION,
seasonWins DOUBLE PRECISION,
seasonLosses DOUBLE PRECISION,
estimatedOffensiveRating DOUBLE PRECISION,
offensiveRating DOUBLE PRECISION,
estimatedDefensiveRating DOUBLE PRECISION,
defensiveRating DOUBLE PRECISION,
estimatedNetRating DOUBLE PRECISION,
netRating DOUBLE PRECISION,
assistPercentage DOUBLE PRECISION,
assistToTurnoverRatio DOUBLE PRECISION,
assistRatio DOUBLE PRECISION,
offensiveReboundPercentage DOUBLE PRECISION,
defensiveReboundPercentage DOUBLE PRECISION,
reboundPercentage DOUBLE PRECISION,
teamTurnoverPercentage DOUBLE PRECISION,
effectiveFieldGoalPercentage DOUBLE PRECISION,
trueShootingPercentage DOUBLE PRECISION,
estimatedPace DOUBLE PRECISION,
pace DOUBLE PRECISION,
pacePer40 DOUBLE PRECISION,
possessions DOUBLE PRECISION,
playerImpactEstimate DOUBLE PRECISION,
pointsOffTurnovers DOUBLE PRECISION,
opponentPointsOffTurnovers DOUBLE PRECISION,
opponentPointsSecondChance DOUBLE PRECISION,
opponentPointsFastBreak DOUBLE PRECISION,
opponentPointsInPaint DOUBLE PRECISION,
percentFieldGoalAttempts2Point DOUBLE PRECISION,
percentFieldGoalAttempts3Point DOUBLE PRECISION,
percentPoints2Point DOUBLE PRECISION,
percentPoints2PointMidRange DOUBLE PRECISION,
percentPoints3Point DOUBLE PRECISION,
percentPointsFastBreak DOUBLE PRECISION,
percentPointsFreeThrow DOUBLE PRECISION,
percentPointsOffTurnovers DOUBLE PRECISION,
percentPointsInPaint DOUBLE PRECISION,
percentAssisted2PointMade DOUBLE PRECISION,
percentUnassisted2PointMade DOUBLE PRECISION,
percentAssisted3PointMade DOUBLE PRECISION,
percentUnassisted3PointMade DOUBLE PRECISION,
percentAssistedFieldGoalsMade DOUBLE PRECISION,
percentUnassistedFieldGoalsMade DOUBLE PRECISION,
freeThrowAttemptRate DOUBLE PRECISION,
opponentEffectiveFieldGoalPercentage DOUBLE PRECISION,
opponentFreeThrowAttemptRate DOUBLE PRECISION,
opponentTurnoverPercentage DOUBLE PRECISION,
opponentOffensiveReboundPercentage DOUBLE PRECISION
);

-- ============================================================
-- 9. CALENDARIO 2024-25
-- ============================================================

CREATE TABLE league_schedule_24_25 (
gameId TEXT,
gameDateTimeEst TIMESTAMPTZ,
gameDay TEXT,
arenaCity TEXT,
arenaState TEXT,
arenaName TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
gameSubtype TEXT,
gameSequence INT,
seriesGameNumber TEXT,
seriesText TEXT,
weekNumber INT,
hometeamId INT,
awayteamId INT
);

-- ============================================================
-- 10. CALENDARIO 2025-26
-- ============================================================

CREATE TABLE league_schedule_25_26 (
gameId TEXT,
gameDateTimeEst TIMESTAMP,
gameDay TEXT,
homeTeamId INT,
awayTeamId INT,
homeTeamName TEXT,
homeTeamCity TEXT,
awayTeamName TEXT,
awayTeamCity TEXT,
arenaName TEXT,
arenaCity TEXT,
arenaState TEXT,
gameLabel TEXT,
gameSubLabel TEXT,
gameSubtype TEXT,
seriesGameNumber TEXT,
weekNumber INT
);

-- ============================================================
-- 11. IMPORTACIÓN DE CSV
-- ============================================================

\copy players(personId,firstName,lastName,birthDate,school,country,heightInches,bodyWeightLbs,jersey,guard,forward,center,dleagueFlag,nbaFlag,gamesPlayedFlag,draftYear,draftRound,draftNumber,fromYear,toYear) FROM './Players.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy team_histories(teamId,teamCity,teamName,teamAbbrev,seasonFounded,seasonActiveTill,league) FROM './TeamHistories.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy games(gameId,gameDateTimeEst,hometeamCity,hometeamName,hometeamId,awayteamCity,awayteamName,awayteamId,homeScore,awayScore,winner,gameType,gameSubtype,gameLabel,gameSubLabel,seriesGameNumber,attendance,arenaId,arenaName,arenaCity,arenaState,officials,gameDate) FROM './Games.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy team_statistics(gameId,gameDateTimeEst,teamCity,teamName,teamId,opponentTeamCity,opponentTeamName,opponentTeamId,home,win,teamScore,opponentScore,assists,blocks,steals,fieldGoalsAttempted,fieldGoalsMade,fieldGoalsPercentage,threePointersAttempted,threePointersMade,threePointersPercentage,freeThrowsAttempted,freeThrowsMade,freeThrowsPercentage,reboundsDefensive,reboundsOffensive,reboundsTotal,foulsPersonal,turnovers,plusMinusPoints,numMinutes,q1Points,q2Points,q3Points,q4Points,benchPoints,biggestLead,biggestScoringRun,leadChanges,pointsFastBreak,pointsFromTurnovers,pointsInThePaint,pointsSecondChance,timesTied,timeoutsRemaining,seasonWins,seasonLosses,coachId,gameType,gameLabel,gameSubLabel,seriesGameNumber,seed,reboundsTeam,turnoversTeam,ot1Points,ot2Points,otAllPoints,gameDate) FROM './TeamStatistics.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy player_statistics(firstName,lastName,personId,gameId,gameDateTimeEst,playerteamCity,playerteamName,opponentteamCity,opponentteamName,gameType,gameLabel,gameSubLabel,seriesGameNumber,win,home,numMinutes,points,assists,blocks,steals,fieldGoalsAttempted,fieldGoalsMade,fieldGoalsPercentage,threePointersAttempted,threePointersMade,threePointersPercentage,freeThrowsAttempted,freeThrowsMade,freeThrowsPercentage,reboundsDefensive,reboundsOffensive,reboundsTotal,foulsPersonal,turnovers,plusMinusPoints,playerteamId,opponentteamId,comment,startingPosition,gameDate) FROM './PlayerStatistics.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy player_statistics_extended(firstName,lastName,personId,gameId,gameDateTimeEst,gameType,gameLabel,gameSubLabel,seriesGameNumber,win,home,playerteamId,playerteamCity,playerteamName,opponentteamId,opponentteamCity,opponentteamName,comment,startingPosition,numMinutes,points,assists,reboundsTotal,reboundsOffensive,reboundsDefensive,fieldGoalsMade,fieldGoalsAttempted,fieldGoalsPercentage,threePointersMade,threePointersAttempted,threePointersPercentage,freeThrowsMade,freeThrowsAttempted,freeThrowsPercentage,steals,blocks,blocksAgainst,turnovers,foulsPersonal,foulsAgainst,plusMinusPoints,doubleDouble,tripleDouble,estimatedOffensiveRating,offensiveRating,spWorkOffensiveRating,estimatedDefensiveRating,defensiveRating,spWorkDefensiveRating,estimatedNetRating,netRating,spWorkNetRating,assistPercentage,assistToTurnoverRatio,assistRatio,offensiveReboundPercentage,defensiveReboundPercentage,reboundPercentage,teamTurnoverPercentage,estimatedTurnoverPercentage,effectiveFieldGoalPercentage,trueShootingPercentage,usagePercentage,estimatedUsagePercentage,estimatedPace,pace,pacePer40,spWorkPace,playerImpactEstimate,possessions,pointsOffTurnovers,pointsSecondChance,pointsFastBreak,pointsInPaint,opponentPointsOffTurnovers,opponentPointsSecondChance,opponentPointsFastBreak,opponentPointsInPaint,percentFieldGoalAttempts2Point,percentFieldGoalAttempts3Point,percentPoints2Point,percentPoints2PointMidRange,percentPoints3Point,percentPointsFastBreak,percentPointsFreeThrow,percentPointsOffTurnovers,percentPointsInPaint,percentAssisted2PointMade,percentUnassisted2PointMade,percentAssisted3PointMade,percentUnassisted3PointMade,percentAssistedFieldGoalsMade,percentUnassistedFieldGoalsMade,percentTeamFieldGoalsMade,percentTeamFieldGoalsAttempted,percentTeamThreePointersMade,percentTeamThreePointersAttempted,percentTeamFreeThrowsMade,percentTeamFreeThrowsAttempted,percentTeamOffensiveRebounds,percentTeamDefensiveRebounds,percentTeamRebounds,percentTeamAssists,percentTeamTurnovers,percentTeamSteals,percentTeamBlocks,percentTeamBlocksAgainst,percentTeamFoulsPersonal,percentTeamFoulsDrawn,percentTeamPoints) FROM './PlayerStatisticsExtended.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy team_statistics_extended(gameId,gameDateTimeEst,gameType,gameLabel,gameSubLabel,seriesGameNumber,teamId,teamCity,teamName,opponentTeamId,opponentTeamCity,opponentTeamName,home,win,teamScore,opponentScore,seed,numMinutes,assists,steals,blocks,blocksAgainst,fieldGoalsMade,fieldGoalsAttempted,fieldGoalsPercentage,threePointersMade,threePointersAttempted,threePointersPercentage,freeThrowsMade,freeThrowsAttempted,freeThrowsPercentage,reboundsOffensive,reboundsDefensive,reboundsTotal,reboundsTeam,foulsPersonal,personalFoulsDrawn,turnovers,turnoversTeam,plusMinusPoints,q1Points,q2Points,q3Points,q4Points,ot1Points,ot2Points,otAllPoints,benchPoints,biggestLead,biggestScoringRun,leadChanges,pointsFastBreak,pointsFromTurnovers,pointsInThePaint,pointsSecondChance,timesTied,timeoutsRemaining,seasonWins,seasonLosses,estimatedOffensiveRating,offensiveRating,estimatedDefensiveRating,defensiveRating,estimatedNetRating,netRating,assistPercentage,assistToTurnoverRatio,assistRatio,offensiveReboundPercentage,defensiveReboundPercentage,reboundPercentage,teamTurnoverPercentage,effectiveFieldGoalPercentage,trueShootingPercentage,estimatedPace,pace,pacePer40,possessions,playerImpactEstimate,pointsOffTurnovers,opponentPointsOffTurnovers,opponentPointsSecondChance,opponentPointsFastBreak,opponentPointsInPaint,percentFieldGoalAttempts2Point,percentFieldGoalAttempts3Point,percentPoints2Point,percentPoints2PointMidRange,percentPoints3Point,percentPointsFastBreak,percentPointsFreeThrow,percentPointsOffTurnovers,percentPointsInPaint,percentAssisted2PointMade,percentUnassisted2PointMade,percentAssisted3PointMade,percentUnassisted3PointMade,percentAssistedFieldGoalsMade,percentUnassistedFieldGoalsMade,freeThrowAttemptRate,opponentEffectiveFieldGoalPercentage,opponentFreeThrowAttemptRate,opponentTurnoverPercentage,opponentOffensiveReboundPercentage) FROM './TeamStatisticsExtended.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy league_schedule_24_25(gameId,gameDateTimeEst,gameDay,arenaCity,arenaState,arenaName,gameLabel,gameSubLabel,gameSubtype,gameSequence,seriesGameNumber,seriesText,weekNumber,hometeamId,awayteamId) FROM './LeagueSchedule24_25.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

\copy league_schedule_25_26(gameId,gameDateTimeEst,gameDay,homeTeamId,awayTeamId,homeTeamName,homeTeamCity,awayTeamName,awayTeamCity,arenaName,arenaCity,arenaState,gameLabel,gameSubLabel,gameSubtype,seriesGameNumber,weekNumber) FROM './LeagueSchedule25_26.csv' WITH (FORMAT CSV, HEADER, ENCODING 'LATIN1');

-- ============================================================
-- 12. VISTAS PARA TRABAJAR CON NUMMINUTES
-- ============================================================

CREATE VIEW player_statistics_view AS
SELECT
p.*,
CASE
WHEN p.numMinutes ~ '^[0-9]+:[0-9]+$'
THEN
split_part(p.numMinutes, ':', 1)::DOUBLE PRECISION
+
split_part(p.numMinutes, ':', 2)::DOUBLE PRECISION / 60
ELSE
NULLIF(p.numMinutes, '')::DOUBLE PRECISION
END AS numMinutesDecimal
FROM player_statistics p;

CREATE VIEW player_statistics_extended_view AS
SELECT
p.*,
CASE
WHEN p.numMinutes ~ '^[0-9]+:[0-9]+$'
THEN
split_part(p.numMinutes, ':', 1)::DOUBLE PRECISION
+
split_part(p.numMinutes, ':', 2)::DOUBLE PRECISION / 60
ELSE
NULLIF(p.numMinutes, '')::DOUBLE PRECISION
END AS numMinutesDecimal
FROM player_statistics_extended p;

-- ============================================================
-- 13. COMPROBAR IMPORTACIÓN
-- ============================================================

SELECT 'players' AS tabla, COUNT(*) AS registros FROM players
UNION ALL
SELECT 'team_histories', COUNT(*) FROM team_histories
UNION ALL
SELECT 'games', COUNT(*) FROM games
UNION ALL
SELECT 'team_statistics', COUNT(*) FROM team_statistics
UNION ALL
SELECT 'player_statistics', COUNT(*) FROM player_statistics
UNION ALL
SELECT 'player_statistics_extended', COUNT(*) FROM player_statistics_extended
UNION ALL
SELECT 'team_statistics_extended', COUNT(*) FROM team_statistics_extended
UNION ALL
SELECT 'league_schedule_24_25', COUNT(*) FROM league_schedule_24_25
UNION ALL
SELECT 'league_schedule_25_26', COUNT(*) FROM league_schedule_25_26;
