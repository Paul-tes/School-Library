require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
    @classroom = nil
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_hash
    {
      type: 'student',
      age: @age,
      parent_permission: @parent_permission,
      name: @name
    }
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
