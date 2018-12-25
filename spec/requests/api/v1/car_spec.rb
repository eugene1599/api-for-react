require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }
  let(:car) { create(:car, user: user) }
  let(:valid_car) { attributes_for(:car) }
  let(:invalid_car) { attributes_for(:car, name: ' ') }

  describe 'GET /cars' do
    let!(:cars) { create_list(:car, 5, user: user) }

    it 'returns list of cars' do
      get api_v1_cars_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('cars')
      expect(response.parsed_body.size).to eq(cars.size)
    end
  end

  describe 'POST /cars' do
    it 'creates new car' do
      post api_v1_cars_path, headers: headers, params: { car: valid_car }
      expect(response).to have_http_status(:created)
      expect(response).to match_response_schema('car')
      expect(response.parsed_body['name']).to eq(valid_car[:name])
    end

    it "doesn't create invalid car" do
      post api_v1_cars_path, headers: headers, params: { car: invalid_car }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /cars/{id}' do
    it 'returns needed car' do
      get api_v1_car_path(car.id), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('car')
      expect(response.parsed_body['name']).to eq(car[:name])
    end
  end

  describe 'PATCH /cars/{id}' do
    it 'update car with valid data' do
      patch api_v1_car_path(car.id), headers: headers, params: { car: valid_car }

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('car')
      expect(response.parsed_body['name']).to eq(valid_car[:name])
    end

    it "doesn't update car with invalid data" do
      patch api_v1_car_path(car.id), headers: headers, params: { car: invalid_car }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /cars/{id}' do
    it 'can delete car' do
      car
      expect do
        delete api_v1_car_path(car.id), headers: headers
      end.to change(Car, :count).by(-1)
    end
  end
end
