require_relative 'person'

class Teacher < Person
  def initialize(age, specialization, name: 'Unknown')
    super(age, parent_permission: true, name: name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_hash
    {
      type: 'teacher',
      age: @age,
      specialization: @specialization,
      name: @name
    }
  end
end
