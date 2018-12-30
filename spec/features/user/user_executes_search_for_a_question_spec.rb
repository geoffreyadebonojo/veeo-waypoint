require 'rails_helper'

RSpec.feature "Topics Index Page", type: :feature do
  before do
    stub_oauth_user
    visit '/'
    click_on 'Sign in with Google'
    create(:topic, user: User.last)
  end
  let(:user) { User.last }
  let(:topic) { Topic.last }

  it 'can execute a search for a specific question', :vcr do
    question = create(:question, topic: topic)
    visit '/topics' 
    within(first('.question', visible: :hidden)) do
      find('.search-link', visible: :hidden).click
    end

    expect(current_path).to eq('/search')
    expect(page).to have_content(question.text)
    expect(all('.result').length).to eq(10)
  end
end