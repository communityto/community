class Search
  attr_reader :results

  def initialize(search_params)
    @potential_results = []
    @results = []
    @params = search_params
    populate_spaces
  end

  def populate_spaces
    populate_spaces_category
    populate_spaces_amenity
    populate_spaces_capacity
    populate_spaces_availability
    @results = @potential_results.inject(&:&)
  end

  def populate_spaces_availability
    available_dates = []
    start = @params[:start_time].to_datetime
    finish = @params[:end_time].to_datetime
    (start..finish).each do |date|
      available_dates << date.iso8601
    end
    @potential_results << Space.all.select{|space| (space.all_disabled_dates & available_dates).empty? }
    byebug
  end

  def populate_spaces_category
    category_ids = @params[:category_ids].select(&:present?)
    category_ids.each do |category_id|
      @potential_results << Space.all.select{|space| space.category_ids.include?(category_id.to_i)}
    end
  end

  def populate_spaces_amenity
    amenity_ids = @params[:amenity_ids].select(&:present?)
    amenity_ids.each do |amenity_id|
      @potential_results << Space.all.select{|space| space.amenity_ids.include?(amenity_id.to_i)}
    end
  end

  def populate_spaces_capacity
    @potential_results << Space.all.select{|space| space.capacity > @params[:capacity].to_i }
  end

end
