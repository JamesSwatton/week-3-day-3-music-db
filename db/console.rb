require_relative ('../models/album.rb')
require_relative ('../models/artist.rb')

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'Queen'})

artist1.save()
