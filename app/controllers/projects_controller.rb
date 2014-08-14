class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "You successfully created a new project"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your project. Please try again."
      redirect_to :back
    end

  end

  private
  def project_params
    params.require(:project).permit(:title, :description)
  end
end
