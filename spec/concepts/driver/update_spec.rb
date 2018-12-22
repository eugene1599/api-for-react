require 'rails_helper'

describe Driver::Update do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:driver) { create(:driver, user: user) }
  let(:driver2) { create(:driver, user: user2) }
  let(:driver_valid_params) { attributes_for(:driver) }
  let(:driver_invalid_params) { attributes_for(:driver, first_name: nil) }

  context 'with empty params' do
    it 'does not update driver' do
      result = Driver::Update.({}, current_user: user)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'updates driver' do
      driver
      result = Driver::Update.({ id: driver.id, driver: driver_valid_params }, current_user: driver.user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not update driver' do
      result = Driver::Update.({ id: driver.id, driver: driver_invalid_params }, current_user: driver.user)
      expect(result.success?).to be false
    end
  end

  context 'when user try to update not own driver' do
    it 'does not update driver' do
      driver2
      result = Driver::Update.({ id: driver2.id, driver: driver_valid_params }, current_user: driver.user)
      expect(result.success?).to be false
    end
  end
end
