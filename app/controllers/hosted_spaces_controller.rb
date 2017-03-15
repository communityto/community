class HostedSpacesController < ApplicationController
  # before_action :require_login

  def index
    @user = User.find(params[:user_id])
    @hosted_spaces = @user.hosted_spaces
  end

  def show
    @user = current_user
    @hosted_space = Space.find(params[:id])
    @hosted_space_bookings = Space.find(params[:id]).bookings
    @approved_bookings = Booking.where(["space_id = ? and approved = ?", "21", "true"])
  end

  def disable_date
    @hosted_space = Space.find(params[:id])
    @hosted_space.disabled_dates << params[:disabled_date].to_time.iso8601
    @hosted_space.save!
  end

  def enable_date
    @hosted_space = Space.find(params[:id])
    @hosted_space.disabled_dates.delete(params[:enabled_date].to_time.iso8601)
    @hosted_space.save!
  end

  private

  def booking_params
    params.require(:booking).permit(:id)
  end
end
