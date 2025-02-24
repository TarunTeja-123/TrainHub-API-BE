# frozen_string_literal: true

class SlotsController < ApplicationController
  def create
    record = Slot.new(permitted_params)
    if record.save
      render json: { status: 'sucesses', record: record }
    else
      render json: { status: 'failed', errros: record.errors.full_messages }
    end
  end

  def permitted_params
    params.require(:slot).permit(:user_id, :role_id, :sheduled_date, :program_id)
  end

  def upcoming
    Slots.where('sheduled_date< ?', DateTime.now)
  end
end
