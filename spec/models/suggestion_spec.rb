require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  describe '.post_id' do
    describe 'belongs_to :user' do
      it { is_expected.to belong_to(:user) }
    end
  end

  describe 'belongs_to :user' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'belongs_to :post' do
    it { is_expected.to belong_to(:post) }
  end

  describe 'has_many :replies' do
    it { is_expected.to have_many(:replies) }
  end


  describe 'suggestion.find' do
    it { is_expected.to validate_presence_of(:find) }
  end

  describe 'suggestion.replace' do
    it { is_expected.to validate_presence_of(:replace) }
  end

end
