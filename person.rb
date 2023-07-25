class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1..10_000)
    @parent_permission = parent_permission
    @age = age
    @name = name
  end

  private

  def of_age?
    @age > 18
  end

  public

  def can_use_services?
    of_age? || @parent_permission
  end
end
