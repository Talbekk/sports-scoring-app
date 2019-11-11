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

end

def test_get_match_winner(@trainer1, 3, @trainer2, 2)
  result = @trainer1.name()
  assert_equal("Ash Ketchum", result)
end
