require 'rails_helper'

RSpec.feature "Question Search", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    create(:topic, user: User.last)
    create(:question, topic: Topic.last)
  end
  let(:user) { User.last }
  let(:topic) { Topic.last }
  let(:question) { Question.last }

  describe 'User visiting topics index page' do
    it 'can execute a search for a specific question', :vcr do
      visit '/topics'

      within(first('.question', visible: :hidden)) do
        find('.search-btn', visible: :hidden).click
      end

      expect(current_path).to eq('/search')
      expect(page).to have_content(question.text)
      expect(all('.result').length).to eq(10)
    end
  end

  describe 'User visiting topics show page' do
    it 'can execute a search for a specific question', :vcr do
      visit "/topics/#{topic.id}"
      within(first('.question')) do
        first('.search-btn').click
      end

      expect(current_path).to eq('/search')
      expect(page).to have_content(question.text)
      expect(all('.result').length).to eq(10)
    end
  end
end
