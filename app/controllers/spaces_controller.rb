class SpacesController < ApplicationController
  #before_action :require_login, only: [:new, :create]

  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])

    @review_accuracy_avg = review_accuracy_avg
    @review_communication_avg = review_communication_avg
    @review_facilities_avg = review_facilities_avg
    @review_location_avg = review_location_avg

    if current_user
      @review = Review.new
    else
      render :login_path
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

  def edit
    @space = Space.find(params[:id])
  end

  def update
    @space = Space.find(space_params)
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

  def find_review
    Review.where(:space_id => (params[:id]))
  end

  def review_accuracy_avg
    review_accuracy_sum = find_review.sum(:accuracy)
    review_accuracy_count = find_review.count(:accuracy)
    review_accuracy_avg = review_accuracy_sum / review_accuracy_count
  end

  def review_communication_avg
    review_communication_sum = find_review.sum(:communication)
    review_communication_count = find_review.count(:communication)
    review_communication_avg = review_communication_sum / review_communication_count
  end

  def review_facilities_avg
    review_facilities_sum = find_review.sum(:facilities)
    review_facilities_count = find_review.count(:facilities)
    review_facilities_avg = review_facilities_sum / review_facilities_count
  end

  def review_location_avg
    review_location_sum = find_review.sum(:location)
    review_location_count = find_review.count(:location)
    review_location_avg = review_location_sum / review_location_count
  end


end
