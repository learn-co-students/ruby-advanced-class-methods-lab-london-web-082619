require 'pry'

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
    @@all << song
    return song
  end 

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name (name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    elsif self.find_by_name(name)
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    name = filename.split(" - ")[1].split(".")[0]
    artist = filename.split(" - ")[0]
    song = self.create_by_name(name)
    song.artist_name = artist
    return song
    # binding.pry
  end

  def self.create_from_filename (filename)
    song = self.new_from_filename (filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
