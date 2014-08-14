class SessionsController < ApplicationController
  def new
  end

  def create
    @church = Church.authenticate(params[:email], params[:password])
    if @church
      flash[:notice] = "You've been logged in."
      session[:church_id] = @church.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:church_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end
end

