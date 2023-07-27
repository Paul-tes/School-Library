class ClassRoom
  attr_accessor :label, :students

  def initialize(lable)
    @label = lable
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end
