require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it 'can add a question to a specific topic', :js do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'

    sleep 0.01 # Prevents error from selenium multithreading
    user = User.last
    topic = create(:topic, user: user)

    visit '/topics'
    within(first(".topic")) do
      fill_in 'question[text]', with: 'What is a query'
      click_on 'Save'
    end

    first('.collapsible').click

    expect(current_path).to eq('/topics')
    expect(page).to have_content('What is a query')
  end
end
