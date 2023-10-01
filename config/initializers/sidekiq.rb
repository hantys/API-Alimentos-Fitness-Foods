# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISTOGO_URL'] }
  config.logger.level = Logger::ERROR
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISTOGO_URL'] }
end

