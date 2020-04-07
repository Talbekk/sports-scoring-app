require( 'pg' )

class SqlRunner

  # def self.run( sql, values = [] )
  #   begin
  #     db = PG.connect({ dbname: 'pokemon_league', host: 'localhost' })
  #     db.prepare("query", sql)
  #     result = db.exec_prepared( "query", values )
  #   ensure
  #     db.close() if db != nil
  #   end
  #   return result
  # end

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd85805srvf09sr', host: 'ec2-50-17-21-170.compute-1.amazonaws.com
      ', port: 5432, user: 'jwjzcafqnanrcl', password: 'ca79b48474c09c188f381ae74f6e45ba2f912c123c126b99e890a57414faed9d' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
  #   return result
  # end

end
