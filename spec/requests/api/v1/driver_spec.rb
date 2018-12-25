require 'rails_helper'

RSpec.describe 'Driver', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }
  let(:driver) { create(:driver, user: user) }
  let(:valid_driver) { attributes_for(:driver) }
  let(:invalid_driver) { attributes_for(:driver, first_name: ' ') }

  describe 'GET /drivers' do
    let!(:drivers) { create_list(:driver, 5, user: user) }

    it 'returns list of drivers' do
      get api_v1_drivers_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('drivers')
      expect(response.parsed_body.size).to eq(drivers.size)
    end
  end

  describe 'POST /drivers' do
    it 'creates new driver' do
      post api_v1_drivers_path, headers: headers, params: { driver: valid_driver }
      expect(response).to have_http_status(:created)
      expect(response).to match_response_schema('driver')
      expect(response.parsed_body['first_name']).to eq(valid_driver[:first_name])
    end

    it "doesn't create invalid driver" do
      post api_v1_drivers_path, headers: headers, params: { driver: invalid_driver }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /drivers/{id}' do
    it 'returns needed driver' do
      get api_v1_driver_path(driver.id), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('driver')
      expect(response.parsed_body['first_name']).to eq(driver[:first_name])
    end
  end

  describe 'PATCH /drivers/{id}' do
    it 'update driver with valid data' do
      patch api_v1_driver_path(driver.id), headers: headers, params: { driver: valid_driver }

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('driver')
      expect(response.parsed_body['first_name']).to eq(valid_driver[:first_name])
    end

    it "doesn't update driver with invalid data" do
      patch api_v1_driver_path(driver.id), headers: headers, params: { driver: invalid_driver }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /drivers/{id}' do
    it 'can delete driver' do
      driver
      expect do
        delete api_v1_driver_path(driver.id), headers: headers
      end.to change(Driver, :count).by(-1)
    end
  end
end
