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


    context '#create_beer_orders' do
      it "can create beer orders" do
        style = Style.create(name: "IPA")
        beer1 = Beer.create(name: "Pallet Jack", style: style, price: 5)
        beer2 = Beer.create(name: "Total Domination", style: style, price: 5)
        cart = Cart.new({beer1.id.to_s => 5, beer2.id.to_s => 1})

        expect(cart.get_quantity_of_beer(beer1)).to eq(5)
      end
    end

    context '#total_oder' do
      it "can total an order" do
        style = Style.create(name: "IPA")
        beer1 = Beer.create(name: "Pallet Jack", style: style, price: 5)
        beer2 = Beer.create(name: "Total Domination", style: style, price: 5)
        user = User.create(email: "brad@yahoo.com", password: "pass")
        order = Order.create(user: user)
        beer_order = BeerOrder.create(beer: beer1, order: order, quantity: 1)
        beer_order = BeerOrder.create(beer: beer2, order: order, quantity: 2)

        expect(order.total_order(order)).to eq(15.00)
      end
    end

    context 'order status' do
      it "marks an order as ordered by default" do
        user = User.create(email: "brad@yahoo.com", password: "pass")
        order = Order.create(user: user)

        expect(order.order_status).to eq("ordered")
      end
      it "can cancel an order" do
        user = User.create(email: "brad@yahoo.com", password: "pass")
        order = Order.create(user: user)

        order.cancelled!
        expect(order.order_status).to eq("cancelled")
      end
      it "can complete an order" do
        user = User.create(email: "brad@yahoo.com", password: "pass")
        order = Order.create(user: user)

        order.completed!
        expect(order.order_status).to eq("completed")

      end
      it "can mark an order as paid" do
        user = User.create(email: "brad@yahoo.com", password: "pass")
        order = Order.create(user: user)

        order.paid!
        expect(order.order_status).to eq("paid")
      end
    end

end
