create database worldcup;
\c worldcup
create table teams (
  team_id serial primary key,
  name varchar(50) not null unique
);
create table games (
  game_id  serial primary key,
  year int NOT NULL,
  round varchar(50) NOT NULL,
  winner_id int NOT NULL references teams(team_id),
  opponent_id int NOT NULL references teams(team_id),
  winner_goals int NOT NULL,
  opponent_goals int NOT NULL
);
