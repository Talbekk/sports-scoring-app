require('minitest/autorun')
require('minitest/rg')
require_relative('../match.rb')
require_relative('../trainer.rb')
require_relative('../monster.rb')

class MonsterTest < Minitest::Test

def setup

  options = {"id" => 1, "name" => "Charizard", "type" => "Fire/Flying", "level" => 50}

  @monster1 = Monster.new(options)

  options = {"id" => 2, "name" => "Blastoise", "type" => "Water", "level" => 50}

  @monster2 = Monster.new(options)

  options = {"id" => 3, "name" => "Venusaur", "type" => "Grass/Poison", "level" => 50}

  @monster3 = Monster.new(options)


end

def test_get_monster_name()
  assert_equal("Charizard", @monster1.name)

  

end
