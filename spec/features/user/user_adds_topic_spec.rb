require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it 'can add a topic' do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    visit '/topics'
    fill_in 'topic[title]', with: 'Computer Sience'
    click_on 'Save'

    expect(current_path).to eq('/topics')
    expect(page).to have_content('Computer Sience')
  end
end
