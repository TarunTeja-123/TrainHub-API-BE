# frozen_string_literal: true

require 'jwt'

class ApplicationController < ActionController::API
  before_action :authenticate_request, :event_creation

  def event_creation
    Event.update_details
  end

  def authenticate_request
    token = request.headers['Authorization']&.split(' ')&.last
    return render json: { error: 'Unauthorized' }, status: :unauthorized unless token

    begin
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      @current_user = User.find(decoded_token['user_id'])
    rescue JWT::DecodeError
      render json: { error: 'Invalid token' }, status: :unauthorized
    end
  end
end
