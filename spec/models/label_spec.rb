require 'rails_helper'

RSpec.describe Label, type: :model do
  context 'Creation' do
    it 'valid?' do
      label = build(:label)
      expect(label.valid?).to be true
    end

    it 'created label' do
      expect { create(:label) }.to change(Label, :count).by(1)
    end

    it 'not created label' do
      expect { create(:label, name: '') }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
  end
  # context 'Associations' do
  #   it { is_expected.to have_many(:channels).dependent(:destroy) }
  # end
end
