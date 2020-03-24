require 'rails_helper'

describe Driver::Create do
  let(:user) { create(:user) }
  let(:driver_valid_params) { attributes_for(:driver) }
  let(:driver_invalid_params) { attributes_for(:driver, first_name: nil) }

  context 'with empty params' do
    it 'does not create driver' do
      result = Driver::Create.(params: {}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'creates new driver' do
      result = Driver::Create.(params: { driver: driver_valid_params }, current_user: user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not create driver' do
      result = Driver::Create.(params: { driver: driver_invalid_params }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
