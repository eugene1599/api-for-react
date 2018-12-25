require 'rails_helper'

RSpec.describe 'UserProfile', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }
  let!(:user_profile) { create(:user_profile, user: user) }
  let(:valid_user_profile) { attributes_for(:user_profile) }
  let(:invalid_params) { attributes_for(:user_profile, first_name: '') }

  describe 'GET /user_profile' do
    it 'returns needed user_profile' do
      get api_v1_user_profile_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('user_profile')
      expect(response.parsed_body['first_name']).to eq(user_profile[:first_name])
    end
  end

  describe 'PATCH /user_profile' do
    it 'update user_profile with valid data' do
      patch api_v1_user_profile_path, headers: headers, params: { user_profile: valid_user_profile }

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('user_profile')
      expect(response.parsed_body['title']).to eq(valid_user_profile[:title])
    end

    it "doesn't update user_profile with invalid data" do
      patch api_v1_user_profile_path, headers: headers, params: { user_profile: invalid_params }

      expect(response).to have_http_status(:unprocessable_entity)
    end

    context 'with valid image' do
      it 'updates user_profile' do
        file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/valid_avatar.jpg'), 'image/jpg')
        patch api_v1_user_profile_path, headers: headers, params: { user_profile: valid_user_profile.merge(avatar: file) }
        expect(response).to have_http_status(:ok)
      end
    end
    context 'with invalid image' do
      it "doesn't update user_profile" do
        file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/invalid_avatar.jpg'), 'image/jpg')
        patch api_v1_user_profile_path, headers: headers, params: { user_profile: valid_user_profile.merge(avatar: file) }

        expect(response.parsed_body).to include 'avatar'
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
