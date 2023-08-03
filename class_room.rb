class ClassRoom
  attr_accessor :label, :students

  def initialize(lable)
    @label = lable
    @students = []
  end

  def to_hash
    {
      lable: @label,
      students: @students.map(&:to_hash)
    }
  end
end
