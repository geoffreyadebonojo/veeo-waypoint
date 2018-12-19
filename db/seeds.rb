require 'factory_bot_rails'



3.times do
  FactoryBot.create :user
end

5.times do
  FactoryBot.create(:topic, user_id: 1)
end

5.times do
  FactoryBot.create(:topic, user_id: 2)
end

5.times do
  FactoryBot.create(:topic, user_id: 3)
end
