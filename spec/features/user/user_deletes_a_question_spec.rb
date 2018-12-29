require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it "can delete a topic's question after confirming deletion", :js do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    sleep 0.05
    user = User.last
    topic = create(:topic, user: user)
    question = create(:question, topic: topic)
    visit '/topics'
    expect(page).to have_css('.questions', visible: :hidden, text: 'What is')
    
    within(first('.question', visible: :hidden)) do
      page.accept_confirm do
        find('.delete-link', visible: :hidden).click
      end
    end
  
    expect(current_path).to eq('/topics')
    expect(page).to_not have_css('.questions', visible: :hidden, text: 'What is')
  end
  
  describe 'User dismissing deletion confirmation' do
    xit "question does not get deleted", :js do
      stub_oauth_user
      visit '/'
      click_on 'Sign in with Google'
      sleep 0.05
      user = User.last
      topic = create(:topic, user: user)
      question = create(:question, topic: topic)
      visit '/topics'
      expect(page).to have_css('.questions', visible: :hidden, text: 'What is')
      
      within(first('.question', visible: :hidden)) do
        page.dismiss_confirm do
          find('.delete-link', visible: :hidden).click
        end
      end
    
      expect(current_path).to eq('/topics')
      expect(page).to have_css('.questions', visible: :hidden, text: 'What is')
    end 
  end 
end