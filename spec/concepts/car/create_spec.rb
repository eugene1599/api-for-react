require 'rails_helper'

describe Car::Create do
  let(:user) { create(:user) }
  let(:car_valid_params) { attributes_for(:car) }
  let(:car_invalid_params) { attributes_for(:car, name: nil) }

  context 'with empty params' do
    it 'does not create car' do
      result = Car::Create.(params: {}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'creates new car' do
      result = Car::Create.(params: { car: car_valid_params }, current_user: user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not create car' do
      result = Car::Create.(params: { car: car_invalid_params }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
