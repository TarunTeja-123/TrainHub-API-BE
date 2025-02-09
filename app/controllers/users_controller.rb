# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user, only: %i[update destroy]
  skip_before_action :verify_authenticity_token
  def destroy
    if @record.destroy
      render json: { status: 'Sucesss' }
    else
      render json: { error: @record.errors.messages }
    end
  end

  def create
    user = User.new(permitted_params)
    if user.save!
      render json: { error: nil }
    else
      render json: { error: user.errors.messages }
    end
  end

  def update
    if @record.update(permitted_params)
      render json: { error: nil, status: 'updated' }
    else
      render json: { error: @record.errors.messages }
    end
  end

  def user
    @record = User.find(params[:id])
  end

  def index
    render json: { count: User.count, records: User.all }
  end

  def permitted_params
    params.require(:user).permit(:name, :password_digest, :email)
  end
end
