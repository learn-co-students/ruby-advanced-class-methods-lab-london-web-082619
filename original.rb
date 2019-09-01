
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

  def self.find_by_name(song_name)
    self.all.find{|s| s.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by{|s| s.name}
  end
   
  def self.new_from_filename(filename)
    parts = filename.split (" - ")
    artist_name_infile = parts[0]
    song_name_infile = parts[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name_infile
    song.artist_name = artist_name_infile
    song


  end

  def self.create_from_filename(filename)
    parts = filename.split (" - ")
    artist_name_infile = parts[0]
    song_name_infile = parts[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name_infile
    song.artist_name = artist_name_infile
    song


  end

  def self.destory_all
     self.all.clear
  end

end

Song.create_by_name("Lalala")
Song.create_by_name("TaTaTa")
Song.create_by_name("AaAaAa")
p Song.new_from_filename("Taylor Swift - Blank Space.mp3")

binding.pry
"test"