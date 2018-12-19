require 'rails_helper'

# As a User
# When I visit my dashboard
# I see a list of existing topics
# and for each topic, I see a prompt to add new questions
# When I click on a topic, I am taken to its show page

RSpec.describe "User visiting the dashboard path" do

  it "can see user's topics" do
    user = create(:user)
    topic_1 = create(:topic, user:user)
    topic_2 = create(:topic, user:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/dashboard'

    expect(page).to have_current_path(dashboard_path)
    expect(page).to have_content(topic_1.name)
    expect(page).to have_content(topic_2.name)
  end

end
