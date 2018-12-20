require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it 'can add a topic' do

    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]

    visit '/'
    click_on 'Login with Google'

    visit '/topics'
    fill_in 'topic[title]', with: 'Computer Sience'
    click_on 'Save'

    expect(current_path).to eq('/topics')
    expect(page).to have_content('Computer Sience')
  end
end
