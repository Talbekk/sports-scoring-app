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

  # def zombies()
  #   sql = "SELECT z.* FROM zombies z INNER JOIN bitings b ON b.zombie_id = z.id WHERE b.victim_id = $1;"
  #   values = [@id]
  #   results = SqlRunner.run(sql, values)
  #   return results.map { |zombie| Zombie.new(zombie) }
  # end

  def self.all()
    sql = "SELECT * FROM trainers"
    results = SqlRunner.run( sql )
    return results.map { |trainer| Trainer.new( trainer ) }
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

end
