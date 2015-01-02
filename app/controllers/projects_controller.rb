class ProjectsController < ApplicationController
  before_filter :authorize, only: :new
  before_filter(only: [:new, :create]) { |c| c.organization_only "Sorry, you must be registered as an organization to create new projects" }

  def new
    @project = Project.new
    @attributes = ProjectAttribute.all
  end

  def index
    @projects = Project.all.order(:start_date)
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    @project.save_start_date(params)
    unless params["project"]["recurring_rules_attribute"] == "null"
      @project.save_schedule(params["project"]["recurring_rules_attribute"])
    end

    if @project.save
      flash[:notice] = "You successfully created a new project"
      redirect_to @project
    else
      flash[:alert] = "There was a problem creating your project. Please try again."
      render "new"
    end

  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :month, :day, :year, :start_time, :end_time, :number_of_volunteers_needed, :recurring_rules_attribute, :focus_id, :volunteer_instructions,
    { :project_attribute_ids => [], :profession_ids => [] } )
  end
end
