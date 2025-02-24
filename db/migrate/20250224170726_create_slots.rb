# frozen_string_literal: true

class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.datetime :sheduled_date
      t.integer :user_id
      t.integer :role_id
      t.timestamps
    end
  end
end
