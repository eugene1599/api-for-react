require 'rails_helper'

describe Note::Create do
  let(:user_id) { create(:user).id }
  let(:note_valid_params) { attributes_for(:note) }
  let(:note_invalid_params) { attributes_for(:note, title: nil) }

  context 'with empty params' do
    it 'does not create note' do
      result = Note::Create.({})
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'creates new note' do
      result = Note::Create.({ note: note_valid_params }, current_user: user_id)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not create note' do
      result = Note::Create.({ note: note_invalid_params }, current_user: user_id)
      expect(result.success?).to be false
    end
  end
end
