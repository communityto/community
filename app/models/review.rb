class Review < ApplicationRecord
  # validates_presence_of :content

  belongs_to :user
  belongs_to :space
  # belongs_to :booking
end
