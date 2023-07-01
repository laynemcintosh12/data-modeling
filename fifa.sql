

DROP DATABASE IF EXISTS fifa;

CREATE DATABASE fifa;

/c fifa

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    team_location TEXT NOT NULL
    team_mascot TEXT
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    position TEXT
);

CREATE TABLE referees 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT
);

CREATE TABLE ref_crews
(
    id SERIAL PRIMARY KEY,
    ref_id INTEGER REFERENCES referees ON DELETE SET NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES seasons ON DELETE SET NULL
    home_team_id INTEGER REFERENCES teams ON DELETE SET NULL,  
    away_team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    referee_crew INTEGER REFERENCES ref_crews ON DELETE SET NULL
    date DATE NOT NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players ON DELETE SET NULL,
    game_id INTEGER REFERENCES games ON DELETE SET NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE,
    game_id INTEGER REFERENCES games ON DELETE CASCADE,
    result TEXT NOT NULL DEFAULT "draw"
);