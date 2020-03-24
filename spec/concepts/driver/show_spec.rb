require 'rails_helper'

describe Driver::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:driver) { create(:driver, user: user) }
  let(:driver2) { create(:driver, user: user2) }

  it 'returns driver' do
    result = Driver::Show.(params: { id: driver.id }, current_user: user)
    expect(result.success?).to be true
    expect(result['model'].first_name).to eq driver.first_name
  end

  context 'when user try to show not own driver' do
    it 'does not return driver' do
      result = Driver::Show.(params: { id: driver2.id }, current_user: user)
      expect(result.success?).to be false
    end
  end
end
