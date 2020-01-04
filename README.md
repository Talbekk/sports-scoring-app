# Pokemon League

The Pokemon League is a sports scoring app for pokefans to keep track of their favourite trainer. Fans can follow a trainer's journey by adding or removing fixtures and trainers to keep everything up to date.

This app was made as a solo project for the CodeClan course using Ruby for front-end with a Sinatra web framework and PostgreSQL for the database.

---

# Installation

Ensure that you have installed the [Sinatra Web Framework](http://sinatrarb.com/intro.html), [PostgreSQL](https://www.postgresql.org/), the [minitest gem](https://rubygems.org/gems/minitest) and the [pry gem](https://rubygems.org/gems/pry).

## Create the database

Follow these instructions to setup our database, which will allow the seeds to fill the content:

```bash
dropdb pokemon_league
createdb pokemon_league
```

Create the tables and columns within the database:

```bash
cd db
psql -d pokemon_league -f db/pokemon_league.sql
```

Fill the tables with content:

```bash
ruby seeds.rb
```

# Front End

Follow these instructions to setup the front end of the application:

```bash
cd ..
ruby app.rb
```

# Access the webpage

[Access Page](https://localhost:4567)

---

# Brief

Build an app that lets a sports fan keep track of their favourite sports league.

As a huge fan of [your sport], you want to stay up to date with the league. You're interested to see which team leads the table and who won the latest games/matches/fixtures/bouts/…

## MVP

* The app should allow the user to create, edit and delete teams to the league.
* The user should be able to create, edit and delete games.
* There should be a way to display all the games for a team and all the teams involved in a game.
* The app should display if a game was won or lost.

## Extensions

* Create a league table to see who is on top of the league.
* Add players to teams and let them have game stats (points won, fouls, etc.).
