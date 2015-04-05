class ProjectsController < ApplicationController
  before_filter :authorize, only: :new
  before_filter :set_project, only: [:edit, :show, :update] 
  before_filter(only: [:new, :create]) { |c| c.organization_only "Sorry, you must be registered as an organization to create new projects" }

  def new
    @project = Project.new
    @attributes = ProjectAttribute.all
  end

  def index
    default_radius = "10"
    if params[:zipcode].present?
      @projects = Project.future.near(params[:zipcode], default_radius)
    else
      @projects = Project.future
    end
  end

  def edit
    if current_user.id == @project.user.id
      render "edit"
    else
      redirect_to projects_url
    end
  end

  def show
    @signup = Signup.new
  end

  def update
    if current_user.id == @project.user.id
      @project.save_start_date(params)
      if @project.update(project_params)
        flash[:notice] = "You successfully updated your project!"
      else
        flash[:notice] = "Hmm. Something went wrong. Your project was not updated."
      end
    end
    redirect_to @project
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to users_projects_url(current_user)
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

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :month, :day, :year, :start_time, :end_time, :number_of_volunteers_needed, :recurring_rules_attribute, :focus_id, :volunteer_instructions, :address, :city, :state, :zipcode,
    { :project_attribute_ids => [], :profession_ids => [] } )
  end
end
