class ChurchesController < ApplicationController
  def new
  end

  def create
    @church = Church.new(church_params)
    if @church.save
      flash[:notice] = "Welcome to sozogo!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      redirect_to :back
    end
  end

  private

  def church_params
    params.require(:church).permit(:email, :password, :password_confirmation)
  end
end
