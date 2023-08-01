require 'json'
class Store
  attr_accessor :rentals, :person, :books

  def initialize
    @rentals = []
    @person = []
    @books = []
  end

  def add_person(person)
    @person << person
    puts "#{person.name} created Successfully"
  end

  def add_book(book)
    @books << book
    puts "#{book.title} Book created successfully"
  end

  def add_rental(rental)
    @rentals << rental
    puts 'Rental created successfully'
  end

  def save
    rentals_json_data = JSON.generate(rentals.map(&:to_hash))
    persons_json_data = JSON.generate(person.map(&:to_hash))
    books_json_data = JSON.generate(books.map(&:to_hash))

    File.write('rentas.json', rentals_json_data)
    File.write('persons.json', persons_json_data)
    File.write('books.json', books_json_data)
    puts 'Data Saved!'
  end
end
