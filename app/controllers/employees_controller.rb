class EmployeesController < ApplicationController
  before_action :find_user, except: [ :index, :new, :create ]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employees = Employee.new
  end

  def edit
  end

  def create
    @employees = Employee.new(params[:user])
    if @employees.save
      flash[:success] = "Employee successfully created"
      redirect_to @employees
    else
      flash[:error] = "Something went wrong"
      render "new"
    end
  end

  def update
    if @employees.update_attributes(params[:user])
      flash[:success] = "Employee was successfully updated"
      redirect_to @employees
    else
      flash[:error] = "Something went wrong"
      render "edit"
    end
  end

  def destroy
    if @employees.destroy
      flash[:success] = "Employee was successfully deleted"
      redirect_to @employees_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @employees_path
    end
  end

  private

    def find_user
      @employees = Employee.find(params[:id])
    end
end
