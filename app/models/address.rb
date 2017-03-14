class Address < ApplicationRecord
  geocoded_by :full_address
  # after_validation :geocode, if: ->(obj){ obj.street_address.present? and obj.street_address_changed? }

  belongs_to :space

  def full_address
    [street_address, city, province].compact.join(', ')
  end

end
