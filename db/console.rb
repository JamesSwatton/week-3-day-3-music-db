require_relative ('../models/album.rb')
require_relative ('../models/artist.rb')


Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({'name' => 'The Beatles'})
artist2 = Artist.new({'name' => 'Queen'})

artist1.save()#save artist before setting up album otherwise you will get a '0' for artist_id in the album table.
artist2.save()

album1 = Album.new({'title' => 'Rubber Soul', 'genre' => 'Rock/Pop', 'artist_id' => artist1.id})
album2 = Album.new({'title' => 'Abbey Road', 'genre' => 'Rock/Pop', 'artist_id' => artist1.id})
album3 = Album.new({'title' => 'Revolver', 'genre' => 'Rock/Pop', 'artist_id' => artist1.id})
album4 = Album.new({'title' => 'Greatest Hits Vol.1', 'genre' => 'Rock/Pop', 'artist_id' => artist2.id})
album5 = Album.new({'title' => 'Greatest Hits Vol.2', 'genre' => 'Rock/Pop', 'artist_id' => artist2.id})


album1.save()
album2.save()
album3.save()
album4.save()
album5.save()

album1.title = "A Hard Day's Night"
album1.update()

artist1.name = "The Rutles"
artist1.update()


# p Artist.list_all()
# p Album.list_all()
# p Album.list_by_artist(artist1.id)

# p album1.artist()
