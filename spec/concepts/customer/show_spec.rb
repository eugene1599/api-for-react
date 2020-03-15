require 'rails_helper'

describe Customer::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:customer) { create(:customer, user: user) }
  let(:customer2) { create(:customer, user: user2) }

  it 'returns customer' do
    result = Customer::Show.(params: { id: customer.id }, current_user: user)
    expect(result.success?).to be true
    expect(result['model'].first_name).to eq customer.first_name
  end

  context 'when user try to show not own customer' do
    it 'does not return customer' do
      result = Customer::Show.(params: { id: customer2.id }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
