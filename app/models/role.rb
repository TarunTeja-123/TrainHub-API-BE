# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, uniqueness: true
  has_many :slots
  has_many :users, through: :slots
  has_many :programs, through: :slots
end
