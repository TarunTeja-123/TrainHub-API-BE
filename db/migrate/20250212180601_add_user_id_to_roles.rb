# frozen_string_literal: true

class AddUserIdToRoles < ActiveRecord::Migration[5.2]
  def change
    add_reference :roles, :user, foreign_key: true
  end
end
