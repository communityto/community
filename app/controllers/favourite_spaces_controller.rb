class FavouriteSpacesController < ApplicationController
  # before_action :set_space

  def index
    @user = current_user
    @favourite_spaces = @user.favourite_spaces
  end

  def create
    @space = Space.find(params[:space_id] || params[:id])
    if Favourite.create(favourited: @space, user: current_user)
      redirect_to @space, notice: 'Space has been added to your favourites!'
    else
      redirect_to @space, alert: 'Something went wrong...*sad panda*'
    end
  end

  def destroy
    @space = Space.find(params[:space_id] || params[:id])
    Favourite.where(favourited_id: @space.id, user_id: current_user.id).first.destroy
    redirect_to user_path, notice: 'Space has been removed from your favourites'
  end

  private

  # def set_space
  #   @space = Space.find(params[:space_id] || params[:id])
  # end
end
