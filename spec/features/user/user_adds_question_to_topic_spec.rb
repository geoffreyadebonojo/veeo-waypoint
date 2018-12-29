require 'rails_helper'

RSpec.feature "TopicsIndexPage", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    create(:topic, user: User.last)
  end
  let(:user) { User.last }
  let(:topic) { Topic.last }

  context 'User visiting topics index page' do
    it 'can add a question to a specific topic' do
      visit '/topics'
      within(first(".topic")) do
        fill_in 'question[text]', with: 'What is a query'
        click_on 'Save'
      end

      expect(current_path).to eq('/topics')
      expect(page).to have_css('.questions', visible: :hidden, text: 'What is a query')
    end

    it 'can execute a search for a specific question', :vcr do
      question = create(:question, topic: topic)
      visit '/topics' 
      within(first('.question', visible: :hidden)) do
        find('.search-link', visible: :hidden).click
      end
      
      expect(current_path).to eq('/search')
      expect(page).to have_content(question.text)
      expect(all('.result').length).to eq(10)
    end

    it 'cant add a blank question' do
      visit '/topics'
      within(first(".topic")) do
        fill_in 'question[text]', with: ''
        click_on 'Save'
      end

      expect(current_path).to eq('/topics')
      expect(Question.all).to eq([])
    end
  end
end