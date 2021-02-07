# class Person
#   attr_accessor :name, :age, :company


# # rows = csv_data.split("\n")
# # people = rows.collect do |row|
# #   data = row.split(", ")
# #   name = data[0]
# #   age = data[1]
# #   company = data[2]
# #   person = Person.new
# #   person.name = name
# #   person.age = age
# #   person.company = company
# #   person

#   def self.new_from_csv(csv_data)
#     rows = csv_data.split("\n")
#     people = rows.collect do |row|
#       data = row.split(", ")
#       name = data[0]
#       age = data[1]
#       company = data[2]
      
#       person = self.new # this is an important line.
#       person.name = name
#       person.age = age
#       person.company = company
#       person
#     end
#     people
#   end
  
  
# csv_data = "Elon Musk, 45, Tesla
# Mark Zuckerberg, 32, Facebook
# Martha Stewart, 74, MSL"

# people = Person.new_from_csv(csv_data)
# people

  
# new_csv_data = "Avi Flombaum, 31, Flatiron School
# Payal Kadakia, 30, ClassPass"

# people << Person.new_from_csv(new_csv_data)
# people.flatten
# people
  
# end
  
############################################################




class Person
  attr_accessor :name, :age, :company
 
  def self.new_from_csv(csv_data)
    rows = csv_data.split("\n")
    people = rows.collect do |row|
      data = row.split(", ")
      name = data[0]
      age = data[1]
      company = data[2]
 
      person = self.new # This is an important line.
      person.name = name
      person.age = age
      person.company = company
      person
    end
    people
  end
end
 
csv_data = "Elon Musk, 45, Tesla
Mark Zuckerberg, 32, Facebook
Martha Stewart, 74, MSL"
 
people = Person.new_from_csv(csv_data)
people #=> [
  #<Person @name="Elon Musk"...>,
  #<Person @name="Mark Zuckerberg"...>,
  # ...
# ]
 
new_csv_data = "Avi Flombaum, 31, Flatiron School
Payal Kadakia, 30, ClassPass"
 
people << Person.new_from_csv(new_csv_data)
people.flatten
people #=> [
#<Person @name="Elon Musk"...>,
#<Person @name="Mark Zuckerberg"...>
#<Person @name="Martha Stewart"...>,
#<Person @name="Avi Flombaum"...>,
#<Person @name="Payal Kadakia"...>
# ]
  
  
  
  