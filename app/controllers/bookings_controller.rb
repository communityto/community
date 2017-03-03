class BookingsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  before_action do
    @space = Space.find(params[:space_id])
  end

  def index
    @bookings = @space.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space_id = @space.id
    if @booking.save
      redirect_to space_url(@space)
    end
  end

  def show
  end

  private
  def booking_params
    params.require(:booking).permit(:start_datetime, :end_datetime, :note, :user_id)
  end

end
