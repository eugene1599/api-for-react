require 'rails_helper'

describe Car::Destroy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:car) { create(:car, user: user) }
  let(:car2) { create(:car, user: user2) }

  context 'with invalid car id' do
    it 'returns fail' do
      result = Car::Destroy.({ car: { id: car.id + 1 } }, current_user: user)
      expect(result.failure?).to be true
    end
  end

  context 'when user try to remove not own car' do
    it 'returns fail' do
      result = Car::Destroy.({ car: { id: car.id } }, current_user: user2)
      expect(result.failure?).to be true
    end
  end

  context 'with valid params' do
    it 'deletes car' do
      car
      expect do
        Car::Destroy.({ id: car.id }, current_user: car.user)
      end.to change(Car, :count).by(-1)
    end
  end
end
