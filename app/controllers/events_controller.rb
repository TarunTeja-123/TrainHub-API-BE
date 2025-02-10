# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    render json: { records: Event.all, count: Event.count }
  end
end
