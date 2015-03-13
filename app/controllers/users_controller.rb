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
    if volunteer?
      @user.set_birthday(params)
    end

    if @user.save
      @user = User.authenticate(@user.email, @user.password)
      if @user
        flash[:notice] = "Welcome to SozoGo!"
        session[:user_id] = @user.id
      end
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
    params.require(params[:type].to_sym.downcase).permit(:email, :password, :password_confirmation, :organization_name, :organization_type, :address, :first_name, :organization_contact_name, :phone_number, :last_name, :city, :type, :statement_of_beliefs, :denomination, :pastor, :service_times, :congregation_size, :church_statement, :birth_year, :shirt_size, :birth_month, :birth_day, :zipcode, :state, { :focus_ids => [] }, { :language_ids => [] } )
  end

  def volunteer?
    params["type"] == "Volunteer"
  end

  def organization?
    params["type"] == "Organization"
  end
end
