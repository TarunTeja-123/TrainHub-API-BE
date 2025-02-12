# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
  before_action :event_creation
  def event_creation
    Event.update_details
  end
end
