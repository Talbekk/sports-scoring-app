require_relative( "../models/trainer.rb" )
require_relative( "../models/match.rb" )
require_relative( "../models/monster.rb")
# require("pry-byebug")

Match.delete_all()
Trainer.delete_all()
Monster.delete_all()

monster1 = Monster.new({"name" => "Venusaur", "type" => "Grass/Poison", "level" => 50})

monster1.save()

monster2 = Monster.new({"name" => "Blastoise", "type" => "Water", "level" => 50})

monster2.save()

monster3 = Monster.new({"name" => "Charizard", "type" => "Fire/Flying", "level" => 50})

monster3.save()

monster4 = Monster.new({"name" => "Pikachu", "type" => "Electric", "level" => 50})

monster4.save()

monster5 = Monster.new({"name" => "Snorlax", "type" => "Normal", "level" => 50})

monster5.save()

monster6 = Monster.new({"name" => "Nidoking", "type" => "Poison", "level" => 50})

monster6.save()

monster7 = Monster.new({"name" => "Mewtwo", "type" => "Psychic", "level" => 50})

monster7.save()

monster8 = Monster.new({"name" => "Starmie", "type" => "Water", "level" => 50})

monster8.save()

monster9 = Monster.new({"name" => "Staryu", "type" => "Water", "level" => 50})

monster9.save()

monster10 = Monster.new({"name" => "Togepi", "type" => "Normal", "level" => 50})

monster10.save()

monster11 = Monster.new({"name" => "Arcanine", "type" => "Fire", "level" => 50})

monster11.save()

monster12 = Monster.new({"name" => "Onix", "type" => "Rock", "level" => 50})

monster12.save()

monster13 = Monster.new({"name" => "Vulpix", "type" => "Fire", "level" => 50})

monster13.save()

monster14 = Monster.new({"name" => "Geodude", "type" => "Rock", "level" => 50})

monster14.save()

trainer1 = Trainer.new({
  "name" => "Ash Ketchum",
  "hometown" => "Pallet Town",
  "monster1_id" => monster3.id,
  "monster2_id" => monster4.id,
  "monster3_id" => monster5.id,
  "matches_played" => 2,
  "matches_won" => 1,
  "matches_lost" => 1,
  "games_won" => 4,
  "games_lost" => 2,
  "points" => 3
})

trainer1.save()

trainer2 = Trainer.new({
  "name" => "Gary Oak",
  "hometown" => "Pallet Town",
  "monster1_id" => monster2.id,
  "monster2_id" => monster6.id,
  "monster3_id" => monster11.id,
  "matches_played" => 2,
  "matches_won" => 1,
  "matches_lost" => 1,
  "games_won" => 2,
  "games_lost" => 4,
  "points" => 3
})

trainer2.save()

trainer3 = Trainer.new({
  "name" => "Misty",
  "hometown" => "Cerulean City",
  "monster1_id" => monster8.id,
  "monster2_id" => monster9.id,
  "monster3_id" => monster10.id,
  "matches_played" => 1,
  "matches_won" => 1,
  "matches_lost" => 0,
  "games_won" => 3,
  "games_lost" => 0,
  "points" => 3
})

trainer3.save()

trainer4 = Trainer.new({
  "name" => "Brock",
  "hometown" => "Pewter City",
  "monster1_id" => monster12.id,
  "monster2_id" => monster13.id,
  "monster3_id" => monster14.id,
  "matches_played" => 1,
  "matches_won" => 0,
  "matches_lost" => 1,
  "games_won" => 0,
  "games_lost" => 3,
  "points" => 0
})

trainer4.save()

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

match3 = Match.new({
  "trainer1_id" => trainer3.id,
  "home_score" => 3,
  "trainer2_id" => trainer4.id,
  "away_score" => 0
})

match3.save()

# binding.pry
# nil
