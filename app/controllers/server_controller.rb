class ServerController < ApplicationController
  respond_to :json

  def status
    render json: { status: "Let's roll", time: Time.now }, status: 201
  end
end
