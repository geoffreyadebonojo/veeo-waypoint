require 'rails_helper'

RSpec.feature "Search Index Page", type: :feature do
  scenario 'User selects search result and sees result page', :vcr, :js do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    topic = create(:topic, user: user)
    question = create(:question, topic: topic, text: "Test Search")
    visit search_path(question_id: question.id)

    # Stubbing params hit an internal route so we don't have to wait long for the frame to load.
    source_params = { title:       "Dummy Page",
                      url:         topics_path,
                      display_url: topics_path,
                      question_id: question.id,
                      snippet:     "Some content" }

    allow_any_instance_of(User::SourcesController).to receive(:source_params).and_return(source_params)

    first('.search-result-link').click
    sleep 0.05

    within_frame("results-iframe") do
      expect(page).to have_content("Topics")
    end
  end
end
