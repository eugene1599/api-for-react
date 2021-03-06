require 'rails_helper'

describe Race::Create do
  let(:user) { create(:user) }
  let(:customer) { create(:customer, user: user) }
  let(:car) { create(:car, user: user) }
  let(:race_valid_params) { attributes_for(:race).merge(customer_id: create(:customer).id, car_id: create(:car).id) }
  let(:race_invalid_params) { attributes_for(:race, start_date: nil).merge(customer_id: create(:customer).id, car_id: create(:car).id) }

  context 'with empty params' do
    it 'does not create race' do
      result = Race::Create.({}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'creates new race' do
      result = Race::Create.({ race: race_valid_params }, current_user: user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not create race' do
      result = Race::Create.({ race: race_invalid_params }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
