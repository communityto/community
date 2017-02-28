class Space < ApplicationRecord
  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :categories
  has_many :bookings
  has_many :reviews
  has_one :location
  belongs_to :host, :class_name => 'User', :foreign_key => 'host_id'
  has_many :bookings

end
