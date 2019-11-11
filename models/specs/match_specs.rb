require('minitest/autorun')
require('minitest/rg')
require_relative('../match.rb')
require_relative('../trainer.rb')

class MatchTest < Minitest::Test

def setup

  options = {"id" => 1, "name" => "Ash Ketchum", "hometown" => "Pallet Town"}

  @trainer1 = Trainer.new(options)

  options = {"id" => 2, "name" => "Gary Oak", "hometown" => "Pallet Town"}

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

def test_get_trainer_name()
  assert_equal(1, @match1.trainer1_id())
  assert_equal(2, @match1.trainer2_id())
end

def test_get_match_winner()
  result = @match1.get_match_winner()
  assert_equal(1, result)
end 



# def test_get_match_winner()
#   @match1.match_winner()
#   result = @match1.trainer1.first.name()
#   assert_equal("Ash Ketchum", result)
# end

end
