require 'rails_helper'

RSpec.feature "Source show page", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
  end

  let(:user) { User.last }
  let(:topic) { create(:topic, user: user) }
  let(:question) { create(:question, topic: topic, text: "Test Search") }
  let(:source_params) do
    { title:       "Dummy Page",
      url:         topics_path,
      display_url: topics_path,
      question_id: question.id,
      snippet:     "Some content" }
  end

  describe "sidebar" do
    before do
      visit sidebar_path(source: source_params)
      click_on "Save"
    end
    scenario 'user can save a source ', :vcr do
      expect(page).to have_css("#notes")
      expect(page).to_not have_css("#save-source")
    end

    scenario "user can add a note to a saved source" do
      fill_in 'note[text]', with: "This is a brand new note"
      click_on "Save"

      within '#notes' do
        expect(page).to have_content("This is a brand new note")
      end
    end
  end
end
