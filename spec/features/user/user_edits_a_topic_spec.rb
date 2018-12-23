require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it "can edit a topic's title" do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    
    user = User.last
    topic = create(:topic, user: user)
    
    visit '/topics'
    
    expect(page).to have_content(topic.title)
    
    within(first('.topic')) do
      fill_in 'topic[title]', with: 'Computer Sience'
      click_on 'Update'
    end
    
    expect(current_path).to eq('/topics')
    expect(page).to have_content('Computer Sience')
    expect(page).to_not have_content(topic.title)
  end
end
