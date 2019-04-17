require_relative ('../db/sql_runner.rb')


class Album

  attr_reader :id, :artist_id
  attr_accessor :title, :genre

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    #db = PG.connect({dbname: 'music', host: 'localhost'})
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3)
          RETURNING id;"
    values = [@title, @genre, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

end
