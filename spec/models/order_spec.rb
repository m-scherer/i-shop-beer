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
    it "can create beer orders" do
      style = Style.create(name: "IPA")
      beer1 = Beer.create(name: "Pallet Jack", style: style, price: 5)
      beer2 = Beer.create(name: "Total Domination", style: style, price: 5)
      cart = Cart.new({beer1.id.to_s => 5, beer2.id.to_s => 1})

      expect(cart.get_quantity_of_beer(beer1)).to eq(5)
    end
  end

end
