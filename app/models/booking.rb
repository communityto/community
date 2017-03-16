class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_one :review

  # def approve_booking
  #   approved = true
  # end

  def unavailable_dates
    booking_dates = []
    start = (start_time + 1.days).to_datetime
    finish = (end_time + 1.days).to_datetime
    (start..finish).each do |d|
      booking_dates << d.to_s
    end
    return booking_dates
  end

  def unavailable_dates_host
    booking_dates = []
    start = (start_time).to_datetime
    finish = (end_time).to_datetime
    (start..finish).each do |d|
      booking_dates << d.to_s
    end
    return booking_dates
  end

end
