require 'rails_helper'

RSpec.describe Note, type: :model do
  context 'References' do
    it { is_expected.to belong_to :source }
    it { is_expected.to have_one(:user).through(:source)}
  end
end
