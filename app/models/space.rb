class Space < ApplicationRecord

  validates :title, length: { minimum: 1 }, on: :create
  validates :description, length: { minimum: 1 }, on: :create
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { greater_than: 0 }
  validates :bathrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :size, numericality: { greater_than: 0 }

  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :categories
  has_many :bookings
  has_many :reviews
  has_one :address
  accepts_nested_attributes_for :address
  belongs_to :host, :class_name => 'User', :foreign_key => 'host_id'
  has_many :space_photos, dependent: :destroy
  accepts_nested_attributes_for :space_photos

  def all_disabled_dates
    disabled_dates_user = []
    disabled_dates.each do |date|
      disabled_dates_user << (date.to_datetime + 1.days).to_s
    end
    disabled_dates_user + booking_disabled_dates
  end

  def all_disabled_dates_host
    disabled_dates + booking_disabled_dates_host
  end

  def booking_disabled_dates
    booked_dates = []
    bookings.where(approved: true).each do |b| # Iterates over all approved bookings for particular space.
      booked_dates.push(*b.unavailable_dates)
    end
    return booked_dates
  end

  def booking_disabled_dates_host
    booked_dates = []
    bookings.where(approved: true).each do |b| # Iterates over all approved bookings for particular space.
      booked_dates.push(*b.unavailable_dates_host)
    end
    return booked_dates
  end

  def display_date(datetime)
    datetime.strftime("%Y-%m-%d")
  end

  def accuracy_avg
    accuracy_sum = reviews.sum(:accuracy)
    accuracy_count = reviews.count(:accuracy)
      if accuracy_count > 0
        accuracy_avg = accuracy_sum / accuracy_count
      else
        accuracy_avg = "-"
      end
  end

  def communication_avg
    communication_sum = reviews.sum(:communication)
    communication_count = reviews.count(:communication)
      if communication_count > 0
        communication_avg = communication_sum / communication_count
      else
        communication_avg = "-"
      end
  end

  def facilities_avg
    facilities_sum = reviews.sum(:facilities)
    facilities_count = reviews.count(:facilities)
      if facilities_count > 0
        facilities_avg = facilities_sum / facilities_count
      else
        facilities_avg = "-"
      end
  end

  def location_avg
    location_sum = reviews.sum(:location)

    location_count = reviews.count(:location)
      if location_count > 0
        location_avg = location_sum / location_count
      else
        location_avg = "-"
      end

  end

  def reviews_avg
    rev_array = reviews.pluck(:accuracy, :communication, :facilities, :location)
    rev_flat = rev_array.map(&:sum)
    rev_total = rev_flat.sum
    rev_flat = rev_array.flatten
    rev_count = rev_flat.count

    if rev_count > 0
      reviews_avg = rev_total / rev_count
    else
      reviews_avg = "No reviews to average!"
    end
  end

end
