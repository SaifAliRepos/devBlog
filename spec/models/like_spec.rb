require 'rails_helper'

RSpec.describe Like, type: :model do

  describe 'belongs_to :user' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'belongs_to :likeable' do
    it { is_expected.to belong_to(:likeable) }
  end

end
