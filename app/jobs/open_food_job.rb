class OpenFoodJob < ApplicationJob
  queue_as :default

  def perform
    Rails.cache.write('last_job_time', Time.now)
  end
end
