class StudentsController < ApplicationController
  before_action :set_student, only: [ :show, :edit, :update, :destroy ]

  def index
    @students = Student.all
  end

  def show
  end

  def new
    @student = Student.new
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Student successfully created"
      redirect_to students_path
    else
      puts @student.errors.full_messages
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      flash[:success] = "Student updated successfully"
      redirect_to students_path
    else
      flash[:error] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student.destroy
    flash[:success] = "Student deleted successfully"
    redirect_to students_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :roll_no)
  end

  def set_student
    @student = Student.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    flash[:success] = error
    redirect_to students_path
  end
end
