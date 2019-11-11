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

def test_get_hometown()
  assert_equal("Pallet Town", @trainer1.hometown())
  assert_equal("Pallet Town", @trainer2.hometown())
end

def test_current_score()
  assert_equal(0, @trainer1.points())
  assert_equal(0, @trainer2.points())
end

def test_add_points()
  @trainer1.add_points(3)
  assert_equal(3, @trainer1.points())
end

def test_add_win()
  @trainer1.add_win()
  assert_equal(3, @trainer1.points())
end 



end
