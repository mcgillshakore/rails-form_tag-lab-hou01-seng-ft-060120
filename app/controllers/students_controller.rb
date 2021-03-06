class StudentsController < ApplicationController
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    if @student.valid?
        @student.save
        redirect_to students_path
    else
      redirect_to new_student_path
    end
    
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name)
  end
end
