require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class Store
  attr_accessor :rentals, :people, :books

  def initialize
    @rentals = []
    @people = []
    @books = []
    sync_persons
    sync_book
    sync_rentals
  end

  def add_person(person)
    @people << person
  end

  def add_book(book)
    @books << book
  end

  def add_rental(rental)
    @rentals << rental
  end

  def save
    rentals_json_data = JSON.generate(rentals.map(&:to_hash))
    persons_json_data = JSON.generate(people.map(&:to_hash))
    books_json_data = JSON.generate(books.map(&:to_hash))

    File.write('rentals.json', rentals_json_data)
    File.write('persons.json', persons_json_data)
    File.write('books.json', books_json_data)
    puts 'Data saved!'
  end

  private

  def sync_persons
    file_path = 'persons.json'
    begin
      data = JSON.parse(File.read(file_path))
      people_data = data.map do |person_data|
        case person_data['type']
        when 'student'
          Student.new(person_data['age'], parent_permission: person_data['parent_permission'], name: person_data['name'])
        when 'teacher'
          Teacher.new(person_data['age'], person_data['specialization'], name: person_data['name'])
        end
      end
      @people.concat(people_data)
      people_data
    rescue Errno::ENOENT => e
      puts 'I hope these is your first time. Not data are founded! feel free to create a new person'
      []
    rescue JSON::ParserError => e
      puts 'Error parsing JSON file'
      []
    end
  end

  def sync_book
    file_path = 'books.json'
    begin
      data = JSON.parse(File.read(file_path))
      books_data = data.map do |book|
        Book.new(book['title'], book['author'])
      end
      @books.concat(books_data)
    rescue Errno::ENOENT => e
      puts 'No books are found! feel free to create books in the choice option'
      []
    rescue JSON::ParserError
      puts 'error in parsing'
      []
    end
  end

  def sync_rentals
    file_path = 'rentals.json'
    begin
      data = JSON.parse(File.read(file_path))
      rentals_data = data.map do |rental|
        book = @books.find { |book| book.title == rental['book']['title'] && book.author == rental['book']['author'] }
        person = @people.find { |p| p.age == rental['person']['age'] && p.name == rental['person']['name'] }
        Rental.new(rental['date'], book, person)
      end
      @rentals.concat(rentals_data)
    rescue Errno::ENOENT => e
      puts 'No rentals are found! fell free to create new rentals in the choice option'
      []
    rescue JSON::ParserError
      puts 'Error in parsing'
      []
    end
  end
end
