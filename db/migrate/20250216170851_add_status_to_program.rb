# frozen_string_literal: true

class AddStatusToProgram < ActiveRecord::Migration[5.2]
  def change
    add_column :programs, :status, :string
    add_column :programs, :start_date, :datetime
    add_column :programs, :end_time, :datetime
  end
end
