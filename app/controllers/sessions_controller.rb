class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && User.authenticate(params[:email], params[:password])
      flash[:notice] = "You've been logged in."
      log_in(user)
      redirect_to "/"
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been logged out successfully."
    redirect_to "/"
  end
end

