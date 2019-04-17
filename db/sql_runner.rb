require ('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect ({ dbname: 'music', host: 'localhost'})
      db.prepare("query_banana", sql)
      results = db.exec_prepared("query_banana",values)
    ensure
      db.close() if db != nil
    end
  end
end
