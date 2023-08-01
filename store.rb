require 'json'
require_relative 'student'
require_relative 'teacher'

class Store
  attr_accessor :rentals, :people, :books

  def initialize
    @rentals = []
    @people = []
    @books = []
    sync_persons
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
    rescue JSON::ParserError
      puts 'Error parsing JSON file'
      data = []
    end
  end
  
  def sync_book
    file_path = 'books.json'
  end
end
