class InstructorsController < ApplicationController
  before_action :find_instructor, only: [:show]

  def index
    @instructors = Instructor.all
  end

  def show()
    @sorted_students = @instructor.students.sort_by(&:name)
    @avg = average_age()
  end

  private

  def find_instructor()
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params()
    params.require(:instructor).permit(:name)
  end

  def average_age()
    return 0 if @sorted_students.empty?
    total_age = @sorted_students.map(&:age).sum()
    total_age.to_f/@sorted_students.count()
  end
end
