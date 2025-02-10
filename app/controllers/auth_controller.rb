# frozen_string_literal: true

class AuthController < ApplicationController
  require 'jwt'

  def login
    user = User.find_by(email: params[:auth][:email])
    if user&.authenticate(params[:auth][:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      render json: { token: token }
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end
end
