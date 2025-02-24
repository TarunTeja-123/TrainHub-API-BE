# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name, uniqueness: true

  has_many :slots
  has_many :roles, through: :slots
  has_many :programs, through: :slots
end
