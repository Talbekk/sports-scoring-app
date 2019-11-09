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
  # 
  # def zombies()
  #   sql = "SELECT z.* FROM zombies z INNER JOIN bitings b ON b.zombie_id = z.id WHERE b.victim_id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |zombie| Zombie.new(zombie) }
  # end

  def self.all()
    sql = "SELECT * FROM matches"
    results = SqlRunner.run( sql )
    return results.map { |match| Match.new( match ) }
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

end
