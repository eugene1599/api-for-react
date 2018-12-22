require 'rails_helper'

describe Customer::Create do
  let(:user) { create(:user) }
  let(:customer_valid_params) { attributes_for(:customer) }
  let(:customer_invalid_params) { attributes_for(:customer, first_name: nil) }

  context 'with empty params' do
    it 'does not create customer' do
      result = Customer::Create.({}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'creates new customer' do
      result = Customer::Create.({ customer: customer_valid_params }, current_user: user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not create customer' do
      result = Customer::Create.({ customer: customer_invalid_params }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
