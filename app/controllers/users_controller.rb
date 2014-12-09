class UsersController < ApplicationController
  def new
    @type = params["type"]
    @user = User.new(:type => @type )
    if volunteer?
      render "users/volunteers/new"
    elsif organization?
      render "users/organizations/new"
    end
  end

  def create
    user = get_model(params[:type])
    @user = user.new(model_params)

    if @user.save
      flash[:notice] = "Welcome to sozogo!"
      redirect_to "/"
    else
      flash[:alert] = "There was a problem creating your account. Please try again."
      @type = params[:type]
      render :action => "#{params[:type].downcase.pluralize}/new"
    end
  end

  private

  def get_model type
    return type.singularize.titleize.camelize.constantize
  end

  def model_params
    params.require(params[:type].to_sym.downcase).permit(:email, :password, :password_confirmation, :organization_name, :organization_type, :address, :first_name, :organization_contact_name, :phone_number, :last_name, :city, :type, :statement_of_beliefs, { :focus_ids => [] } )
  end

  def volunteer?
    if params["type"] == "Volunteer"
      return true
    end
  end

  def organization?
    if params["type"] == "Organization"
      return true
    end
  end
end
