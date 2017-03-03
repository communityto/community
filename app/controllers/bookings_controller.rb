class BookingsController < ApplicationController

  before_action do
    @user = current_user
    # @space = Space.find(params[:space_id])
  end

  def index

    @user_bookings = current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.space_id = @space.id
    if @booking.save
      redirect_to space_url(@space)
    end
  end

  def show
  end

  private
  def booking_params
    params.require(:booking).permit(:start_datetime, :end_datetime, :note)
  end

end
