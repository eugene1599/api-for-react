require 'rails_helper'

RSpec.describe 'Customer', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }
  let(:customer) { create(:customer, user: user) }
  let(:valid_customer) { attributes_for(:customer) }
  let(:invalid_customer) { attributes_for(:customer, first_name: ' ') }

  describe 'GET /customers' do
    let!(:customers) { create_list(:customer, 5, user: user) }

    it 'returns list of customers' do
      get api_v1_customers_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('customers')
      expect(response.parsed_body.size).to eq(customers.size)
    end
  end

  describe 'POST /customers' do
    it 'creates new customer' do
      post api_v1_customers_path, headers: headers, params: { customer: valid_customer }
      expect(response).to have_http_status(:created)
      expect(response).to match_response_schema('customer')
      expect(response.parsed_body['first_name']).to eq(valid_customer[:first_name])
    end

    it "doesn't create invalid customer" do
      post api_v1_customers_path, headers: headers, params: { customer: invalid_customer }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /customers/{id}' do
    it 'returns needed customer' do
      get api_v1_customer_path(customer.id), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('customer')
      expect(response.parsed_body['first_name']).to eq(customer[:first_name])
    end
  end

  describe 'PATCH /customers/{id}' do
    it 'update customer with valid data' do
      patch api_v1_customer_path(customer.id), headers: headers, params: { customer: valid_customer }

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('customer')
      expect(response.parsed_body['first_name']).to eq(valid_customer[:first_name])
    end

    it "doesn't update customer with invalid data" do
      patch api_v1_customer_path(customer.id), headers: headers, params: { customer: invalid_customer }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /customers/{id}' do
    it 'can delete customer' do
      customer
      expect do
        delete api_v1_customer_path(customer.id), headers: headers
      end.to change(Customer, :count).by(-1)
    end
  end
end
