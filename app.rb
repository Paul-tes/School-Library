require_relative 'store'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :store, :exit

  def initialize
    @store = Store.new
  end

  def display_menu
    puts 'Welcome to School library App!'
    puts
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end

  def menu_options
    {
      '1' => method(:all_books),
      '2' => method(:all_peoples),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => method(:rental_for_person),
      '7' => method(:exit_app?)
    }
  end

  private

  def all_books
    @store.books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def all_peoples
    puts 'peoples'
    @store.people.each do |person|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "[#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}]"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [input the number]: '
    choice = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case choice
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase == 'y'
      person = Student.new(age, parent_permission: permission, name: name)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name: name)
    else
      puts 'Invalid choice'
      return
    end
    @store.add_person(person)
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @store.add_book(book)
  end

  def create_rental
    puts 'Select a book from the following lists by number'
    @store.books.each_with_index do |book, index|
      puts "#{index + 1}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book = @store.books[gets.chomp.to_i - 1]

    puts 'Select a person from the following list by number (not by id)'
    @store.person.each_with_index do |person, index|
      type = person.is_a?(Student) ? 'Student' : 'Teacher'
      puts "#{index + 1}) [#{type}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}]"
    end
    person = @store.person[gets.chomp.to_i - 1]

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, book, person)
    @store.add_rental(rental)
  end

  def rental_for_person
    puts 'ID of person: '
    id = gets.chomp.to_i
    rentals = @store.rentals.select { |rent| rent.person.id == id }

    rentals.each do |r|
      puts "Date: #{r.date}, Book #{r.book.title} by #{r.book.author}"
    end
  end

  def exit_app?
    @store.save
    puts 'Thank you for using this app!'
    @exit = true
  end
end
