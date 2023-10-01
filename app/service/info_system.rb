class InfoSystem
  extend InfoModule
  def self.infos
    {
      version:,
      description:,
      status_database:,
      last_cron_jobs:,
      time_online:,
      memory_usage:
    }
  rescue StandardError
    {}
  end
end
