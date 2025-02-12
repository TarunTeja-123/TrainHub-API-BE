# frozen_string_literal: true

require 'open-uri'
class Event < ApplicationRecord
  def self.update_details
    ip = URI.open('https://api64.ipify.org').read
    Event.find_or_create_by(iocaltion: Geocoder.search(ip))
  end
end
