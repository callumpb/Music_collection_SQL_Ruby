require('pry')
require_relative('models/album.rb')
require_relative('models/artist.rb')


#Album.delete_all
#Artist.delete_all

artist_1 = Artist.new({'name' => 'Hamish'})
#artist_1.save

album_1 = Album.new({ 'name' => 'Where is my GitHub file?',
   'genre' => 'Dubstep', 'artist_id' => artist_1.id})

album_2 = Album.new({ 'name' => 'I have no idea what is happening',
   'genre' => 'Drum&Bass', 'artist_id' => artist_1.id})

binding.pry
nil
