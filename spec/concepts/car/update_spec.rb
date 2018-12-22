require 'rails_helper'

describe Car::Update do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:car) { create(:car, user: user) }
  let(:car2) { create(:car, user: user2) }
  let(:car_valid_params) { attributes_for(:car) }
  let(:car_invalid_params) { attributes_for(:car, name: nil) }

  context 'with empty params' do
    it 'does not update car' do
      result = Car::Update.({}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'updates car' do
      car
      result = Car::Update.({ id: car.id, car: car_valid_params }, current_user: car.user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not update car' do
      result = Car::Update.({ id: car.id, car: car_invalid_params }, current_user: car.user)
      expect(result.success?).to be false
    end
  end

  context 'when user try to update not own car' do
    it 'does not update car' do
      car2
      result = Car::Update.({ id: car2.id, car: car_valid_params }, current_user: car.user)
      expect(result.success?).to be false
    end
  end
end
