class Song
  attr_accessor :name, :artist_name
  
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song_instance = self.new
    song_instance.save
    song_instance
  end
  
  def self.new_by_name(songs_name)
    song_instance = self.new
    song_instance.name = songs_name
    song_instance
   end
  
  def self.create_by_name(songs_name)
    song_instance = self.create
    song_instance.name = songs_name
    song_instance
  end
  
  def self.find_by_name(songs_name)
    self.all.find{|i| i.name == songs_name}
  end
  
  def self.find_or_create_by_name(songs_name)
    self.find_by_name(songs_name) || self.create_by_name(songs_name)
  end
  
  def self.alphabetical
    self.all.sort_by{|songs_name| songs_name.name}
  end
  
  def self.new_from_filename(artist_and_song)
    seperate_artist_and_song = artist_and_song.split(" - ")
    artist = seperate_artist_and_song[0]
    song_name = seperate_artist_and_song[1].chomp(".mp3")
    
    song = self.new
    song.artist_name = artist
    song.name = song_name
    song
  end
  
  def self.create_from_filename(artist_and_song)
    seperate_artist_and_song = artist_and_song.split(" - ")
    artist = seperate_artist_and_song[0]
    song_name = seperate_artist_and_song[1].chomp(".mp3")
    
    song = self.create
    song.artist_name = artist
    song.name = song_name
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
