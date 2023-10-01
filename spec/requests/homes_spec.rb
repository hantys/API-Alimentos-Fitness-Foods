require 'rails_helper'

RSpec.describe "/homes", type: :request do
  let(:valid_login_headers) do
    platform = create(:platform)
    return { 'Content-Type': 'application/json', Application: platform.key }
  end

  describe "GET /homes" do
    it "renders a successful response" do
      get root_url, headers: valid_login_headers, as: :json
      expect(response).to be_successful
    end

    it "renders a failured response" do
      allow(InfoSystem).to receive(:infos).and_raise(StandardError.new("Error"))

      get root_url, headers: valid_login_headers, as: :json
      expect(response).to have_http_status(:bad_request)
    end
  end
end
