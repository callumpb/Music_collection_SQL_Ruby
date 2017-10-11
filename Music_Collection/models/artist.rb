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
end
