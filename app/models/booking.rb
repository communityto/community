class Booking < ApplicationRecord
  validates :start_datetime, uniqueness: true
  validates :end_datetime, uniqueness: true

  belongs_to :user
  belongs_to :space
  has_one :review
end
