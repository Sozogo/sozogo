class Users::ProjectsController < ApplicationController
  before_filter :authorize

  def index
    @projects = current_user.projects
  end

end
