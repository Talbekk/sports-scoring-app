require_relative( '../db/sql_runner' )

class Monster

attr_reader( :id, :name, :type, :level )

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
  results = SqlRunner.run[sql, values]
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
