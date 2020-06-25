class InstructorsController < ApplicationController
  before_action :find_instructor, only: [:show]

  def index
    @instructors = Instructor.all
  end

  def show()
  end

  private

  def find_instructor()
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params()
    params.require(:instructor).permit(:name)
  end
end
