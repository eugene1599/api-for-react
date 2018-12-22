require 'rails_helper'

describe Race::Destroy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:race) { create(:race, user: user, customer: create(:customer), car: create(:car)) }
  let(:race2) { create(:race, user: user2, customer: create(:customer), car: create(:car)) }

  context 'with invalid race id' do
    it 'returns fail' do
      result = Race::Destroy.({ race: { id: race.id + 1 } }, current_user: user)
      expect(result.failure?).to be true
    end
  end

  context 'when user try to remove not own race' do
    it 'returns fail' do
      result = Race::Destroy.({ race: { id: race.id } }, current_user: user2)
      expect(result.failure?).to be true
    end
  end

  context 'with valid params' do
    it 'deletes race' do
      race
      expect do
        Race::Destroy.({ id: race.id }, current_user: race.user)
      end.to change(Race, :count).by(-1)
    end
  end
end
