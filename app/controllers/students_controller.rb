class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update]
  before_action :find_instructors, only:[:new, :edit]
  def index
    @students = Student.all
  end

  def show()
  end

  def new()
    @student = Student.new()
  end

  def create()
    @student = Student.new(student_params)
    validate(instructor_path(@student.instructor), new_student_path)
  end

  def edit()
  end

  def update()
    @student.update(student_params)
    validate(student_path(@student), edit_student_path(@student))
  end

  private

  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end

  def find_student()
    @student = Student.find(params[:id])
  end

   def find_instructors()
    @instructors = Instructor.all
  end

  def validate(valid_path, error_path)
    if @student.valid?
      @student.save()
      redirect_to valid_path
    else 
      flash[:errors] = @student.errors.full_messages
      redirect_to error_path
    end
  end
  
end
