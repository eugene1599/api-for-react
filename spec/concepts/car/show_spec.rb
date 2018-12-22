require 'rails_helper'

describe Car::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:car) { create(:car, user: user) }
  let(:car2) { create(:car, user: user2) }

  it 'returns car' do
    result = Car::Show.({ id: car.id }, current_user: user)
    expect(result.success?).to be true
    expect(result['model'].name).to eq car.name
  end

  context 'when user try to show not own car' do
    it 'does not return car' do
      result = Car::Show.({ id: car2.id }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
