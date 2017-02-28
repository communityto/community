class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order('type')
  end

  def show
    @category = Category.find(params[:id])
  end

end
