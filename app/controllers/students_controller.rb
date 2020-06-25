class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
  def index
    @students = Student.all
  end

  def show()
    @instructor = @student.instructor
  end

  def new()
    @student = Student.new()
    @instructors = Instructor.all()
  end

  def create()
    @student = Student.new(student_params)

    if @student.valid?
      @student.save()
      redirect_to instructor_path(find_instructor())
    else
      flash[:errors] = @student.errors.full_messages
      redirect_to new_student_path
    end
  end

  def edit()
    @instructors = Instructor.all
  end

  def update()
    @student.update(student_params)
    if @student.valid?
      redirect_to student_path(@student)
    else 
      redirect_to edit_student_path(@student)
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end

  def find_student()
    @student = Student.find(params[:id])
  end

  def find_instructor()
    Instructor.find(@student.instructor_id)
  end
  
end
