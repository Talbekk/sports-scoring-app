require_relative( "../models/trainer.rb" )
require_relative( "../models/match.rb" )
require_relative( "../models/monster.rb")
require("pry-byebug")

Match.delete_all()
Trainer.delete_all()
Monster.delete_all()

monster1 = Monster.new({"name" => "Venusaur", "type" => "Grass/Poison", "level" => 50})

monster1.save()

monster2 = Monster.new({"name" => "Blastoise", "type" => "Water", "level" => 50})

monster2.save()

monster3 = Monster.new({"name" => "Charizard", "type" => "Fire/Flying", "level" => 50})

monster3.save()

trainer1 = Trainer.new({
  "name" => "Ash Ketchum",
  "hometown" => "Pallet Town",
  "monster1_id" => monster1.id,
  "monster2_id" => monster2.id,
  "monster3_id" => monster3.id,
  "matches_played" => 2,
  "games_won" => 1,
  "games_lost" => 1,
  "points" => 3
})

trainer1.save()

trainer2 = Trainer.new({
  "name" => "Gary Oak",
  "hometown" => "Pallet Town",
  "monster1_id" => monster1.id,
  "monster2_id" => monster2.id,
  "monster3_id" => monster3.id,
  "matches_played" => 2,
  "games_won" => 1,
  "games_lost" => 1,
  "points" => 3
})

trainer2.save()

match1 = Match.new({
  "trainer1_id" => trainer1.id,
  "home_score" => 3,
  "trainer2_id" => trainer2.id,
  "away_score" => 0
})

match1.save()

match2 = Match.new({
  "trainer1_id" => trainer2.id,
  "home_score" => 2,
  "trainer2_id" => trainer1.id,
  "away_score" => 1
})

match2.save()

binding.pry
nil
