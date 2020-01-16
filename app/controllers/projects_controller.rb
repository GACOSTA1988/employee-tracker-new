class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    render :index
  end

  def new
    @employee = Employee.find(params[:employee_id])
    @project = @employee.projects.new
    render :new
  end

  def create
    @employee = Employee.find(params[:employee_id])
    @project = @employee.projects.new(project_params)
    if @project.save
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:id])
    render :edit
  end

  def show
    @employee = Employee.find(params[:employee_id])
    @project = Project.find(params[:id])
    render :show
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to employee_path(@project.employee)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to employee_path(@project.employee)
  end

  private
  def project_params
    params.require(:project).permit(:name)
  end

end
