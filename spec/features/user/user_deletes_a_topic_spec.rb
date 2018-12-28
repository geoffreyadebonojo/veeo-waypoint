require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it "can delete a topic after confirming deletion", :js do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    sleep 0.03
    user = User.last
    fill_in 'topic[title]', with: 'Computer Science'
    click_on 'Save'
    sleep 0.03
    topic = user.topics.last

    expect(page).to have_content(topic.title)

    within(first('.topic')) do
      page.accept_confirm do
        click_on 'Delete Topic'
      end
    end

    expect(current_path).to eq('/topics')
    expect(page).to_not have_content(topic.title)
  end
  
  describe 'User dismissing deletion confirmation' do
    it "topic does not get deleted", :js do
      stub_oauth_user
      visit '/'
      click_on 'Sign in with Google'
      sleep 0.01
      user = User.last
      fill_in 'topic[title]', with: 'Computer Science'
      click_on 'Save'
      sleep 0.01
      topic = user.topics.last

      expect(page).to have_content(topic.title)

      within(first('.topic')) do
        page.dismiss_confirm do
          click_on 'Delete Topic'
        end
      end

      expect(current_path).to eq('/topics')
      expect(page).to have_content(topic.title)
    end
  end
end