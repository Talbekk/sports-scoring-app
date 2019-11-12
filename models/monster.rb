require_relative( '../db/sql_runner' )

class Monster

attr_reader( :id )
attr_accessor( :name, :type, :level )

def initialize( options )
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @type = options['type']
  @level = options['level'].to_i
end

def save()
  sql = "INSERT INTO monsters
    (
    name,
    type,
    level

    )
    VALUES
    (
    $1, $2, $3
    )
    RETURNING id"
  values = [@name, @type, @level]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update()
  sql = "UPDATE monsters
  SET
  (
  name,
  type,
  level
  ) =
  (
  $1, $2, $3
  )
  WHERE id = $4"
  values = [@name, @type, @level, @id]
  SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM monsters WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM monsters"
  results = SqlRunner.run(sql)
  monsters = map_all(results)
  return monsters
end

def self.find(id)
  sql = "SELECT * FROM monsters WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Monster.new(results.first)
end

def self.delete_all()
  sql = "DELETE FROM monsters"
  SqlRunner.run(sql)
end

def self.map_all(monster_data)
  return monster_data.map {
    |monster| Monster.new(monster)
  }
end

end
