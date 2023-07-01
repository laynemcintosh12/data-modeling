

DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital;

/c hospital

CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialty TEXT NOT NULL DEFAULT "Certified Nurse"
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone_num TEXT NOT NULL,
    emerg_cont_name TEXT NOT NULL,
    emerg_cont_number TEXT NOT NULL,
    insurance TEXT,
    birthday DATE
);

CREATE TABLE patients_doctors
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE,
    diagnosis_id INTEGER REFERENCES diseases ON DELETE SET NULL,
    notes TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT
);