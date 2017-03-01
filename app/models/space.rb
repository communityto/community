class Space < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader

  validates :title, length: { minimum: 3 }, on: :create
  validates :description, length: { minimum: 50 }, on: :create
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { greater_than: 0 }
  validates :bathrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :size, numericality: { greater_than: 0 }

  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :categories
  has_many :bookings
  has_many :reviews
  has_one :location
  belongs_to :host, :class_name => 'User', :foreign_key => 'host_id'
end
