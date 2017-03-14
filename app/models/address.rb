class Address < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode

  belongs_to :space

  def full_address
    [:street_address, :city, :province].compact.join(', ')
  end

end
