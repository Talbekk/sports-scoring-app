require('minitest/autorun')
require('minitest/rg')
require_relative('../match.rb')
require_relative('../trainer.rb')

class TrainerTest < Minitest::Test

def setup

  options = {"id" => 1, "name" => "Ash Ketchum", "hometown" => "Pallet Town", "points" => 0}

  @trainer1 = Trainer.new(options)

  options = {"id" => 2, "name" => "Gary Oak", "hometown" => "Pallet Town", "points" => 0}

  @trainer2 = Trainer.new(options)


end

def test_get_trainer_name()
  assert_equal("Ash Ketchum", @trainer1.name())
  assert_equal("Gary Oak", @trainer2.name())
end

def test_get

end
