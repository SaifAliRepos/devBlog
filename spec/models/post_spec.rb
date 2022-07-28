require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '.post_id' do
    describe 'belongs_to :user' do
      it { is_expected.to belong_to(:user) }
    end
  end

  describe 'belongs_to :user' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'has_many :likes' do
    it { is_expected.to have_many(:likes) }
  end

  describe 'has_many :comments' do
    it { is_expected.to have_many(:comments) }
  end

  describe 'has_many :suggestions' do
    it { is_expected.to have_many(:suggestions) }
  end

  describe 'user #name' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'name >= 2' do
    it { is_expected.to validate_length_of(:name).is_at_least(2) }
  end

  describe 'format of name' do
    it { is_expected.to allow_value('base@example').for(:name) }
  end

  describe '.contain user_id' do
    it { is_expected.to validate_presence_of(:user_id) }
  end


end
