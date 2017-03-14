class BookingsController < ApplicationController
  before_action :require_login

  before_action do
    @user = current_user
  end

  def index
    @user_bookings = current_user.bookings
  end

  def show
  end

  def new
    @space = Space.find(params[:space_id])
    @booking = Booking.new
  end

  def edit
    @booking = Booking.find(params[:id])
    @space = @booking.space
  end

  def update
    @booking_space = Space.find(params[:space_id])
    @booking = Booking.find(params[:id])
    @space = @booking.space
    if @booking.update(booking_params)
      if current_user == @space.host
        redirect_to user_hosted_space_url(@user, @booking_space)
      else
        redirect_to user_bookings_url(user_id: @user.id) # need to find a way for both methods of editing to redirect to different pages
      end
    else
      render 'edit', alert: "This update failed, please try again."
    end
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.space_id = @space.id
    if @booking.save
      redirect_to space_url(@space)
    end
  end

  def approve_booking
    @booking = Booking.find(params[:booking])
    @booking.approved = true
    @booking.save
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :note, :user_id, :approved)
  end

end
