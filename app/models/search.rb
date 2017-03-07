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
    populate_spaces_from_categories
  end

  def populate_spaces_from_categories
    Category.all.each do |category_class|
      next unless @params[category_class]
      @criteria << criteria = { category: :categories, criteria: Category.find(category).name }
      Space.send(category).find_each do |space|
        space_data = { space: space, criteria: criteria }
        add_space_to_results(space_data)
      end
    end
  end

  def add_space_to_results(space_data)
    space_id = space_data[:space].id
    create_result(space_id, space_data) unless @spaces[space_id]
    add_criteria_to_result(space_id, space_data)
  end

  def add_criteria_to_result(space_id, space_data)
    @spaces[space_id][:criteria] << space_data[:criteria]
  end

end
