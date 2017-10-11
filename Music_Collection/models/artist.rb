require('pg')
require_relative('../db/sql_runner.rb')
require_relative('album.rb')

class Artist
  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "
    INSERT INTO artists (name) VALUES ($1) RETURNING *
    "
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def self.all
    sql = "SELECT * FROM artists"
    values = []
    artists = SqlRunner.run(sql, values)
    artist_as_object = artists.map { |artist| Artist.new(artist)}
    return artist_as_object
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    values = []
    customers = SqlRunner.run(sql, values)
  end

  def albums
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)

    albums = results.map { |album| Album.new(album)}
    return albums
  end
end
