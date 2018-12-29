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

    it 'can not add a blank question' do
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