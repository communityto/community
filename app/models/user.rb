class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, on: :create
  validates :password, confirmation: true, on: :create
  validates :password_confirmation, presence: true, on: :create
  validates :email, presence: true, uniqueness: true
  validates_presence_of :first_name, :last_name


  has_many :reviews, through: :bookings
  has_many :bookings
  has_many :booked_spaces, :class_name => 'Space', through: :bookings, source: :space
  has_many :hosted_spaces, :class_name => 'Space', source: :space, foreign_key: :host_id

end
