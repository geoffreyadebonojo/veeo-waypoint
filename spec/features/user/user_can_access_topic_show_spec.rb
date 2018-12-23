require 'rails_helper'

RSpec.feature "User topic management", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    binding.pry
    click_on 'Sign in with Google'
    create(:topic, user: User.last)
  end
  let(:topic) { Topic.last }

  describe 'user visiting topic index page' do
    it 'can click on a topic and go to show page' do

      visit '/topics'

      within(first(".topic")) do
        fill_in 'question[text]', with: 'What is a query'
        click_on 'Save'
      end

      click_on topic.title

      expect(current_path).to eq("/topics/#{topic.id}")

      expect(page).to have_content(topic.title)
      expect(page).to have_content(topic.questions.first.text)
    end
  end

  describe 'user visiting topic show page' do
    it 'sees each question' do
      questions = create_list(:question, 2, topic: topic)
      source_1  = create(:source, question: questions[0])
      source_2  = create(:source, question: questions[1])

      visit "/topics/#{topic.id}"

      within(first(".question")) do
        expect(page).to have_content(topic.questions.first.text)
        expect(page).to have_content(source_1.title)
        expect(page).to have_content(source_1.display_url)
        expect(page).to have_content(source_1.snippet)
      end

      within(all(".question")[1]) do
        expect(page).to have_content(topic.questions.last.text)
        expect(page).to have_content(source_2.url)
      end
    end
  end

















end
