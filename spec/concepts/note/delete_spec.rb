require 'rails_helper'

describe Note::Delete do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:note) { create(:note, user: user) }
  let(:note2) { create(:note, user: user2) }

  context 'with invalid note id' do
    it 'returns fail' do
      result = Note::Delete.({ note: { id: note.id + 1 } }, current_user: user.id)
      expect(result.failure?).to be true
    end
  end

  context 'when user try to remove not own note' do
    it 'returns fail' do
      result = Note::Delete.({ note: { id: note.id } }, current_user: user2.id)
      expect(result.failure?).to be true
    end
  end

  context 'with valid params' do
    it 'deletes note' do
      note
      expect do
        Note::Delete.({ id: note.id }, current_user: note.user.id)
      end.to change(Note, :count).by(-1)
    end
  end
end
