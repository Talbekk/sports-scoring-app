DROP TABLE matches;
DROP TABLE trainers;
DROP TABLE monsters;

CREATE TABLE monsters(
id SERIAL8 PRIMARY KEY,
name VARCHAR(255),
type VARCHAR(255),
level INT4
);

CREATE TABLE trainers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  hometown VARCHAR(255),
  monster1_id INT8 REFERENCES monsters(id),
  monster2_id INT8 REFERENCES monsters(id),
  monster3_id INT8 REFERENCES monsters(id),
  points INT8
);

CREATE TABLE matches (
  id SERIAL8 PRIMARY KEY,
  trainer1_id INT8 REFERENCES trainers(id),
  home1 VARCHAR(255),
  home2 VARCHAR(255),
  home3 VARCHAR(255),
  home_score INT4,
  trainer2_id INT8 REFERENCES trainers(id),
  away1 VARCHAR(255),
  away2 VARCHAR(255),
  away3 VARCHAR(255),
  away_score INT4
);
