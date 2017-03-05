class User < ActiveRecord::Base
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  validates_format_of :email, :with => /\A(\S+)@(.+)\.(\S+)\z/
  validates :first_name, length: { minimum: 2 }, on: :create
  validates :last_name, length: { minimum: 2 }, on: :create
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true

  has_many :reviews
  has_many :bookings
  has_many :booked_spaces, :class_name => 'Space', through: :bookings, source: :space
  has_many :hosted_spaces, :class_name => 'Space', source: :space, foreign_key: :host_id

  has_many :favourites
  has_many :favourite_spaces, through: :favourites, source: :favourited, source_type: 'Space'

end
