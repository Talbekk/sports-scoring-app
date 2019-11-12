require('minitest/autorun')
require('minitest/rg')
require_relative('../match.rb')
require_relative('../trainer.rb')
require_relative('../monster.rb')

class TrainerTest < Minitest::Test

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

def test_get_monster_name()
  assert_equal(1, @trainer2.monster1_id())
  assert_equal(2, @trainer2.monster2_id())
  assert_equal(3, @trainer2.monster3_id())
end

end
