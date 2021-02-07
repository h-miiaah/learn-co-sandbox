class Dog
  # def showing_self
  #   puts self
  # end
  
  attr_accessor :name, :owner
  
  def initialize(name)
    @name = name
  end
  
  def bark
    "Woof!"
  end
  
  def get_adopted(owner_name)
    self.owner = owner_name
  end
  
end

# fido = Dog.new

# fido.showing_self

# fido.owner = "Sophie"
# fido.owner



