class Note < ApplicationRecord
  belongs_to :source
  has_one :user, through: :source
end
