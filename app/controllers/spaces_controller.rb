class SpacesController < ApplicationController
  #before_action :require_login, only: [:new, :create]
  before_action :load_space

  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])

    if current_user
      @review = Review.new
    end

    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  def new
    @space = Space.new
    @space.avatar = params[:file]
  end

  def create
    @space = Space.new(space_params)

      if @space.save
        redirect_to spaces_url
      else
        render :new
      end
  end

  def destroy
    @space = Space.find(params[:id])
    space.destroy
    redirect_to spaces_url
  end

  private

  def space_params
    params.require(:space).permit(:title, :description, :address, :check_in, :check_out, :rules, :capacity, :bathrooms, :price, :size, {avatars: []})
  end

  def load_space
    @space = Space.find(params[:id])
  end

end
