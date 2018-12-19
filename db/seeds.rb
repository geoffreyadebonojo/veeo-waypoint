require 'factory_bot_rails'

3.times do
  user = FactoryBot.create :user
  5.times { FactoryBot.create(:topic, user: user) }
end
