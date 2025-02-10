# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, uniqueness: true
  belongs_to :user
end
