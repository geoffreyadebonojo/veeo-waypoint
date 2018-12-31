class Source < ApplicationRecord
  belongs_to :question
  has_one :user, through: :question
end
