# frozen_string_literal: true

class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
end
