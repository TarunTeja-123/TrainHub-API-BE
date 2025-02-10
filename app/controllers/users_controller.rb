# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user, only: %i[update destroy]

  def destroy
    if @record.destroy
      render json: { status: 'Sucesss' }
    else
      render json: { error: @record.errors.messages }
    end
  end

  def create
    user = User.new(permitted_params)
    if user.save
      render json: { error: nil }
    else
      render json: { error: user.errors.full_messages, status: 'failed' }
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

  def search
    records = User.where('LOWER(name) LIKE ?', "%#{params[:name].downcase}%")
    render json: { data: records }
  end

  private

  def permitted_params
    params.require(:user).permit(:name, :password_digest, :email)
  end
end
