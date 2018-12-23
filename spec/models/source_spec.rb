require 'rails_helper'

RSpec.describe Source, type: :model do
  context 'References' do
    it { is_expected.to belong_to :question }
  end
end
