require 'rails_helper'

describe UserProfile::Update do
  let(:user) { create(:user) }
  let!(:user_profile) { create(:user_profile, user: user) }
  let(:user_profile_valid_params) { attributes_for(:user_profile) }
  let(:user_profile_invalid_params) { attributes_for(:user_profile, first_name: nil) }

  context 'with empty params' do
    it 'does not update user_profile' do
      result = UserProfile::Update.({}, current_user: nil)
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'updates user_profile' do
      result = UserProfile::Update.({ user_profile: user_profile_valid_params }, current_user: user_profile.user)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not update user_profile' do
      result = UserProfile::Update.({ user_profile: user_profile_invalid_params }, current_user: user_profile.user)
      expect(result.success?).to be false
    end
  end
end

