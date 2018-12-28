require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it "can delete a topic's question after confirming deletion", :js do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    sleep 0.01
    user = User.last
    fill_in 'topic[title]', with: 'Computer Science'
    click_on 'Save'
    sleep 0.01
    within(first(".topic")) do
      fill_in 'question[text]', with: 'What is a query'
      click_on 'Save'
    end
  
    question = Topic.last.questions.last

    expect(page).to have_css('.questions', visible: :hidden, text: 'What is a query')
    
    within(first(".topic")) do
      find('.collapsible').click
      within(first('.question')) do
        page.accept_confirm do
          click_on 'Delete Question'
        end
      end
    end

    expect(current_path).to eq('/topics')
    expect(page).to_not have_css('.questions', visible: :hidden, text: 'What is a query')
  end
end