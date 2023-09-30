require 'rails_helper'

RSpec.describe Category, type: :model do
  context "Creation" do
    it 'valid?' do
      category = build(:category)
      expect(category.valid?).to be true
    end

    it "created category" do
      expect { create(:category) }.to change(Category, :count).by(1)
    end

    it "not created category" do
      expect { create(:category, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
  end
  # context 'Associations' do
  #   it { is_expected.to have_many(:channels).dependent(:destroy) }
  # end
end
