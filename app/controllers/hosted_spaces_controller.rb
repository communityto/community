class HostedSpacesController < ApplicationController
  # before_action :require_login

  def index
  @user = User.find(params[:user_id])
  @hosted_spaces = current_user.hosted_spaces
  end

  def show
  @user = current_user
  @hosted_space = Space.find(params[:id])
  @hosted_space_bookings = Space.find(params[:id]).bookings
  end
end
