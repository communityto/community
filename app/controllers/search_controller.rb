class SearchController < ApplicationController

  def results
    @search = Search.new(search_params)
  end

  private
  
  def search_params
    params.require(:search).permit(:address, :start_time, :end_time, :distance, :capacity, :amenity_ids => [], :category_ids => [])
  end

end
