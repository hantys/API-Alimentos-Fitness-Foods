require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'Creation' do
    it 'valid?' do
      store = build(:store)
      expect(store.valid?).to be true
    end

    it 'created store' do
      expect { create(:store) }.to change(Store, :count).by(1)
    end

    it 'not created store' do
      expect { create(:store, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
  end
  # context 'Associations' do
  #   it { is_expected.to have_many(:channels).dependent(:destroy) }
  # end
end
