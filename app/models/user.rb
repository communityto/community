class User < ApplicationRecord
  has_many :bookings
  has_many :reviews
  has_many :spaces, foreign_key: :host_id
end
