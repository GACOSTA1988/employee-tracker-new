class EmployeesController < ApplicationController

  def index
    if params[:search]
      @employees = Employee.search(params[:search])
    else params[:id]
    @employees = Employee.all
    render :index
  end
end

  def new
    @employee = Employee.new
    render :new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee successfully added!"
      redirect_to employees_path
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    render :edit
  end

  def show
      @employee = Employee.find(params[:id])
    render :show
  end

  def update
    @employee= Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  private
  def employee_params
    params.require(:employee).permit(:name)
  end

end
