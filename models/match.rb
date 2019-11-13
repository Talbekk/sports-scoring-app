require_relative( '../db/sql_runner' )

class Match

attr_reader( :id, :trainer1_id, :home_score, :trainer2_id, :away_score )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @trainer1_id = options['trainer1_id']
  @home_score = options['home_score'].to_i
  @trainer2_id = options['trainer2_id']
  @away_score = options['away_score'].to_i
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

def update()
  sql = "UPDATE matches
  SET
  (
    trainer1_id,
    home_score,
    trainer2_id,
    away_score
  ) =
  (
    $1, $2, $3, $4
  )
  WHERE id = $5"
  values = [@trainer1_id, @home_score, @trainer2_id, @away_score, @id]
  SqlRunner.run(sql, values)
end

def update_score()
  sql = "UPDATE matches
  SET
  (
    home_score,
    away_score
  ) =
  (
    $1, $2
  )
  WHERE id = $3"
  values = [@home_score, @away_score, @id]
  SqlRunner.run(sql, values)
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

def get_match_winner()
return "draw" if (@home_score == @away_score)
  if (@home_score > @away_score )
    result = @trainer1_id
  else (@home_score < @away_score)
    result = @trainer2_id
  end
  trainer = Trainer.find( result )
  return trainer
end

def get_match_loser()
  return "draw" if (@home_score == @away_score)
  if (@home_score < @away_score )
    result = @trainer1_id
  else (@home_score > @away_score)
    result = @trainer2_id
  end
  trainer = Trainer.find( result )
  return trainer
end

def update_table(trainers, match)
  for trainer in trainers
    if (match.get_match_winner.name ==  trainer.name)
        trainer.win_update_table()
        trainer.update()
    else
      if (match.get_match_loser.name == trainer.name)
      trainer.lost_update_table()
      trainer.update()
      end
    end
  end
end

def update_table_remove_match(trainers, match)
  for trainer in trainers
    if (match.get_match_winner.name ==  trainer.name)
        trainer.remove_win()
        trainer.update()
    else
      if (match.get_match_loser.name == trainer.name)
      trainer.remove_loss()
      trainer.update()
      end
    end
  end
end

def get_last_match()
  matches = self.all()
  return matches.last()
end

def get_total_score()
  total = @home_score + @away_score
  return total
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
  results = SqlRunner.run(sql, values)
  return Match.new(results.first)
end

def self.delete_all()
  sql = "DELETE FROM matches"
  SqlRunner.run(sql)
end

def self.map_all(match_data)
  return match_data.map {
    |match| Match.new(match)
  }
end

end
