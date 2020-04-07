# Pokemon League

The Pokemon League is a sports scoring app for pokefans to keep track of their favourite trainer. Fans can follow a trainer's journey by adding or removing fixtures and trainers to keep everything up to date.

This app was made as a solo project for the CodeClan course using Ruby for front-end with a Sinatra web framework and PostgreSQL for the database.

Check out the deployed app: https://poke-league.herokuapp.com/

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


# Planning

I used Trello to manage my progress through the week:

![Image](/public/images/trelloBoard.png)

This is an example of a proto-persona for my app:

![Image](/public/images/user.png)

---

# Conclusions

## Positive Outcomes

* I made good use of Trello to break up my work into tickets so that I keep myself busy throughout the day. I was never looking for something to do. I feel that I was able to keep tasks simple enough  and I could structure my day and week well in advance.

* This project really helped to develop my solo skills. I was the only student in the cohort to choose my topic so I had to figure a lot of my problems by myself or with the guidance of one of my instructors. I felt that process made me realise that I could actually do it and made me feel a lot more comfortable with progress through the course at that stage.

* I was successful in making use of the lessons that we had been given in the four weeks leading up to the project. For example, I broke a lot of my methods into smaller, simple methods that I could test individually and reuse in other methods. I wanted to incorporate the TDD that we had been learning and put it into practice.

## Things To Improve

* I did not keep on track of my git commits as well as I should have. I would go long stretches of time without a single commit and I feel like I have to improve on this for when it comes to working in team where multiple people are using the same code.

* I have to work on my attitude towards help from others, whether it be from a classmate or an instructor. I can be quite stubborn and need to be more comfortable asking for help rather than wasting time on a problem when I could be getting on with other tasks.
