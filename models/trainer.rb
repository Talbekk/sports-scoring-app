require_relative( '../db/sql_runner' )

class Trainer

attr_reader( :id, :name, :hometown )
attr_accessor( :monster1_id, :monster2_id, :monster3_id, :points )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @hometown = options['hometown']
  @monster1_id = options['monster1_id'].to_i
  @monster2_id = options['monster2_id'].to_i
  @monster3_id = options['monster3_id'].to_i
  @points = options['points'].to_i
end

def save()
  sql = "INSERT INTO trainers
  (
    name,
    hometown,
    points,
    monster1_id,
    monster2_id,
    monster3_id
  )
  VALUES
  (
    $1, $2, $3, $4, $5, $6
  )
  RETURNING id"
  values = [@name, @hometown, @points, @monster1_id, @monster2_id, @monster3_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update()
  sql = "UPDATE trainers
  SET
  (
    name,
    hometown,
    points,
    monster1_id,
    monster2_id,
    monster3_id
  ) =
  (
    $1, $2, $3, $4, $5, $6
  )
  WHERE id = $7"
  values = [@name, @hometown, @points, @monster1_id, @monster2_id, @monster3_id, @id]
  SqlRunner.run(sql, values)
end

# def matches()
#   sql = "SELECT matches.*
#   FROM matches
#   WHERE trainers.trainer_id = $1"
#   values = [@id]
#   results = SqlRunner.run(sql, values)
#   trainers = Trainer.map_items(results)
#   return trainers
# end

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

def delete()
  sql = "DELETE FROM trainers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def add_points(points)
  @points += points
end

def add_win()
  @points += 3
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

def self.delete_all
    sql = "DELETE FROM trainers"
    SqlRunner.run( sql )
end

def self.map_all(match_data)
  return match_data.map { |trainer| Trainer.new(trainer) }
end

end
