require 'rails_helper'

RSpec.describe 'User can login' do 
  it 'via google aouth' do
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]
    
    visit '/'
    click_on 'Login with Google'
    
    expect(current_path).to eq('/topics')
  end
end