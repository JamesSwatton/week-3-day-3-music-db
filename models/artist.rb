require_relative ('../db/sql_runner.rb')

class Artist

  attr_accessor :name
  attr_reader :id

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

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * FROM artists;"
    all_artists = SqlRunner.run(sql)
    return all_artists.map { |artist| self.new(artist) }
  end
end
