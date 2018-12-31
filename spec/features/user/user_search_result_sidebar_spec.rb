require 'rails_helper'

RSpec.feature "Search result sidebar", type: :feature do
  describe "After User selects a search result " do
    scenario 'user sees sidebar on result show page ', :vcr do
      stub_oauth_user
      visit '/'
      click_on 'Sign in with Google'

      user = User.last


      topic = create(:topic, user: user)
      question = create(:question, topic: topic, text: "Test Search")

      source_params = { title:       "Dummy Page",
                        url:         topics_path,
                        display_url: topics_path,
                        question_id: question.id,
                        snippet:     "Some content" }

      visit sidebar_path(source: source_params)

      click_on "Save"
      expect(page).to have_content("Saved!")
      expect(page).to_not have_button("Save")

    end
  end
end
