class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_one :review
end
