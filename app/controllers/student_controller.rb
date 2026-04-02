class StududentsController < ApplicationController
  before_action :find_student, except: [ :index, :new, :create ]

  def index
    @students = Stududent.all
  end

  def show
  end

  def new
    @student = Stududent.new
  end

  def edit
  end

  def create
    @student = Stududent.new(params[:student])
    if @student.save
      flash[:success] = "Stududent successfully created"
      redirect_to @student
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def update
    if @student.update_attributes(params[:student])
      flash[:success] = "Stududent was successfully updated"
      redirect_to @student
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @student.destroy
      flash[:success] = "Stududent was successfully deleted"
      redirect_to @students_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @students_path
    end
  end

  private

    def find_student
      @student = Stududent.find(params[:id])
    end
end
