require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    sleep 0.05
    create(:topic, user: User.last)
    visit '/topics'
  end
  let(:user) { User.last }
  let(:topic) { Topic.last }
  
  it "can delete a topic after confirming deletion", :js do
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