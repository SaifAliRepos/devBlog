require 'rails_helper'

RSpec.describe User, type: :model do


  describe 'has_many :posts' do
    it { is_expected.to have_many(:posts) }
  end

  describe 'has_many :likes' do
    it { is_expected.to have_many(:likes) }
  end

  describe 'has_many :suggestions' do
    it { is_expected.to have_many(:suggestions) }
  end

  describe 'user.name' do
    it { is_expected.to validate_presence_of(:name) }
  end

end
