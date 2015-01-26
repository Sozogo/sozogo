class HomeController < ApplicationController
  def index
    @user = current_user || nil
  end

  def about
  end

  def signup
  end

  def donate
  end
end
