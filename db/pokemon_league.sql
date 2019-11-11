DROP TABLE matches;
DROP TABLE trainers;

CREATE TABLE trainers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  hometown VARCHAR(255),
  points INT8
);

CREATE TABLE matches (
  id SERIAL8 PRIMARY KEY,
  trainer1_id INT8 REFERENCES trainers(id),
  home_score INT4,
  trainer2_id INT8 REFERENCES trainers(id),
  away_score INT4
);
