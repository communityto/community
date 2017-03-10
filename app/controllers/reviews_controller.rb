class ReviewsController < ApplicationController
  before_action :load_space
  skip_before_action :load_space, only: [:index, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :create]

  def new
    @review = Review.new
  end

  def index
    @user = User.find(params[:user_id])
  end

  def show
  end

  def edit
    @review = Review.find(params[:id])
    respond_to do |format|
      format.json   { render :json => @review }
    end
  end

  def update
    #
    # if params[:increment_helpful_count]
    #   @review.update_attributes(helpful_count: @review.helpful_count + 1)
    # else
    #   ...
    # end

    if @review.save
      respond_to do |format|
        format.html { redirect_to space_url(@space.id), notice: 'Review added!'}
        format.json do
          json_response = {
            review: @review,
            user: @review.user
          }
          render json: json_response
        end
      end
    else
      respond_to do |format|
        format.json { render :json => { :error => @review.errors.full_messages}}
        format.html { render 'space/show', notice: 'There was an error!'}
      end
    end
    # if @review.update_attributes(review_params)
    #   redirect_to space_url(@space.id), notice: "Space successfully updated!"
    # else
    #   flash.now[:alert] = "Failed to update space."
    #   render :edit
    # end
  end

  def create
    @review = @space.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      respond_to do |format|
        format.html { redirect_to space_url(@space.id), notice: 'Review added!'}
        format.json do
          json_response = {
            review: @review,
            user: @review.user,
            space_avg: @space.reviews_avg,
            location_avg: @space.location_avg,
            accuracy_avg: @space.accuracy_avg,
            communication_avg: @space.communication_avg,
            facilities_avg: @space.facilities_avg
          }
          render json: json_response
        end
      end
    else
      respond_to do |format|
        format.json { render :json => { :error => @review.errors.full_messages}}
        format.html { render 'space/show', notice: 'There was an error!'}
      end
    end
  end

  def destroy

    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to space_url(@space.id), notice: 'Review Deleted!'}
      format.json   { render :json => @review }
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :accuracy, :communication, :facilities, :location, :helpful_count)
  end

  def load_space
    @space = Space.find(params[:space_id])
  end
end
