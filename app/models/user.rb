# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, uniqueness: true
  has_paper_trail
  has_many :roles
end
