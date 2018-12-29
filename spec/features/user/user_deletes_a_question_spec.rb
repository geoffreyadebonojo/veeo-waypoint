require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    sleep 0.05
    create(:topic, user: User.last)
    create(:question, topic: Topic.last)
    visit '/topics'
  end
  let(:user) { User.last }
  let(:topic) { Topic.last }
  let(:questiom) {Question.last}
  
  it "can delete a topic's question after confirming deletion", :js do
    expect(page).to have_css('.questions', visible: :hidden, text: 'What is')
    
    find('.collapsible').click
    sleep 0.05
    within(first('.question')) do
      page.accept_confirm do
        first('.delete-btn').click
      end
    end
  
    expect(current_path).to eq('/topics')
    expect(page).to_not have_css('.questions', visible: :hidden, text: 'What is')
  end
  
  describe 'User dismissing deletion confirmation' do
    it "question does not get deleted", :js do
      expect(page).to have_css('.questions', visible: :hidden, text: 'What is')
      
      find('.collapsible').click
      sleep 0.05
      within(first('.question')) do
        page.dismiss_confirm do
          first('.delete-btn').click
        end
      end

      expect(current_path).to eq('/topics')
      
      find('.collapsible').click
      expect(page).to have_css('.questions', visible: :hidden, text: 'What is')
    end 
  end 
end