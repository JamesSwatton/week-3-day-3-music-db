
class Artist

attr_reader :id
attr_accessor :name

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    db = PG.connect ({ dbname: 'music', host: 'localhost'})
    sql = "INSERT INTO artists (name) VALUES ($1)
            RETURNING id;"
    values = [@name]
    db.prepare("save_banana", sql)
    results = db.exec_prepared("save_banana", values)
    db.close()

    @id = results.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end
end
