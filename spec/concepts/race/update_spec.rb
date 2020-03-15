require 'rails_helper'

describe Race::Update do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:race) { create(:race, user: user) }
  let(:race2) { create(:race, user: user2) }
  let(:race_valid_params) { attributes_for(:race).merge(customer_id: create(:customer).id, car_id: create(:car).id)  }
  let(:race_invalid_params) { attributes_for(:race, start_date: nil).merge(customer_id: create(:customer).id, car_id: create(:car).id) }

  context 'with empty params' do
    it 'does not update race' do
      result = Race::Update.(params: {}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'updates race' do
      race
      result = Race::Update.(params: { id: race.id, race: race_valid_params }, current_user: race.user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not update race' do
      result = Race::Update.(params: { id: race.id, race: race_invalid_params }, current_user: race.user)
      expect(result.success?).to be false
    end
  end

  context 'when user try to update not own race' do
    it 'does not update race' do
      race2
      result = Race::Update.(params: { id: race2.id, race: race_valid_params }, current_user: race.user)
      expect(result.success?).to be false
    end
  end
end
