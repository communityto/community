class Space < ApplicationRecord
  mount_uploaders :avatars, AvatarUploader

  validates :title, length: { minimum: 3 }, on: :create
  validates :description, length: { minimum: 50 }, on: :create
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :capacity, numericality: { greater_than: 0 }
  validates :bathrooms, numericality: { greater_than_or_equal_to: 0 }
  validates :size, numericality: { greater_than: 0 }

  has_and_belongs_to_many :amenities
  has_and_belongs_to_many :categories
  has_many :bookings
  has_many :reviews
  has_one :location
  belongs_to :host, :class_name => 'User', :foreign_key => 'host_id'

  def all_booked_dates
    booked_dates = []
    bookings.where(approved: true).each do |b| # Iterates over all approved bookings for particular space.
      booked_dates.push(*b.unavailable_dates)
    end
    return booked_dates
  end

  def display_date(datetime)
    datetime.strftime("%Y-%m-%d")
  end

  def accuracy_avg
    accuracy_sum = reviews.sum(:accuracy)
    accuracy_count = reviews.count(:accuracy)
    accuracy_avg = accuracy_sum / accuracy_count
  end

  def communication_avg
    communication_sum = reviews.sum(:communication)
    communication_count = reviews.count(:communication)
    communication_avg = communication_sum / communication_count
  end

  def facilities_avg
    facilities_sum = reviews.sum(:facilities)
    facilities_count = reviews.count(:facilities)
    facilities_avg = facilities_sum / facilities_count
  end

  def location_avg
    location_sum = reviews.sum(:location)
    location_count = reviews.count(:location)
    location_avg = location_sum / location_count
  end

  # def communication_avg
  #   review_communication_sum = @reviews.sum(:communication)
  #   review_communication_count = @reviews.count(:communication)
  #   review_communication_avg = review_communication_sum / review_communication_count
  # end
  #
  # def facilities_avg
  #   review_facilities_sum = @reviews.sum(:facilities)
  #   review_facilities_count = @reviews.count(:facilities)
  #   review_facilities_avg = review_facilities_sum / review_facilities_count
  # end
  #
  # def location_avg
  #   review_location_sum = @reviews.sum(:location)
  #   review_location_count = @reviews.count(:location)
  #   review_location_avg = review_location_sum / review_location_count
  # end

end
