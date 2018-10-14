require 'rails_helper'

describe Note::Index do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:notes) { create_list(:note, 5, user: user) }
  let!(:note) { create(:note, user: user2) }

  it 'returns notes' do
    result = Note::Index.({}, current_user: user.id)
    expect(result['model'].size).to eq notes.size
  end
end
