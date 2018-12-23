require 'rails_helper'

RSpec.describe 'User can login' do
  it 'via google aouth' do
    stub_oauth_user

    visit '/'
    click_on 'Login with Google'

    expect(current_path).to eq('/topics')
  end
end
