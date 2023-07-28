class App
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
    'books'
  end

  def all_peoples
    'peoples'
  end

  def create_person
    'teacher or student'
  end

  def create_book
    'create books'
  end

  def create_rental
    'create rental'
  end

  def get_rental_for_person(id)
    "rentals with id #{id}"
  end

  def exit_app?
    puts 'Exiting app ....'
    @exit = true
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
