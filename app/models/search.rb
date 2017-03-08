class Search
  attr_accessor :results

  def initialize(search_params)
    @potential_results = []
    @params = search_params
    @results = []
    populate_spaces
  end

  def populate_spaces
    @results = @potential_results.inject(&:&)
  end

  def populate_spaces_category
    category_ids = @params[:category_ids].select(&:present?)
    category_ids.each do |category_id|
      @potential_results << Space.all.select{|space| space.category_ids.include?(category_id.to_i)}
    end
      @results = @potential_results.inject(&:&)

      # @results = @potential_results.inject([]) do |total_results, potential_result|
      #   total_results & potential_result
      end
  end

end
