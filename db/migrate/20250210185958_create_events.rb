# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :ip
      t.integer :count
      t.integer :user_id

      t.timestamps
    end
  end
end
