require 'rails_helper'

describe Driver::Destroy do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:driver) { create(:driver, user: user) }
  let(:driver2) { create(:driver, user: user2) }

  context 'with invalid driver id' do
    it 'returns fail' do
      result = Driver::Destroy.({ driver: { id: driver.id + 1 } }, current_user: user)
      expect(result.failure?).to be true
    end
  end

  context 'when user try to remove not own driver' do
    it 'returns fail' do
      result = Driver::Destroy.({ driver: { id: driver.id } }, current_user: user2)
      expect(result.failure?).to be true
    end
  end

  context 'with valid params' do
    it 'deletes driver' do
      driver
      expect do
        Driver::Destroy.({ id: driver.id }, current_user: driver.user)
      end.to change(Driver, :count).by(-1)
    end
  end
end
