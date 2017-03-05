class ReviewsController < ApplicationController
  before_action :load_space
  before_action :require_login, only: [:new, :create]

  # why is create using a :space_id? rather than :id params?

  def new
    @review = Review.new
  end

  def index
    @user_reviews = current_user.reviews
  end

  def show
  end

  def create
    @review = @space.reviews.build(review_params)
    @review.user = current_user
    @errorContent = []

    if @review.save
      respond_to do |format|
        format.html { redirect_to space_url(@space.id), notice: 'Review added!'}
        format.json { render json: @review }
      end
    else
      respond_to do |format|
      # format.json { render :json => { :error => @review.errors.full_messages}}
        # format.html {render 'space/show', notice: 'There was an error!'}
        format.js
          @review.errors.any?
          @review.errors.each do |key, value|
          end
      end
    end
  end

  def destroy

    # debugger
    @space = Space.find(params[:id])
    @review = Review.find_by(space_id: @space.id, user_id: current_user.id)
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.js   { render :nothing => true }
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :accuracy, :communication, :facilities, :location)
  end

  def load_space
    @space = Space.find(params[:space_id])
  end
end
