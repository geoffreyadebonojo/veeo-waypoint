class Source < ApplicationRecord
  belongs_to :question
  has_one :topic, through: :question
  has_one :user, through: :question
  has_many :notes, dependent: :destroy

  def params
    attributes
      .except('created_at',
              'updated_at',
              'body',
              'display_url')
  end
end
