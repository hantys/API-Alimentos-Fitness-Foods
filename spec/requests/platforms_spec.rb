require 'rails_helper'

RSpec.describe "/platforms", type: :request do
  let(:valid_attributes) do
    attributes_for(:platform)
  end

  let(:invalid_attributes) do
    attributes_for(:platform, name: nil)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get platforms_url as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Platform" do
        expect do
          post platforms_url,
               params: { platform: valid_attributes }, as: :json
        end.to change(Platform, :count).by(1)
      end

      it "renders a JSON response with the new platform" do
        post platforms_url,
             params: { platform: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Platform" do
        expect do
          post platforms_url,
               params: { platform: invalid_attributes }, as: :json
        end.to change(Platform, :count).by(0)
      end

      it "renders a JSON response with errors for the new platform" do
        post platforms_url,
             params: { platform: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested platform" do
      platform = create(:platform)
      expect do
        delete platform_url(platform), as: :json
      end.to change(Platform, :count).by(-1)
    end
  end
end
