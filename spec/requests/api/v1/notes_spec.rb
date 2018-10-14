require 'rails_helper'

RSpec.describe 'Notes', type: :request do
  let(:user) { create(:user) }
  let(:headers) { user.create_new_auth_token }
  let(:note) { create(:note, user: user) }
  let(:valid_note) { attributes_for(:note) }
  let(:invalid_note) { attributes_for(:note, title: ' ') }

  describe 'GET /notes' do
    let!(:notes) { create_list(:note, 5, user: user) }

    it 'returns list of notes' do
      get api_v1_notes_path, headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('notes')
      expect(response.parsed_body.size).to eq(notes.size)
    end
  end

  describe 'POST /notes' do
    it 'creates new note' do
      post api_v1_notes_path, headers: headers, params: { note: valid_note }
      expect(response).to have_http_status(:created)
      expect(response).to match_response_schema('note')
      expect(response.parsed_body['title']).to eq(valid_note[:title])
    end

    it "doesn't create invalid note" do
      post api_v1_notes_path, headers: headers, params: { note: invalid_note }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /notes/{id}' do
    it 'returns needed note' do
      get api_v1_note_path(note.id), headers: headers

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('note')
      expect(response.parsed_body['title']).to eq(note[:title])
    end
  end

  describe 'PATCH /notes/{id}' do
    it 'update note with valid data' do
      patch api_v1_note_path(note.id), headers: headers, params: { note: valid_note }

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema('note')
      expect(response.parsed_body['title']).to eq(valid_note[:title])
    end

    it "doesn't update note with invalid data" do
      patch api_v1_note_path(note.id), headers: headers, params: { note: invalid_note }

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE /notes/{id}' do
    it 'can delete note' do
      note
      expect do
        delete api_v1_note_path(note.id), headers: headers
      end.to change(Note, :count).by(-1)
    end
  end
end
