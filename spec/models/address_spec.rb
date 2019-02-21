require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { FactoryBot.create(:address) }

  describe "Associations" do
    it { should have_many(:customers) }
  end

  describe "Validations" do
    it 'is valid with valid attributes' do
      expect(address).to be_valid
    end

    it 'is not valid without street' do
      address.street = nil

      expect(address).to_not be_valid
    end

    it 'is not valid without city' do
      address.city = nil

      expect(address).to_not be_valid
    end

    it 'is not valid without zip code' do
      address.zip_code = nil

      expect(address).to_not be_valid
    end
  end

end
