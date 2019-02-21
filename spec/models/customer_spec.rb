require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:customer) { FactoryBot.create(:customer) }

  describe "Associations" do
    it { should belong_to(:address) }
  end

  describe "Validations" do
    it 'is valid with valid attributes' do
      expect(customer).to be_valid
    end

    it 'is not valid without name' do
      customer.name = nil

      expect(customer).to_not be_valid
    end
  end

  describe "Scope" do
    before do
      FactoryBot.create_list(:customer, 3)
    end

    it 'applies name scope' do
      name = Customer.first.name
      customers = Customer.by_name(name)
      expect(customers).to include(Customer.first)
    end

    it 'applies street scope' do
      street = Customer.first.address.street
      customers = Customer.by_street(street)
      expect(customers).to include(Customer.first)
    end
  end
end
