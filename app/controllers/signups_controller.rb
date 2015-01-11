class SignupsController < ApplicationController
  def create
    @signup = Signup.new(signup_params)

    respond_to do |format|
      if @signup.save
        format.html { redirect_to @signup.project, notice: 'You were successfully signed up for this project.' }
        format.js   {}
        format.json { render json: @signup, status: :created, location: @signup.project }
      else
        format.html { render action: "new" }
        format.json { render json: @signup.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def signup_params
    params.require(:signup).permit(:project_id, :user_id)
  end
end
