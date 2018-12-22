require 'rails_helper'

describe Race::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:race) { create(:race, user: user, customer: create(:customer), car: create(:car)) }
  let(:race2) { create(:race, user: user2, customer: create(:customer), car: create(:car)) }

  it 'returns race' do
    result = Race::Show.({ id: race.id }, current_user: user)
    expect(result.success?).to be true
    expect(result['model'].cargo_weight).to eq race.cargo_weight
  end

  context 'when user try to show not own race' do
    it 'does not return race' do
      result = Race::Show.({ id: race2.id }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
