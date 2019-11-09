require_relative( "../models/trainer.rb" )
require_relative( "../models/match.rb" )
require("pry-byebug")

Match.delete_all()
Trainer.delete_all()

trainer1 = Trainer.new({
  "name" => "Ash Ketchum",
  "hometown" => "Pallet Town"
})

trainer1.save()

trainer2 = Trainer.new({
  "name" => "Gary Oak",
  "hometown" => "Pallet Town"
})

trainer2.save()

match1 = Match.new({
  "trainer1_id" => trainer1.id,
  "home_score" => 3,
  "trainer2_id" => trainer2.id,
  "away_score" => 2
})

match1.save()

match2 = Match.new({
  "trainer1_id" => trainer2.id,
  "home_score" => 4,
  "trainer2_id" => trainer1.id,
  "away_score" => 1
})

match2.save()

binding.pry
nil
