require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '.comment_id' do
    describe 'belongs_to :post' do
      it { is_expected.to belong_to(:post) }
    end
  end

  describe 'has_many :likes' do
    it { is_expected.to have_many(:likes) }
  end

  describe 'has_many :replies' do
    it { is_expected.to have_many(:replies) }
  end

  describe 'has_many_attached :images' do
    it { is_expected.to have_many_attached(:images) }
  end

  describe '#cmnt?' do
    it { is_expected.to validate_presence_of(:cmnt) }
  end

  describe 'format of cmnt' do
    it { is_expected.to allow_value('my first comment #1').for(:cmnt) }
  end

end
