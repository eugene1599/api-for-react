require 'rails_helper'

describe Race::Create do
  subject(:operation) { Race::Create.(params: params, current_user: user) }

  let(:user) { create(:user) }
  let(:customer) { create(:customer, user: user) }
  let(:car) { create(:car, user: user) }
  let(:race_valid_params) { attributes_for(:race).merge(customer_id: create(:customer).id, car_id: create(:car).id) }
  let(:race_invalid_params) { attributes_for(:race, start_date: nil).merge(customer_id: create(:customer).id, car_id: create(:car).id) }

  context 'with empty params' do
    let(:params) { {} }

    it 'does not create race' do
      expect(operation.success?).to be false
    end
  end

  context 'with valid params' do
    let(:params) { { race: race_valid_params } }

    it 'creates new race' do
      expect(operation.success?).to be true
    end
  end

  context 'with invalid params' do
    let(:params) { { race: race_invalid_params } }

    it 'does not create race' do
      expect(operation.success?).to be false
    end
  end
end
