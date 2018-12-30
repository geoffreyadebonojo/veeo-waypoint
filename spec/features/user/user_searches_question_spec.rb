require 'rails_helper'

RSpec.feature "Search Index Page", type: :feature do
  scenario 'User selects search result and sees result page', :vcr, :js do
    user = build_stubbed(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    topic = build_stubbed(:topic, user: user)
    question = build_stubbed(:question, topic: topic, text: "Test Search")
    visit search_path(question: question.text)

    # Stubbing target url to hit an internal route so we don't have to wait long for the frame to load.
    allow_any_instance_of(ApplicationController).to receive(:params).and_return(target_url: topics_path)

    first('.search-result-link').click
    sleep 0.05

    within_frame("results-iframe") do
      expect(page).to have_content("Topics")
    end
  end
end
