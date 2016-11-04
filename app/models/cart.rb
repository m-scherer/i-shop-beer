class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_beer(beer_id)
    contents[beer_id.to_s] ||= 0
    contents[beer_id.to_s] += 1
  end

  def total
    contents.values.sum
  end

  def count_of(beer_id)
    contents[beer_id.to_s]
  end

  def get_quantity_of_beer(beer)
    contents[beer.id.to_s]
  end

end
