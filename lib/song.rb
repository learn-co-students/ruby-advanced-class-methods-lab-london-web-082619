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
  song = Song.new
  song.save
  song
end

def self.new_by_name(song_name)
  song = self.new
  song.name = song_name
  song
end

def self.create_by_name(song_name)   
  song = self.create
  song.name = song_name
  song
end
#I set up the song_name as a variable
#and the self.creat go trought my function and find 
  #a song and return a song instance with that name set as its
  #name property and the song being saved into the @@all class variable.

def self.find_by_name(song_name)
  self.all.detect{|s| s.name == song_name}
end
#detect method in ruby returns the first item in the 
#collection for which the block returns TRUE and 
#returns nil if it doesn't find any.

def self.find_or_create_by_name(song_name)
 self.find_by_name(song_name) || self.create_by_name(song_name)
end
#in ordem to prevent duplicate songs I creat song_find_or-create
#by_name this method will match song instance with that name or
#create a new song with the name and return the song instace.

def self.alphabetical
  self.all.sort_by{|song| song.name}
end
#By default, Ruby’s .sort method will sort any 
#array of numbers or strings in ascending (low to high) 
#order.

def self.new_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  #The gsub string method is a substitution method
  #much like the old word document find and replace tool. 
  #It finds all instances of the matched string 
  #and replaces it with the new argument.

  song = self.new ##the self.new here will return a new song
  #name set to blank space and artist_name
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.create_from_filename(filename)
  parts = filename.split(" - ")
  artist_name = parts[0]
  song_name = parts[1].gsub(".mp3", "")

  #The gsub string method is a substitution method
  #much like the old word document find and replace tool. 
  #It finds all instances of the matched string 
  #and replaces it with the new argument.


  song = self.create 
  song.name = song_name
  song.artist_name = artist_name
  song
end

def self.destroy_all
  self.all.clear
end

#self.destroy_all class method will rest the state of the @@all
#class variable to an empty array.
# and will delete all previous song instances.

end




