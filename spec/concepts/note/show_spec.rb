require 'rails_helper'

describe Note::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:note) { create(:note, user: user) }
  let(:note2) { create(:note, user: user2) }

  it 'returns note' do
    result = Note::Show.({ id: note.id }, current_user: user.id)
    expect(result.success?).to be true
    expect(result['model'].title).to eq note.title
  end

  context 'when user try to show not own note' do
    it 'does not return note' do
      result = Note::Show.({ id: note2.id }, current_user: user.id)
      expect(result.success?).to be false
    end
  end
end
