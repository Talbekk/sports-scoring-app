require('minitest/autorun')
require('minitest/rg')
require_relative('../match.rb')
require_relative('../trainer.rb')
require_relative('../monster.rb')

class MatchTest < Minitest::Test

def setup

  options = {"id" => 1, "name" => "Charizard", "type" => "Fire/Flying", "level" => 50}

  @monster1 = Monster.new(options)

  options = {"id" => 2, "name" => "Blastoise", "type" => "Water", "level" => 50}

  @monster2 = Monster.new(options)

  options = {"id" => 3, "name" => "Venusaur", "type" => "Grass/Poison", "level" => 50}

  @monster3 = Monster.new(options)

  options = {"id" => 1, "name" => "Ash Ketchum", "hometown" => "Pallet Town", "monster1_id" => @monster1.id, "monster2_id" => @monster2.id,
  "monster3_id" => @monster3.id,
  "points" => 0}

  @trainer1 = Trainer.new(options)

  options = {"id" => 2, "name" => "Gary Oak", "hometown" => "Pallet Town", "monster1_id" => @monster1.id, "monster2_id" => @monster2.id,
  "monster3_id" => @monster3.id, "points" => 0}

  @trainer2 = Trainer.new(options)

  options = ({
    "trainer1_id" => @trainer1.id,
    "home_score" => 3,
    "trainer2_id" => @trainer2.id,
    "away_score" => 2
  })

  @match1 = Match.new(options)

end

def test_get_home_score()
  assert_equal(3, @match1.home_score)
end

def test_get_away_score()
  assert_equal(2, @match1.away_score)
end

def test_get_total_score()
  assert_equal(5, @match1.get_total_score)
end

def test_get_trainer_name()
  assert_equal(1, @match1.trainer1_id())
  assert_equal(2, @match1.trainer2_id())
end

# def test_get_match_winner()
#   result = @match1.get_match_winner()
#   assert_equal(1, result.id)
# end
#
# def test_get_match_winners_name()
#   result = @match1.get_match_winner()
#   name = @match1.get_match_winners_name(@trainers, result)
#   assert_equal("Ash Ketchum", name)
# end

def test_get_match_winner__draw()
  options = ({
    "trainer1_id" => @trainer1.id,
    "home_score" => 2,
    "trainer2_id" => @trainer2.id,
    "away_score" => 2
  })
  @match2 = Match.new(options)

  result = @match2.get_match_winner
  assert_equal("draw", result)
end

def test_get_total_score()
  assert_equal(5, @match1.get_total_score)
end 

end
