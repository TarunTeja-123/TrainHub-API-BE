# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :record, only: %i[update destroy]

  def create
    role = Role.new(permitted_params)
    if role.save
      render json: { error: role.errors, status: 'created' }
    else
      render json: { error: role.errors.full_messages, status: 'failed' }
    end
  end

  def update
    if @role.update(permitted_params)
      render json: { error: @role.errors, status: 'updated' }
    else
      render json: { error: @role.errors.full_messages, status: 'updation failed' }
    end
  end

  def record
    @role = Role.find_by(id: params[:id])
  end

  def index
    render json: { roles: Role.all }
  end

  def search
    records = Role.where('LOWER(name) LIKE ?', "%#{params[:name].downcase}%")

    render json: [data: records]
  end

  def destroy
    if @role.destroy!
      render json: { status: 'deleted' }
    else
      render json: { errors: @role.errros.full_messages }
    end
  end

  def permitted_params
    params.require(:role).permit(:name, :id, :exp, :user_id)
  end
end
