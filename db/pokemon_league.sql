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
  matches_played INT8,
  games_won INT8,
  games_lost INT8,
  points INT8
);

CREATE TABLE matches (
  id SERIAL8 PRIMARY KEY,
  trainer1_id INT8 REFERENCES trainers(id),
  home_score INT4,
  trainer2_id INT8 REFERENCES trainers(id),
  away_score INT4
);
