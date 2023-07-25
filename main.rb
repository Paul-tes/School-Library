require_relative 'person'
require_relative 'student'
require_relative 'teacher'

# Create a Person object with default values
person1 = Person.new(25)

# Set the person's name and age using the setters
person1.name = 'Alice'
person1.age = 30

# Print the person's updated name and age
puts "Person name: #{person1.name}"
puts "Person age: #{person1.age}"

# Check if the person can use services
puts "Can person use services? #{person1.can_use_services?}"

# Create a Student object with a classroom
student1 = Student.new(18, 'Math')

# Print the student's ID, name, age, and classroom
puts "Student name: #{student1.name}"
puts "Student age: #{student1.age}"

# Check if the student can use services
puts "Can student use services? #{student1.can_use_services?}"

# Call the play_hooky method on the student
puts "Student playing hooky: #{student1.play_hooky}"

# Create a Teacher object with a specialization
teacher1 = Teacher.new(40, 'Science')

# Print the teacher's ID, name, age, and specialization
puts "Teacher name: #{teacher1.name}"
puts "Teacher age: #{teacher1.age}"

# Check if the teacher can use services
puts "Can teacher use services? #{teacher1.can_use_services?}"
