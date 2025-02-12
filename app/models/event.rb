# frozen_string_literal: true

require 'open-uri'
class Event < ApplicationRecord
  def self.update_details
    ip = URI.open('https://api64.ipify.org').read
    Event.create(location: Geocoder.search(ip).first.city)
  end
end
