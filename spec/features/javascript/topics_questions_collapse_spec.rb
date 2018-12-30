require 'rails_helper'

RSpec.feature "Topic Questions Collapse", type: :feature do
  describe 'A User visiting the topics index page' do
    it 'can expand and collapse the questions for a topic', :vcr, :js do
      stub_oauth_user
      visit '/'
      click_on 'Sign in with Google'

      sleep 0.02
      user = User.last
      topic = create(:topic, user: user)
      question = create(:question, topic: topic)
      visit '/topics'

      first('.collapsible').click
      expect(page).to have_content(question.text)
      first('.collapsible').click
      expect(page).to_not have_content(question.text)
    end
  end
end
