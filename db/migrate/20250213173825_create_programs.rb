# frozen_string_literal: true

class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :name
      t.decimal :price
      t.integer :user_id
      t.string :registered_users, array: true, default: []
      t.timestamps
    end
  end
end
