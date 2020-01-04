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

# Get the front-end up and running

Follow these instructions to setup the front end of the application:

```bash
cd ..
ruby app.rb
```

# Access the webpage

[Access Page](https://localhost:4567)
