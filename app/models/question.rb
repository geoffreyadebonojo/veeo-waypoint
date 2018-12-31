class Question < ApplicationRecord
  belongs_to :topic
  has_one :user, through: :topic
  has_many :sources, dependent: :destroy
  validates_presence_of :text
end
