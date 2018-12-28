class Question < ApplicationRecord
  belongs_to :topic
  has_many :sources
  validates_presence_of :text
end
