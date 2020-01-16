class DivisionsController < ApplicationController

  def index
    # Code for listing all employees goes here.
  end

  def new
    @employee = Employee.find(params[:employee_id])
    @division = @employee.divisions.new
    render :new
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @division = @employee.divisions.new(division_params)
    if @division.save
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end



  def edit
  @employee = Employee.find(params[:employee_id])
  @division = Division.find(params[:id])
  render :edit
end

  def show
    @employee = Employee.find(params[:employee_id])
    @division = Division.find(params[:id])
    render :show
  end

  def update
  @division = Division.find(params[:id])
  if @division.update(division_params)
    redirect_to employee_path(@division.employee)
  else
    render :edit
  end
end

def destroy
  @division = Division.find(params[:id])
  @division.destroy
  redirect_to employee_path(@division.employee)
end

  private
    def division_params
      params.require(:division).permit(:name)
    end

end
