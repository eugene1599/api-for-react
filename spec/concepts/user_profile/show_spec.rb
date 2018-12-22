require 'rails_helper'

describe UserProfile::Show do
  let(:user) { create(:user) }
  let!(:user_profile) { create(:user_profile, user: user) }

  it 'returns user_profile' do
    result = UserProfile::Show.(nil, current_user: user )
    expect(result.success?).to be true
    expect(result['model'].first_name).to eq user_profile.first_name
  end
end
