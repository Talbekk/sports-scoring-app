require_relative( '../db/sql_runner' )

class Trainer

attr_reader( :id, :name, :hometown )
attr_accessor( :monster1_id, :monster2_id, :monster3_id, :matches_played, :matches_won, :matches_lost, :games_won, :games_lost, :points )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @hometown = options['hometown']
  @monster1_id = options['monster1_id'].to_i
  @monster2_id = options['monster2_id'].to_i
  @monster3_id = options['monster3_id'].to_i
  @matches_played = options['matches_played'].to_i
  @matches_won = options['matches_won'].to_i
  @matches_lost = options['matches_lost'].to_i
  @games_won = options['games_won'].to_i
  @games_lost = options['games_lost'].to_i
  @points = options['points'].to_i
end

def save()
  sql = "INSERT INTO trainers
  (
    name,
    hometown,
    monster1_id,
    monster2_id,
    monster3_id,
    matches_played,
    matches_won,
    matches_lost,
    games_won,
    games_lost,
    points
  )
  VALUES
  (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
  )
  RETURNING id"
  values = [@name, @hometown, @monster1_id, @monster2_id, @monster3_id, @matches_played, @matches_won, @matches_lost, @games_won, @games_lost, @points]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update()
  sql = "UPDATE trainers
  SET
  (
    name,
    hometown,
    monster1_id,
    monster2_id,
    monster3_id,
    matches_played,
    matches_won,
    matches_lost,
    games_won,
    games_lost,
    points
  ) =
  (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
  )
  WHERE id = $12"
  values = [@name, @hometown, @monster1_id, @monster2_id, @monster3_id, @matches_played, @matches_won, @matches_lost, @games_won, @games_lost, @points, @id]
  SqlRunner.run(sql, values)
end

def update_except_points()
  sql = "UPDATE trainers
  SET
  (
    name,
    hometown,
    monster1_id,
    monster2_id,
    monster3_id,
    matches_played,
    matches_won,
    matches_lost,
    games_won,
    games_lost
  ) =
  (
    $1, $2, $3, $4, $5, $6, $7, $8, $9, $10
  )
  WHERE id = $11"
  values = [@name, @hometown, @monster1_id, @monster2_id, @monster3_id, @matches_played, @matches_won, @matches_lost, @games_won, @games_lost, @id]
  SqlRunner.run(sql, values)
end

def monster1()
  sql = "SELECT * FROM monsters
  WHERE id = $1"
  values = [@monster1_id]
  results = SqlRunner.run(sql, values)
  monster1 = Monster.map_all(results)
  return monster1
end

def monster2()
  sql = "SELECT * FROM monsters
  WHERE id = $1"
  values = [@monster2_id]
  results = SqlRunner.run(sql, values)
  monster2 = Monster.map_all(results)
  return monster2
end

def monster3()
  sql = "SELECT * FROM monsters
  WHERE id = $1"
  values = [@monster3_id]
  results = SqlRunner.run(sql, values)
  monster3 = Monster.map_all(results)
  return monster3
end

def monsters()
  result1 = monster1()
  result2 = monster2()
  result3 = monster3()
  monsters_a = result1 << result2.first
  monsters = monsters_a << result3.first
  return monsters
end

def matches()
  sql = "SELECT * FROM matches
  WHERE trainer1_id = $1
  OR trainer2_id = $1"
  values = [@id]
  results = SqlRunner.run( sql, values )
  matches = Match.map_all(results)
  return matches
end

def delete_matches(trainer)
  matches = trainer.matches()
  for match in matches
    match.delete()
  end
end

def delete()
  sql = "DELETE FROM trainers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def add_points(points)
  @points += points
end

def win_update_table()
  @matches_played += 1
  @matches_won += 1
  @points += 3
end

def remove_win()
  @matches_played -= 1
  @matches_won -= 1
  @points -= 3
end

def lost_update_table()
  @matches_played += 1
  @matches_lost += 1
end

def remove_loss()
  @matches_played -= 1
  @matches_lost -= 1
end

def self.all()
  sql = "SELECT * FROM trainers"
  results = SqlRunner.run( sql )
  trainers = map_all(results)
  return trainers
end

def self.find( id )
    sql = "SELECT * FROM trainers
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Trainer.new( results.first )
end

def self.delete_all()
  sql = "DELETE FROM trainers"
  SqlRunner.run( sql )
end

def self.map_all(match_data)
  return match_data.map { |trainer| Trainer.new(trainer) }
end

end
