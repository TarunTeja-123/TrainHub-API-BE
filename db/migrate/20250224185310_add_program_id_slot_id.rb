# frozen_string_literal: true

class AddProgramIdSlotId < ActiveRecord::Migration[5.2]
  def change
    add_column :slots, :program_id, :integer
  end
end
