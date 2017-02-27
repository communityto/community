class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order('category')
  end

  def show
    @category = Category.find(params[:id])
  end
  
end
