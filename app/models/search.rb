class Search
  attr_reader :criteria, :results

  def initialize(params)
    @criteria = []
    @spaces = {}
    @params = params
    populate_spaces
    @results = @spaces
  end

  def populate_spaces
    populate_spaces_from_amenities
    populate_spaces_from_categories
  end

  def populate_spaces_from_amenities
  end

  def populate_spaces_from_categories
  end

end
