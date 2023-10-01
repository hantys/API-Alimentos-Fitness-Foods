require 'rails_helper'

RSpec.describe InfoSystem, type: :service do
  describe "#Return system infos" do
    it "verify key infos" do
      infos = InfoSystem.infos

      expect(infos).to have_key(:version)
      expect(infos).to have_key(:description)
      expect(infos).to have_key(:status_database)
      expect(infos).to have_key(:last_cron_jobs)
      expect(infos).to have_key(:time_online)
      expect(infos).to have_key(:memory_usage)
    end

    it "error in key infos" do
      allow(InfoSystem).to receive(:infos).and_raise(StandardError.new("Error"))

      expect { InfoSystem.infos }.to raise_error(StandardError, "Error")
    end
  end
end
