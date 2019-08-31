class Person
    attr_accessor :name
    @@people = []
   
    def initialize(name)
      @name = name
      #=> @@people << self
      #Using a reader method is almost always better and more reliable than using the variable.
      self.class.all << self
    end
   
    def self.all
        @@people
    end

    def self.find_by_name(name)
        #=> Person.all.find{|person| person.name == "Sandi Metz"}
        #=> @@person.find{|person| person.name == "Sandi Metz"}
        #Using a reader method is almost always better and more reliable than using the variable.
        self.all.find{|person| person.name == name}
    end
   
  end
   
  grace_hopper = Person.new("Grace Hopper")
  sandi_metz = Person.new("Sandi Metz")
  takeshi_kimoto = Person.new("Takeshi Kimoto")
  p grace_hopper.name
  p Person.all
  p Person.find_by_name("Takeshi Kimoto")
  p Person.find_by_name("Susumu Kimoto")