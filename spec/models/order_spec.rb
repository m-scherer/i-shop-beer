require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'relationships' do
    it "has one user" do
      order = Order.new

      expect(order).to respond_to(:user)
      expect(order).to_not respond_to(:users)
    end
    it "has many beer orders" do
      order = Order.new

      expect(order).to respond_to(:beer_orders)
      expect(order).to_not respond_to(:beer_order)
    end
    it "has many beers" do
      order = Order.new

      expect(order).to respond_to(:beers)
      expect(order).to_not respond_to(:beer)
    end
  end
end
