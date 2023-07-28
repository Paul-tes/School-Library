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
end
