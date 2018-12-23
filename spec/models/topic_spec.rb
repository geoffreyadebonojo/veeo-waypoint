require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'References' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :questions }
  end
end
