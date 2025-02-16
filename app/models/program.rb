# frozen_string_literal: true

class Program < ApplicationRecord
  validates :name, uniqueness: true

  scope :active_records, -> { where.not(status: 'Deactivated') }
end
