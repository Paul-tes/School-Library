class ClassRoom
  attr_accessor :label, :students

  def initialize(lable)
    @label = lable
    @students = []
  end

  def to_hash
    {
      lable: @lable,
      students: @students.map(&:to_hash)
    }
  end
end
