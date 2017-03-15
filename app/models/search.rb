class Search
  attr_accessor :results

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
    populate_spaces_location
    @results = @potential_results.inject(&:&)
  end

  def populate_spaces_location
    @nearby_spaces = []
    space_address = Address.near(@params[:address], 1)
    space_address.each do |address|
      @nearby_spaces << address.space
    end
    @potential_results << @nearby_spaces
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
