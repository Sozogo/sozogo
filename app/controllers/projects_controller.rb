class ProjectsController < ApplicationController
  before_filter :authorize, :only => :new

  def new
    @project = Project.new
    @attributes = ProjectAttribute.all
  end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.save_start_date(params)
    unless params["project"]["recurring_rules_attribute"] == "null"
      @project.save_schedule(params["project"]["recurring_rules_attribute"])
    end

    if @project.save!
      flash[:notice] = "You successfully created a new project"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your project. Please try again."
      redirect_to :back
    end

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :month, :day, :year, :start_time, :end_time, :number_of_volunteers_needed, :recurring_rules_attribute, :focus_id, :project_attribute_ids => [])
  end
end
