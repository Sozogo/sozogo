class ProjectsController < ApplicationController
  before_filter :authorize, :only => :new

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
    @project.start_date = DateTime.civil(params["project"]["year"].to_i, params["project"]["month"].to_i, params["project"]["day"].to_i)

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
    params.require(:project).permit(:title, :description, :month, :day, :year)
  end
end
