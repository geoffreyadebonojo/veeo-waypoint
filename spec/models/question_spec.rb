require 'rails_helper'

RSpec.describe Question, type: :model do
  context 'References' do
    it { is_expected.to have_many :sources }
    it { is_expected.to belong_to :topic }
  end
end
