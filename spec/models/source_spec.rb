require 'rails_helper'

RSpec.describe Source, type: :model do
  context 'References' do
    it { is_expected.to belong_to :question }
  end

  context 'Instance Methods' do
    describe 'params' do
      it 'returns the params required to find or instantiate itself' do
        params = subject.attributes.except('created_at', 'updated_at',
                                           'body', 'display_url')
        expect(subject.params).to eq(params)
      end
    end
  end
end
