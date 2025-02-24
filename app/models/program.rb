# frozen_string_literal: true

class Program < ApplicationRecord
  validates :name, uniqueness: true
  has_many :slots
  has_many :users, through: :slots
  has_many :roles, through: :slots
  scope :active_records, -> { where.not(status: 'Deactivated') }
end
