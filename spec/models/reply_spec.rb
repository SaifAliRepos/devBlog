require 'rails_helper'

RSpec.describe Reply, type: :model do

  describe 'belongs_to :replyable' do
    it { is_expected.to belong_to(:replyable) }
  end

  describe '.contain reply' do
    it { is_expected.to validate_presence_of(:reply) }
  end


end
