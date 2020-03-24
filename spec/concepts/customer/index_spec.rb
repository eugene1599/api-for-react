require 'rails_helper'

describe Customer::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:customers) { create_list(:customer, 5, user: user) }
  let!(:customer) { create(:customer, user: user2) }

  it 'returns customers' do
    result = Customer::Index.(params: {}, current_user: user)
    expect(result['model'].size).to eq customers.size
  end
end
