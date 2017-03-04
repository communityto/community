class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :favourited, polymorphic: true

  validates :favourited_id, uniqueness: true
end
