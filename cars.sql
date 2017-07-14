CREATE DATABASE cars;

\c cars;

CREATE TABLE volvo (id SERIAL PRIMARY KEY, year integer, make VARCHAR(255), model VARCHAR(255));

INSERT INTO volvo (year, make, model) VALUES (2005, 'Volvo', 'S40');

CREATE TABLE sedans (id SERIAL PRIMARY KEY, mileage INT, color VARCHAR(255), trans VARCHAR(255), volvo_id INT REFERENCES volvo(id));

INSERT INTO sedans (mileage, color, trans, volvo_id) VALUES (90000, 'grey', 'manual', 1);