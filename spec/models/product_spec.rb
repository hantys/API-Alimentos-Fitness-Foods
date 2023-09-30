require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'Creation' do
    it 'valid?' do
      product = build(:product)
      expect(product.valid?).to be true
    end

    it 'created product' do
      expect { create(:product) }.to change(Product, :count).by(1)
    end

    it 'not created product' do
      expect { create(:product, product_name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'Validates' do
    it { is_expected.to validate_presence_of(:product_name) }
  end
  # context 'Associations' do
  #   it { is_expected.to have_many(:channels).dependent(:destroy) }
  # end
end
