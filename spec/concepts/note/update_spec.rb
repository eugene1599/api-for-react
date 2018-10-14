require 'rails_helper'

describe Note::Update do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:note) { create(:note, user: user) }
  let(:note2) { create(:note, user: user2) }
  let(:note_valid_params) { attributes_for(:note) }
  let(:note_invalid_params) { attributes_for(:note, title: nil) }

  context 'with empty params' do
    it 'does not update note' do
      result = Note::Update.({})
      expect(result.success?).to be false
    end
  end

  context 'with valid params' do
    it 'updates note' do
      note
      result = Note::Update.({ id: note.id, note: note_valid_params }, current_user: note.user.id)
      expect(result.success?).to be true
    end
  end

  context 'with invalid params' do
    it 'does not update note' do
      result = Note::Update.({ id: note.id, note: note_invalid_params }, current_user: note.user.id)
      expect(result.success?).to be false
    end
  end

  context 'when user try to update not own note' do
    it 'does not update note' do
      note2
      result = Note::Update.({ id: note2.id, note: note_valid_params }, current_user: note.user.id)
      expect(result.success?).to be false
    end
  end
end
