class EmployeesController < ApplicationController
  before_action :set_employee, only: [ :show, :edit, :update, :destroy ]

  def index
    @employees = Employee.all
  end

  def show
    # @employee= Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      flash[:success] = "Employee successfully created"
      redirect_to employees_path
    else
      puts @employee.errors.full_messages
      flash[:error] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      flash[:success] = "Employee was successfully updated"
      redirect_to employees_path
    else
      flash[:error] = "Something went wrong"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy
    flash[:success] = "Employee was successfully deleted"
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound => error
    flash[:success] = error
    redirect_to employees_path
  end

  def employee_params
    params.require(:employee).permit(
      :first_name, :middle_name, :last_name,
      :email, :address, :state, :country
    )
  end
end
