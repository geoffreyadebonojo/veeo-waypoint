require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it 'can add a question to a specific topic' do
    user = create(:user)
    topic = create(:topic, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/topics'
    within(first(".topic")) do
      fill_in 'question[text]', with: 'What is a query'
      click_on 'Submit'
    end

    expect(current_path).to eq('/topics')
    expect(page).to have_content('What is a query')
  end
end
