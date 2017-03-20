class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :favourited, polymorphic: true #is this necessary?

end
