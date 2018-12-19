FactoryBot.define do
  factory :user do
    provider { "Google" }
    google_id { "1" }
    email { "geezy@gmail.com" }
    first_name { "Geezy" }
    last_name { "Adams" }
    image_url { "oiwoehfeufh" }
  end
end
