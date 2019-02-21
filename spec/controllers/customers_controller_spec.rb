require "rails_helper"

describe Api::V1::CustomersController , :type => :api do

  let!(:customer) { FactoryBot.create(:customer) }

  describe 'Authorization' do
    it "making a request without access token " do
      get 'api/v1/customers'
      expect(last_response.status).to eql(401)
    end

    it "making a request with access token " do
      get 'api/v1/customers', {}, {'HTTP_TOKEN' => customer.access_token}
      expect(last_response.status).to eql(200)
    end
  end

  describe "Filters" do
    it "request for name filter" do
      get 'api/v1/customers', {name: customer.name}, {'HTTP_TOKEN' => customer.access_token}
      response = JSON.parse(last_response.body)
      expect(last_response.status).to eql(200)
      expect(response.first['name']).to eql(customer.name)
    end

    it "request for street filter" do
      get 'api/v1/customers', {street: customer.address.street}, {'HTTP_TOKEN' => customer.access_token}
      response = JSON.parse(last_response.body)
      expect(last_response.status).to eql(200)
      expect(response.first['id']).to eql(customer.id)
    end
  end

  describe 'Create customer' do
    let(:address) {FactoryBot.create(:address)}
    it 'create customer' do
      post 'api/v1/customers', {customer: {name: 'Test name', address_id: address.id}}
      response = JSON.parse(last_response.body)
      expect(last_response.status).to eql(201)
      expect(response['name']).to eql('Test name')
    end
  end

  describe 'Delete customer' do
    it 'create customer' do
      delete "api/v1/customers/#{customer.id}", {}, {'HTTP_TOKEN' => customer.access_token}
      response = JSON.parse(last_response.body)
      expect(last_response.status).to eql(200)
      expect(response['message']).to eql('Customer deleted successfully')
    end
  end
end
