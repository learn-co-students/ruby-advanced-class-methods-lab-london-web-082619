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
    song = self.new
    song.save
    song
    end


    def self.new_by_name(track_name)
      song = self.new
      song.name = track_name
      song

    end

    def self.create_by_name(track_name)
      song = self.new
      song.name = track_name
      song.save
      song
    end

    def self.find_by_name(track_name)
      self.all.find{|track|track.name == track_name}
    end


    def self.find_or_create_by_name(track_name)
      self.find_by_name(track_name) || self.create_by_name(track_name)
    end
#this uses a boolean operator to see if the passed argument to track_name
#exists and if it doesn't it will execute the right side of the pipes, which
#instead invokes the earlier defined self.create_by_name 
      

    def self.alphabetical
      self.all.sort_by {|songs|songs.name}
    end
#here you call self in the code body to run over all the instances created by 
#the class, and .all to access the array of all songs, then .sort_by enumerator 
#to sort by the condition in the code block, which is by name. All of the 
#elements in the array (designated as 'songs' in the enumerator)
#have the properties of name and artist, so you call .name on all the elements 
#(all the elements are instances created by the song class) to sort by their
#.name property. 

    def self.new_from_filename(filename)
      song_split = filename.split(" - ")
      artist_name = song_split[0]
      song_name = song_split[1].gsub('.mp3','')


      #I tried to first create an song_split array and input the delineated strings from there but
      #had a lot of trouble in doing so. TO solve it I googled 'how to remove specific characters
      #from a string in ruby' and used this *VERY* useful link
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song

    end


    def self.create_from_filename(filename)
      song_split = filename.split(" - ")
      artist_name = song_split[0]
      song_name = song_split[1].gsub(".mp3","")

      song = self.create
      song.name = song_name
      song.artist_name = artist_name
      song
    end

    def self.destroy_all
      self.all.clear
    end

end



