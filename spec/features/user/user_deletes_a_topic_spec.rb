require 'rails_helper'

RSpec.feature "User visiting topic index page", type: :feature do
  it "can delete a topic after confirming deletion", :js do
    user  = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/topics'
    fill_in 'topic[title]', with: 'Computer Sience'
    click_on 'Save'
    topic = user.topics.last

    expect(page).to have_content(topic.title)

    within(first('.topic')) do
      click_button 'Delete Topic'
    end

    # page.accept_alert "Are you sure you want to delete everything of #{topic.title}?" do
    #   click_on 'OK'
    # end

    expect(current_path).to eq('/topics')
    expect(page).to_not have_content(topic.title)
  end
end
