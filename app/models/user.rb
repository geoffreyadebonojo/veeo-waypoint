class User < ApplicationRecord

  has_many :topics

  def self.find_or_create_from_auth(auth)
		where(provider: auth.provider, google_id: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.google_id = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
			user.image_url = auth.info.image
			user.save!
		end
	end
end
