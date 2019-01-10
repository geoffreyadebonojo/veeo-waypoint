require 'rails_helper'

RSpec.feature "Topic Index Page", type: :feature do
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

  describe "User visiting topic index page" do

    context "who deletes a topic", :js do
      context "and accepts confirmation" do
        it "sees the topic removed from topic list" do
          expect(page).to have_content(topic.title)

          within(first('.topic')) do
            page.accept_confirm do
              first('.delete-topic-btn').click
              # click_on 'Delete Topic'
            end
          end

          expect(current_path).to eq('/topics')
          expect(page).to_not have_content(topic.title)
        end
      end

      context "and dismisses confirmation" do
        it "topic does not get deleted" do
          expect(page).to have_content(topic.title)

          within(first('.topic')) do
            page.dismiss_confirm do
              first('.delete-topic-btn').click
              # click_on 'Delete Topic'
            end
          end

          expect(current_path).to eq('/topics')
          expect(page).to have_content(topic.title)
        end
      end
    end

    it "edits a topic's title and sees the new title" do
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
end
