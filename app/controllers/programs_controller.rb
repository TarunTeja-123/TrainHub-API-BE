# frozen_string_literal: true

class ProgramsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :record, only: %i[update destroy]

  def index
    programs = Program.all.order(id: :asc)
    render json: { records: programs }
  end

  def create
    program = Program.new(permitted_params)
    if program.save
      render json: { status: 'created', program: program }
    else
      render json: { status: 'failed', errors: program.errors.full_messages }
    end
  end

  def update
    if @record.update(permitted_params)
      render json: { errors: nil, status: 'created' }
    else
      render json: { errors: @record.errors.full_messages, status: 'failed' }
    end
  end

  def destroy
    if @record.destroy
      render json: { status: 'deleted' }
    else
      render json: { status: 'failed', error: @record.errors.full_messages }
    end
  end

  def record
    @record = Program.find_by(id: params[:id])
  end

  def permitted_params
    params.require(:program).permit(:id, :user_id, :name, registered_users: [])
  end
end
