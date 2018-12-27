require 'rails_helper'

RSpec.feature "TopicsIndexPage", type: :feature do
  context 'User visiting topics index page' do
    it 'can add a question to a specific topic' do
      stub_oauth_user
      visit '/'
      click_on 'Sign in with Google'

      user = User.last
      topic = create(:topic, user: user)

      visit '/topics'
      within(first(".topic")) do
        fill_in 'question[text]', with: 'What is a query'
        click_on 'Save'
      end

      expect(current_path).to eq('/topics')
      expect(page).to have_css('.questions', visible: :hidden, text: 'What is a query')
    end

    it 'can execute a search for a specific question', :vcr do
      stub_oauth_user
      visit '/'
      click_on 'Sign in with Google'

      user = User.last
      topic = create(:topic, user: user)
      question = create(:question, topic: topic)

      visit '/topics'


      within(first('.question', visible: :hidden)) do
        find('.search-link', visible: :hidden).click
      end


      expect(current_path).to eq('/search')
      expect(page).to have_content(question.text)
      expect(all('.result').length).to eq(10)
    end
  end
end
