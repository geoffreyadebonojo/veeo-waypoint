require 'rails_helper'

RSpec.describe "User visiting the topics path" do
  it "can see user's topics" do
    user = create(:user)
    topic_1 = create(:topic, user:user)
    topic_2 = create(:topic, user:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit '/topics'

    expect(page).to have_current_path(topics_path)
    expect(page).to have_content(topic_1.title)
    expect(page).to have_content(topic_2.title)
  end
end