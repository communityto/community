class Space < ApplicationRecord
  has_and_belongs_to_many :amenities
  has_many :reviews
  has_one :location
end
