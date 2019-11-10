require_relative( '../db/sql_runner' )

class Trainer

attr_reader( :id, :name, :hometown )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @hometown = options['hometown']
end

def save()
  sql = "INSERT INTO trainers
  (
    name,
    hometown
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@name, @hometown]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def matches()
  sql = "SELECT matches.*
  FROM matches
  WHERE trainers.trainer_id = $1"
  values = [@id]
  results = SqlRunner.run(sql, values)
  trainers = Trainer.map_items(results)
  return trainers
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
