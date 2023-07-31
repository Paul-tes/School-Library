# This is a console app School Library that can add new students or teachers,
# add new books, and save records of who borrowed a given book and when. built with Ruby.

require_relative 'app'

def main
  app = App.new
  app.exit = false
  until app.exit
    app.display_menu
    choice = gets.chomp
    app.menu_options[choice]&.call
  end
end

main
