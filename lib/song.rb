require "pry"


class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
    #equal to Song.all #equal to @@all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    
    song = self.new
    song.name=(name)
    song
      
  end


  def self.create_by_name(name)
    
    song = self.new
    song.name=(name)
    song.save
    song
      
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end



  def self.find_or_create_by_name(name)
    
    if self.find_by_name(name)
        self.find_by_name(name)
    else
        self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(artist_name_file)

    array_a_n_f = artist_name_file.split(/\.|\ - /)
    artist_cut = array_a_n_f[0]
    name_cut = array_a_n_f[1]
    file_cut = array_a_n_f[2]

    song = Song.new
    song.name = name_cut
    song.artist_name = artist_cut
    song

  end

  def self.create_from_filename(artist_name_file)

    self.new_from_filename(artist_name_file).save

  end
  
  def self.destroy_all
    self.all.clear
  end

end


#self.class.all.find{|song| song.name == @name}