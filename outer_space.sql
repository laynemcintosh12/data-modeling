-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around_id INTEGER REFERENCES suns ON DELETE SET NULL,
  galaxy_id INTEGER REFERENCES galaxys ON DELETE SET NULL,
  moons_id INTEGER REFERENCES moons ON DELETE SET NULL
);

CREATE TABLE suns 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    galaxy_id INTEGER REFERENCES galaxys
);

CREATE TABLE galaxys
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE moon_names
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    planet_id INTEGER REFERENCES planets ON DELETE CASCADE
);

CREATE TABLE moons
(
    id SERIAL PRIMARY KEY
    moon_id INTEGER REFERENCES moon_names ON DELETE SET NULL
);



INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');