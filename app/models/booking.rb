class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_one :review

  def find_booked_space
    @user = User.find(2)
    booked = @user.bookings
    space_id = booked.pluck(:space_id)
    spaces = Space.find(space_id)
    # spaces.each { |s| s.title }
  end

end
