# frozen_string_literal: true

class DeactivateExpiredProgramsJob
  include Sidekiq::Job

  def perform
    Program.where('end_time < ?', DateTime.now).update_all(status: 'Deactivated')
  end
end
