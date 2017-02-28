class ReviewsController < ApplicationController

  before_action :load_space

  def new
    @review = Review.new
  end

  def show
  end
  
  def create
    @review = @space.reviews.build(reviews_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to space_url(@space.id), notice: "Review added!"}
        format.js
      else
        format.html {render 'space/show', notice: "Zere was an error!"}
        format.js
      end
    end
  end

  def destroy
  end


private

  def review_params
    params.require(:review).permit(:content, :title)
  end

  def load_space
    @space = Space.find(params[:id])
  end

end
