require_relative ('../db/sql_runner.rb')


class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

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

  def artist()
    sql = "SELECT name FROM artists WHERE id = $1;"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return result[0]['name']
  end

  def update()
    sql = "
    UPDATE albums SET (
      title,
      genre,
      artist_id
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.list_by_artist(artist_id)
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [artist_id]
    list_by_artist = SqlRunner.run(sql, values)
    return list_by_artist.map { |album| self.new(album)}
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def self.list_all()
    sql = "SELECT * FROM albums;"
    all_albums = SqlRunner.run(sql)
    return all_albums.map { |album| self.new(album) }
  end

end
