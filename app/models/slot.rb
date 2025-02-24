# frozen_string_literal: true

class Slot < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :program
end
