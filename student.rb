require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = nil
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
