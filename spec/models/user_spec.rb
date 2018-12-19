require 'rails_helper'

RSpec.describe User, type: :model do
  it 'exists' do
    attributes = {}
    user = User.create(attributes)

    expect(user).to be_a(User)
  end

  it 'has attributes' do
    attributes = { provider: 'google',
                   google_id: '123',
                   first_name: 'Hans',
                   last_name: 'Wurst',
                   email: 'hans@wurst',
                   image_url: 'http://testimage.jpg'
                  }

    user = User.create(attributes)

    expect(user.provider).to eq('google')
    expect(user.google_id).to eq('123')
    expect(user.first_name).to eq('Hans')
    expect(user.last_name).to eq('Wurst')
    expect(user.email).to eq('hans@wurst')
    expect(user.image_url).to eq('http://testimage.jpg')
  end

  context 'Validations' do
    it { should have_many(:topics) }
  end

  context 'instance methods' do
    let(:user) { create(:user) }
    let(:topics) { create_list(:topic, 2, user: user) }

    describe '.topics' do
      subject { user.topics }
      it { is_expected.to eq(topics) }
    end
  end
end
