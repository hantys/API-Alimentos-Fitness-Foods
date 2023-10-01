require 'rails_helper'

RSpec.describe Platform, type: :model do
  context "Creation" do
    it "created platform" do
      expect { create(:platform).to equal(true) }
    end

    it "not created platform" do
      platform = build(:platform, name: nil)
      expect { platform.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'Validates' do
    it { is_expected.to validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context 'Required Columns and Indexs' do
    it { is_expected.to have_db_column(:secret) }
    it { is_expected.to have_db_index(:secret) }
  end

  context 'Instance Methods' do
    it 'generate_key is key not nil' do
      platform = build(:platform)
      platform.save
      expect(platform.key).to be_kind_of(String)
      expect(platform.secret).to be_kind_of(String)
    end
    it 'generate_key' do
      platform = build(:platform)

      expect(platform).to receive(:generate_key)
      platform.save
    end

    it 'generate_secret' do
      platform = build(:platform)
      platform.send(:generate_secret)
      expect(platform.secret).to be_kind_of(String)
    end
  end
end
