require_relative 'store'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'

class App
  attr_accessor :store

  def initialize
    @store = Store.new
  end

  def run
    @exit = false
    until @exit
      display_menu
      choice = gets.chomp
      menu_options[choice]&.call || puts('Invalid input. Please try again')
    end
  end

  private

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

  def all_books
    @store.books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  def all_peoples
    puts 'peoples'
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
    'create rental'
  end

  def get_rental_for_person(id)
    puts "rentals with id #{id}"
  end

  def exit_app?
    puts 'Exiting app ....'
    @exit = true
  end

  def menu_options
    {
      '1' => method(:all_books),
      '2' => method(:all_peoples),
      '3' => method(:create_person),
      '4' => method(:create_book),
      '5' => method(:create_rental),
      '6' => -> { get_rental_for_person(gets.chomp) },
      '7' => method(:exit_app?)
    }
  end
end
