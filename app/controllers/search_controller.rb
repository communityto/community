class SearchController < ApplicationController

  def results
    @search = Search.new(params)
  end

end
