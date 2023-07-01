

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

/c craigslist

CREATE TABLE posts 
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    description TEXT,
    location TEXT,
    region INTEGER REFERENCES regions ON DELETE SET NULL,
    category INTEGER REFERENCES categories ON DELETE SET NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    password TEXT NOT NULL,
    region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);