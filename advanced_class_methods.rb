class Song

  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def self.all
    @@all
  end
    
end

######################################################

class Person
  attr_accessor :name
  @@people = []
  
  def initialize(name)
    @name = name
    # self in the initialize method is our new instance.
    # self.class is Person.
    # self.class.all == Person.all.
    self.class.all << self
  end
  
  def self.all # class reader method (it reads the class variable making it accessible)
    @@people
  end
  
  def self.find_by_name(name) # finder class method (it finds instances based on some property or condition)
    self.all.find{|person| person.name == name} # using the self.all class method to search the @@people class variable for a person with a specific name.
  end
  
end