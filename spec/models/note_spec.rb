require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'ActiveRecord associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    xit { is_expected.to validate_presence_of(:title) }
  end
end
