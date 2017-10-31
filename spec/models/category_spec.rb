require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'factories' do
    subject { build :category }
    it { should be_valid }
  end

  describe 'validation' do
    it { should validate_presence_of(:external_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:name_path) }
    it { should validate_presence_of(:id_path) }
    # it { should validate_presence_of(:industry) }
  end
end

