require 'rails_helper'

RSpec.feature "Search result sidebar", type: :feature do
  describe "After User selects a search result " do
    scenario 'user sees sidebar on result show page ', :vcr do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      topic = create(:topic, user: user)
      question = create(:question, topic: topic, text: "Test Search")
      visit search_path(question_id: question.id)

      first('.search-result-link').click

      expect(page).to have_css('#notes')
      expect(page).to have_css('#questions')
      click_on "Save"
      visit topic_path(topic)
      expect(page).to have_content("Wikipedia")
    end
  end
end
