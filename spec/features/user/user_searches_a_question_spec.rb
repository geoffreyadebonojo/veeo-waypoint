require 'rails_helper'

RSpec.feature "User Searches A Question", type: :feature do
  describe 'When a user searches a question' do
    scenario 'the user sees a list of results from Bing' do
      stub_oauth_user
      visit '/'

      click_on 'Login with Google'

      user = User.last
      topic = create(:topic, user: user)
      question = create(:question, topic: topic)

      visit '/topics'

      within(first('.question')) do
        click_on "Search"
      end
      expect(current_path).to eq('/search')
      expect(page).to have_content(question.text)
      expect(all('.results').length).to eq(10)
    end
  end
end
