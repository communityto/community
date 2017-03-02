class ReviewsController < ApplicationController
  before_action :load_space

  # def index
  #   @review = Review.all
  # end

  def new
    @review = Review.new
  end

  def create
    @review = @space.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
    if @review.save
      format.html { redirect_to space_url(@space.id), notice: 'Review added!'}
      format.js {} # server will look at comment/create.js.erb
    else
      format.html {render 'space/show', notice: 'Zere was an error!'}
      format.js {}
    end
  end

  end

  def show
    # @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:content)
  end

  def load_space
    @space = Space.find(params[:space_id])
  end
end
