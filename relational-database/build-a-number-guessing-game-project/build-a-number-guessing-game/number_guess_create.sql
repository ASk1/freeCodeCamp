CREATE DATABASE number_guess;
\c number_guess;
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name  VARCHAR(22) NOT NULL UNIQUE,
  games_played INT DEFAULT 0,
  best_game INT DEFAULT 0
);
