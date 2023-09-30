require 'rails_helper'

RSpec.describe Brand, type: :model do
  context 'Creation' do
    it 'valid?' do
      brand = build(:brand)
      expect(brand.valid?).to be true
    end

    it 'created brand' do
      expect { create(:brand) }.to change(Brand, :count).by(1)
    end

    it 'not created brand' do
      expect { create(:brand, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
  end
  # context 'Associations' do
  #   it { is_expected.to have_many(:channels).dependent(:destroy) }
  # end
end
