require 'rails_helper'

describe Car::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:cars) { create_list(:car, 5, user: user) }
  let!(:car) { create(:car, user: user2) }

  it 'returns cars' do
    result = Car::Index.(params: {}, current_user: user)
    expect(result['model'].size).to eq cars.size
  end
end
