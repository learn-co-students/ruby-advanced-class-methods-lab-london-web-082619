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

  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    song 
  end

  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save
    song 
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end 

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    end 

  def self.alphabetical
    self.all.sort_by{|x| x.name}
  end 

  def self.new_from_filename(file)
    song = self.new 
    a = file.split(/[\.-]/)
    song.name = a[1].strip 
    song.artist_name = a[0].strip 
    song 
  end 

  def self.create_from_filename(file)
    song = self.new 
      a = file.split(/[\.-]/)
      song.name = a[1].strip 
      song.artist_name = a[0].strip 
      song.save 
      song 
   end 
  
   def self.destroy_all 
    @@all.clear 
  end 
  
      




end 