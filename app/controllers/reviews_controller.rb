class ReviewsController < ApplicationController

  before_action :load_space
  # why is create using a :space_id? rather than :id params?

  def new
    @review = Review.new
  end

  def index
  end

  def show
  end

  def create
    @review = @space.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to space_url(@space.id), notice: 'Review added!'}
        format.js  # server will look at comment/create.js.erb
      else
        format.html {render 'space/show', notice: 'There was an error!'}
        format.js
      end
    end
  end

  def destroy
  end


private

  def review_params
    params.require(:review).permit(:content)
  end


  def load_space
    @space = Space.find(params[:space_id])
  end

end
