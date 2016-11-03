require 'rails_helper'

RSpec.describe BeerOrder, type: :model do
  context 'relationships' do
    it "has one beer" do
      beer_order = BeerOrder.new

      expect(beer_order).to respond_to(:beer)
      expect(beer_order).to_not respond_to(:beers)
    end
    it "has one order" do
      beer_order = BeerOrder.new

      expect(beer_order).to respond_to(:order)
      expect(beer_order).to_not respond_to(:orders)
    end
  end
end
