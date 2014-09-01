class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_church
    @current_church ||= Church.find(session[:church_id]) if session[:church_id]
  end

  def authorize
    unless current_church != nil
      flash[:notice] = "You need to be signed in first."
      redirect_to "/"
    end
  end

  helper_method :current_church
end
