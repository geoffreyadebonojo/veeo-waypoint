class Source < ApplicationRecord
  belongs_to :question
  has_one :user, through: :question
  has_many :notes
end
