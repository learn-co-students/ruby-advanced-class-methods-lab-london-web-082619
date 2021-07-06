require 'pry'

class Book
  
  attr_accessor :title, :genre
  
  GENRES = []
  @@books = []

  def initialize(title, genre)
    @title = title
    self.class.all << self #why only the title goes in? I guesses the genre also goes in.
    #self.class.all << title makes all sense to me
    GENRES << genre
    
  end

  def self.all
    @@books
     #GENRES
  end


def show_all
    puts @@books
    puts GENRES
  end
  
end

takeshi = Book.new("Takeshi", "Comedy")
etsu = Book.new("Etsu", "Hisrory")

 takeshi.show_all

 binding.pry
 "test"