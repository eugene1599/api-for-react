require 'rails_helper'

describe Customer::Destroy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:customer) { create(:customer, user: user) }
  let(:customer2) { create(:customer, user: user2) }

  context 'with invalid customer id' do
    it 'returns fail' do
      result = Customer::Destroy.({ customer: { id: customer.id + 1 } }, current_user: user)
      expect(result.failure?).to be true
    end
  end

  context 'when user try to remove not own customer' do
    it 'returns fail' do
      result = Customer::Destroy.({ customer: { id: customer.id } }, current_user: user2)
      expect(result.failure?).to be true
    end
  end

  context 'with valid params' do
    it 'deletes customer' do
      customer
      expect do
        Customer::Destroy.({ id: customer.id }, current_user: customer.user)
      end.to change(Customer, :count).by(-1)
    end
  end
end
