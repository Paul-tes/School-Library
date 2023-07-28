class App
  def menue
    puts 'Welcome to School library App!'
    puts
    puts 'please choose an option by enterin a number: '
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

  def create_preson
    'teacher or student'
  end

  def create_book
    'create books'
  end

  def create_rental
    'create rental'
  end

  def get_rental(id)
    'retals with id'
  end

  def run
    loop do
      puts menue
      order = gets.chomp
      break if order == '7'
    end
  end
end
