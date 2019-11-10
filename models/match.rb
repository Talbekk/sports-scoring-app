require_relative( '../db/sql_runner' )

class Match

attr_reader( :id, :trainer1_id, :home_score, :trainer2_id, :away_score )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @trainer1_id = options['trainer1_id']
  @home_score = options['home_score']
  @trainer2_id = options['trainer2_id']
  @away_score = options['away_score']
end

def save()
  sql = "INSERT INTO matches
  (
    trainer1_id,
    home_score,
    trainer2_id,
    away_score
  )
  VALUES
  (
    $1, $2, $3, $4
  )
  RETURNING id"
  values = [@trainer1_id, @home_score, @trainer2_id, @away_score]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def trainer1()
  sql = "SELECT * FROM trainers
  WHERE id = $1"
  values = [@trainer1_id]
  results = SqlRunner.run(sql, values)
  trainer1 = Trainer.map_all(results)
  return trainer1
end

def trainer2()
  sql = "SELECT * FROM trainers
  WHERE id = $1"
  values = [@trainer2_id]
  results = SqlRunner.run(sql, values)
  trainer2 = Trainer.map_all(results)
  return trainer2
end

def trainers()
  result1 = trainer1()
  result2 = trainer2()
  trainers = result1 << result2.first
  return trainers
end

def delete()
  sql = "DELETE FROM matches WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM matches"
  results = SqlRunner.run( sql )
  matches = map_all(results)
  return matches
end

def self.find( id )
  sql = "SELECT * FROM matches
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Match.new( results.first )
end

def self.delete_all
  sql = "DELETE FROM matches"
  SqlRunner.run( sql )
end

def self.map_all(match_data)
  return match_data.map { |match| Match.new(match) }
end

end