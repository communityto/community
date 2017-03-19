class SpacePhoto < ApplicationRecord
  mount_uploader :photo, AvatarUploader
  belongs_to :space
end
