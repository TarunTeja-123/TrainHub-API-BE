# frozen_string_literal: true

class Program < ApplicationRecord
  validates :name, uniqueness: true
end
