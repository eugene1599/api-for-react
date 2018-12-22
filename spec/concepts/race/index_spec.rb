require 'rails_helper'

describe Race::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:races) { create_list(:race, 5, user: user, customer: create(:customer), car: create(:car)) }
  let!(:race) { create(:race, user: user2, customer: create(:customer), car: create(:car)) }

  it 'returns races' do
    result = Race::Index.({}, current_user: user)
    expect(result['model'].size).to eq races.size
  end
end
