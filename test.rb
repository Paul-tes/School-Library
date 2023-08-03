require_relative 'book'
require_relative 'person'

person = Person.new(23, name: 'Paul')
book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')

puts person.age
puts book.title
