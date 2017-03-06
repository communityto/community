class SpacesController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :load_space
  skip_before_action :load_space, only: [:index, :new, :create]

  def load_space
    @space = Space.find(params[:id])
  end

  def index
    @spaces = Space.all
  end

  def show
    @reviews = @space.reviews
    @review = Review.new
    @booking = Booking.new

    respond_to do |format|
      format.html
      format.json
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

  def edit
  end

  def update
    if @space.update_attributes(space_params)
      redirect_to space_url, notice: "Space successfully updated!"
    else
      flash.now[:alert] = "Failed to update space."
      render :edit
    end
  end

  def destroy
    space.destroy
    redirect_to spaces_url
  end

  private

  def space_params
    params.require(:space).permit(:title, :description, :address, :check_in, :check_out, :rules, :capacity, :bathrooms, :price, :size, :host_id, {avatars: []}, :amenity_ids => [], :category_ids => [])
  end

end
