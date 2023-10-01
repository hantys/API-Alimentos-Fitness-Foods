require 'rails_helper'

RSpec.describe "/products", type: :request do
  let(:valid_login_headers) do
    platform = create(:platform)
    return { 'Content-Type': 'application/json', Application: platform.key }
  end

  let(:valid_attributes) do
    attributes_for(:product)
  end

  let(:invalid_attributes) do
    attributes_for(:product, product_name: nil)
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

  describe "PATCH /update" do
    it "renders a successful response" do
      product = create(:product)
      get product_url(product.code), headers: valid_login_headers, as: :json
      expect(response).to be_successful
    end

    it "updates the requested product" do
      product = create(:product)
      patch product_url(product.code),
            params: { product: { product_name: "banana" } }, headers: valid_login_headers, as: :json
      expect(response).to be_successful
      expect(JSON.parse(response.body)["product_name"]).to eq("banana")
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the product" do
        product = create(:product)
        patch product_url(product.code),
              params: {}, headers: valid_login_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(response.content_type).to match(a_string_including("application/json"))
        expect(response.body).to include_json(
          error: be_kind_of(String)
        )
      end
    end
  end

  describe "DELETE /update" do
    it "destroy the requested product" do
      product = create(:product)
      delete product_url(product.code),
             headers: valid_login_headers, as: :json
      expect(response).to have_http_status(:ok)
      product.reload
      expect(product.status).to eq('trash')
    end
  end
end
