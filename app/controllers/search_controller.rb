class SearchController < ApplicationController

  def results
    @search = Search.new(search_params)
  end

  private
  def search_params
    params.require(:search).permit(:start_time, :end_time, :capacity, :amenity_ids => [], :category_ids => [])
  end

end
