require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it 'can click on a topic and go to show page' do

    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google]

    visit '/'
    click_on 'Login with Google'

    user = User.last
    topic = create(:topic, user: user)

    visit '/topics'

    within(first(".topic")) do
      fill_in 'question[text]', with: 'What is a query'
      click_on 'Save'
    end

    click_on topic.title

    expect(current_path).to eq("/topics/#{topic.id}")

    expect(page).to have_content(topic.title)
    expect(page).to have_content(topic.questions.first.text)
  end
end
