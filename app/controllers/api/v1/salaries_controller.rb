class Api::V1::SalariesController < ApplicationController
  before_action :set_salary, only: [:show, :update, :destroy]

  # GET /salaries
  def index
    @salaries = Salary.all

    render json: @salaries
  end

  # GET /salaries/1
  def show
    render json: @salary
  end
  
 private
  def get_salarydata
     sal=params.permit(:employee_id)
     employee_id = sal["employee_id"]
     empsal=Salary.find_by(employee_id: employee_id)    
     actua_salary= empsal.actual_salary
     puts s;
     emplea=Attendance.find_by(employee_id: employee_id)
    
     leave=emplea.leave
     perday=empsal.current_salary/30
     salary=empsal.current_salary-(perday*leave)
    render json: salary
  end
  private
  def get_paidemployee
     sa=params.permit(:employee_id)
     sal=Salary.maximum(:current_salary)
     empid=Salary.find_by(current_salary: sal)
     name1=Employee.find_by(id: empid.employee_id)  
     employee=name1.name   
     render json: name1
  end
  private
  def get_paidemployee1

    sa=params.permit(:employee_id)
    salary=Salary.sum(:actual_salary)
    employ=Employee.count(:id)
    cmp=salary/employ
    render json: cmp

  end
  private
  def percost
    sa=params.permit(:employee_id)
    employ=Employee.count(:id)
    salary=Salary.sum(:actual_salary)
    reimburse=Reimbursement.sum(:cost)
    epercost=(salary+reimburse)/employ
    render json: epercost
  end

  # POST /salaries
  private
  def create
    @salary = Salary.new(salary_params)
    @emp=@salary.employee_id;
    @esalary=Salary.find_by(employee_id: @emp)  
    
      render json: @esalary
      
      # render json: @salary.errors, status: :unprocessable_entity
    
  end

  # # PATCH/PUT /salaries/1
  # def update
  #   if @salary.update(salary_params)
  #     render json: @salary
  #   else
  #     render json: @salary.errors, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /salaries/1
  # def destroy
  #   @salary.destroy
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_salary
  #     @salary = Salary.find(params[:id])
  #   end

    # Only allow a trusted parameter "white list" through.
    def salary_params
      params.require(:salary).permit(:actual_salary, :current_salary, :employee_id)
    end
end
