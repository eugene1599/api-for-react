require 'rails_helper'

describe Customer::Update do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:customer) { create(:customer, user: user) }
  let(:customer2) { create(:customer, user: user2) }
  let(:customer_valid_params) { attributes_for(:customer) }
  let(:customer_invalid_params) { attributes_for(:customer, first_name: nil) }

  context 'with empty params' do
    it 'does not update customer' do
      result = Customer::Update.({}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'updates customer' do
      customer
      result = Customer::Update.({ id: customer.id, customer: customer_valid_params }, current_user: customer.user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not update customer' do
      result = Customer::Update.({ id: customer.id, customer: customer_invalid_params }, current_user: customer.user)
      expect(result.success?).to be false
    end
  end

  context 'when user try to update not own customer' do
    it 'does not update customer' do
      customer2
      result = Customer::Update.({ id: customer2.id, customer: customer_valid_params }, current_user: customer.user)
      expect(result.success?).to be false
    end
  end
end
