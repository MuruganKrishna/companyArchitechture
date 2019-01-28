class Api::V1::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :update, :destroy]

  # GET /employees
  def index
    @employees = Employee.all

    render json: @employees
  end

  # GET /employees/1
  def show
    render json: @employee
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    @empid=Employee.find_by(name: @employee)
    @sa=Salary.find_by(employee_id: @empid.id)
       render json: @sa.actual_salary
  end
  def showname
     name=params.permit(:name)   
     render json: {message: "successfull"}  
  end

  # # PATCH/PUT /employees/1
  # def update
  #   if @employee.update(employee_params)
  #     render json: @employee
  #   else
  #     render json: @employee.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /employees/1
  # def destroy
  #   @employee.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_employee
  #     @employee = Employee.find(params[:id])
  #   end

    # Only allow a trusted parameter "white list" through.
    def employee_params
      params.require(:employee).permit(:name, :e_mail, :designation, :company_id)
    end
end
