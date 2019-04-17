require_relative ('../models/album.rb')
require_relative ('../models/artist.rb')

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'Queen'})

artist1.save()#save artist before setting up album otherwise you will get a '0' for artist_id in the album table.

album1 = Album.new({'title' => '1999', 'genre' => 'funk', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Killer Queen', 'genre' => 'rock', 'artist_id' => artist2.id})


album1.save()
