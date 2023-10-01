require 'rails_helper'

RSpec.describe "/products", type: :request do
  let(:valid_login_headers) do
    platform = create(:platform)
    return { 'Content-Type': 'application/json', Application: platform.key }
  end

  describe "GET /index" do
    it "renders a successful response" do
      get products_url, headers: valid_login_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      product = create(:product)
      get product_url(product.code), headers: valid_login_headers, as: :json
      expect(response).to be_successful
    end
  end
end
