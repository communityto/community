class SpacePhoto < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  belongs_to :space
  validates :photo, presence: true
  #validates :space_id, presence: true
end
