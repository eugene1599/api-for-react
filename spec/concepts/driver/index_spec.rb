require 'rails_helper'

describe Driver::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:drivers) { create_list(:driver, 5, user: user) }
  let!(:driver) { create(:driver, user: user2) }

  it 'returns drivers' do
    result = Driver::Index.(params: {}, current_user: user)
    expect(result['model'].size).to eq drivers.size
  end
end
