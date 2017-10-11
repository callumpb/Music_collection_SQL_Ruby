require('pg')
require_relative('artist.rb')
require_relative('../db/sql_runner.rb')

class Album

attr_reader :id, :name, :genre, :artist_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "
    INSERT INTO albums (name) VALUES ($1) RETURNING *
    "
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i()
  end

  def self.all
    sql = "SELECT * FROM albums"
    values = []
    albums = SqlRunner.run(sql, values)
    albums_as_objects = albums.map { |album| Album.new(album)}
    return albums_as_objects
  end

  def self.delete_all
    sql = "DELETE FROM albums"
    values = []
    customers = SqlRunner.run(sql, values)
  end
end
