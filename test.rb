require 'json'

class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def to_hash
    {
      name: @name,
      age: @age
    }
  end
end

# Create an array of objects
people = []
3.times do
  people << Person.new("John", 30)
  people << Person.new("Jane", 25)
end

# Convert the array to JSON data
json_data = JSON.generate(people.map(&:to_hash))

# Write the JSON data to a file
File.write("people.json", json_data)
